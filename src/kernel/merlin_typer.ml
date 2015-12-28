(* {{{ COPYING *(

  This file is part of Merlin, an helper for ocaml editors

  Copyright (C) 2013 - 2015  Frédéric Bour  <frederic.bour(_)lakaban.net>
                             Thomas Refis  <refis.thomas(_)gmail.com>
                             Simon Castellan  <simon.castellan(_)iuwt.fr>

  Permission is hereby granted, free of charge, to any person obtaining a
  copy of this software and associated documentation files (the "Software"),
  to deal in the Software without restriction, including without limitation the
  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
  sell copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  The Software is provided "as is", without warranty of any kind, express or
  implied, including but not limited to the warranties of merchantability,
  fitness for a particular purpose and noninfringement. In no event shall
  the authors or copyright holders be liable for any claim, damages or other
  liability, whether in an action of contract, tort or otherwise, arising
  from, out of or in connection with the software or the use or other dealings
  in the Software.

)* }}} *)

open Std

type ('item, 'ast) step = {
  ast: 'ast;
  env: Env.t;
  result: 'item * Types.signature;
  delayed_checks: Typecore.delayed_check list;
  errors: exn list;
  snapshot: Btype.snapshot;
}

type steps = [
  | `Signature of
      (Typedtree.signature_item list, Parsetree.signature_item) step list *
      Parsetree.signature_item list
  | `Structure of
      (Typedtree.structure_item list, Parsetree.structure_item) step list *
      Parsetree.structure_item list
]

type tree = [
  | `Signature of Typedtree.signature
  | `Structure of Typedtree.structure
]

type t = {
  reader: Merlin_reader.t;
  mutable steps: steps;
  extensions: String.Set.t;
  btype_cache: Btype.cache;
  env_cache: Env.cache;
}

let type_signature env sg =
  let sg = Typemod.transl_signature env [sg] in
  (sg.Typedtree.sig_items,
   sg.Typedtree.sig_type),
  sg.Typedtree.sig_final_env

let type_structure env str =
  let str, _, env = Typemod.type_structure env [str] Location.none in
  (str.Typedtree.str_items,
   str.Typedtree.str_type),
  env

let type_steps type_fun items env =
  let caught = ref [] in
  Parsing_aux.catch_warnings caught @@ fun () ->
  Typing_aux.catch_errors caught    @@ fun () ->
  Typecore.delayed_checks := [];
  let renv = ref env in
  let type_item ast =
    let env = !renv in
    let result, env =
      try type_fun env ast
      with exn ->
        caught := exn :: !caught;
        ([], []), env
    in
    let item = {
      ast; result; env;
      delayed_checks = !Typecore.delayed_checks;
      errors = !caught;
      snapshot = Btype.snapshot ();
    } in
    renv := env;
    caught := [];
    Typecore.delayed_checks := [];
    item
  in
  List.map ~f:type_item items

let rec update_steps acc = function
  | step :: steps, item :: items
    when Btype.is_valid step.snapshot && step.ast = item ->
    update_steps (step :: acc) (steps, items)
  | _, items -> List.rev acc, items

let update_steps steps = function
  | `Structure items ->
    let steps = match steps with
      | `Structure (steps, _) -> steps
      | _ -> []
    in
    `Structure (update_steps [] (steps, items))
  | `Signature items ->
    let steps = match steps with
      | `Signature (steps, _) -> steps
      | _ -> []
    in
    `Signature (update_steps [] (steps, items))

let with_typer t f =
  let open Fluid in
  let' (from_ref Btype.cache) t.btype_cache @@ fun () ->
  let' (from_ref Env.cache)   t.env_cache f

let is_valid t =
  with_typer t Env.check_cache_consistency

let processed_ast reader =
  Ast_mapper.cache := Ast_mapper.new_cache ();
  match Merlin_reader.result reader with
  | `Signature sigs ->
    `Signature (Pparse.apply_rewriters_sig ~tool_name:"merlin" sigs)
  | `Structure strs ->
    `Structure (Pparse.apply_rewriters_str ~tool_name:"merlin" strs)

let make reader extensions =
  let btype_cache = Btype.new_cache () in
  let env_cache = Env.new_cache
      ~unit_name:(Merlin_source.name (Merlin_reader.source reader)) in
  { reader; extensions; btype_cache; env_cache;
    steps = update_steps `None (processed_ast reader) }

let update reader t =
  if not (is_valid t) then
    make reader t.extensions
  else if t.reader == reader then
    t
  else if Merlin_reader.compare reader t.reader = 0 then
    {t with reader}
  else
    let steps = update_steps t.steps (processed_ast reader) in
    {t with reader; steps}

let sig_loc item = item.Parsetree.psig_loc
let str_loc item = item.Parsetree.pstr_loc

let select_items loc_fun offset =
  let rec aux acc = function
    | item :: items
      when (loc_fun item).Location.loc_start.Lexing.pos_cnum <= offset ->
      aux (item :: acc) items
    | rest -> List.rev acc, rest
  in
  aux []

let resume_steps t steps =
  match List.last steps with
  | Some step ->
    Btype.backtrack step.snapshot;
    step.env
  | None ->
    Raw_typer.fresh_env ()
    |> Env.open_pers_signature "Pervasives"
    |> Extension.register t.extensions


let force_steps ?(pos=`End) t =
  let `Offset offset = Merlin_source.get_offset
      (Merlin_reader.source t.reader) pos in
  with_typer t @@ fun () ->
  let steps =
    match t.steps with
    | `Structure (steps, items) ->
      let env = resume_steps t steps in
      let items, rest = select_items str_loc offset items in
      let steps' = type_steps type_structure items env in
      `Structure (steps @ steps', rest)
    | `Signature (steps, items) ->
      let env = resume_steps t steps in
      let items, rest = select_items sig_loc offset items in
      let steps' = type_steps type_signature items env in
      `Signature (steps @ steps', rest)
  in
  t.steps <- steps;
  steps

(* Public API *)

let result ?pos t =
  let prepare steps =
    let results = List.map ~f:(fun x -> x.result) steps in
    let items, types = List.split results in
    List.concat items, List.concat types
  in
  match force_steps ?pos t with
  | `Structure (steps, _) ->
    let env = resume_steps t steps in
    let items, types = prepare steps in
    `Structure {
      Typedtree.
      str_items = items;
      str_type = types;
      str_final_env = env;
    }
  | `Signature (steps, _) ->
    let env = resume_steps t steps in
    let items, types = prepare steps in
    `Signature {
      Typedtree.
      sig_items = items;
      sig_type = types;
      sig_final_env = env;
    }

let errors ?pos t =
  let prepare steps = List.concat_map ~f:(fun x -> x.errors) steps in
  match force_steps ?pos t with
  | `Structure (steps, _) -> prepare steps
  | `Signature (steps, _) -> prepare steps

let checks ?pos t =
  let prepare steps = List.concat_map ~f:(fun x -> x.delayed_checks) steps in
  let checks = match force_steps ?pos t with
    | `Structure (steps, _) -> prepare steps
    | `Signature (steps, _) -> prepare steps
  in
  Typecore.delayed_checks := checks;
  let caught = ref [] in
  Parsing_aux.catch_warnings caught
    (fun () -> Typing_aux.catch_errors caught Typecore.force_delayed_checks);
  Typecore.delayed_checks := [];
  !caught

let env ?pos t =
  match force_steps ?pos t with
  | `Structure (steps, _) -> resume_steps t steps
  | `Signature (steps, _) -> resume_steps t steps

let extensions t = t.extensions

let to_browse = function
  | `Signature s -> Merlin_browse.of_signature s
  | `Structure s -> Merlin_browse.of_structure s

let node_at ?(skip_recovered=false) typer pos_cursor =
  let structures =
    to_browse (result ~pos:(`Logical (Lexing.split_pos pos_cursor)) typer) in
  let rec select = function
    (* If recovery happens, the incorrect node is kept and a recovery node
       is introduced, so the node to check for recovery is the second one. *)
    | List.More ((_,node), (List.More ((_,node'), _) as ancestors))
      when Merlin_browse.is_recovered node' -> select ancestors
    | l -> l
  in
  match Merlin_browse.deepest_before pos_cursor [structures] with
  | Some path when skip_recovered -> select path
  | Some path -> path
  | None -> List.One (env typer, Browse_node.Dummy)

let reader t = t.reader

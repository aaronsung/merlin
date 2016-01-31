open MenhirSdk.Cmly_format
open Utils

let menhir = "MenhirInterpreter"

module Codeconsing (S : Synthesis.S) : sig

  (* Step 1: record all definitions *)
  val record_items : Recovery.item list -> unit

  (* Step 2: get prelude maximizing & serialization function *)
  val normalize : unit -> (string * string) list * (Recovery.item list -> string)

end = struct

  open Synthesis

  type fixed = A of fixed paction list

  let normalized_actions = Hashtbl.create 113

  let rec normalize_actions ~flatten = function
    | [] -> []
    | [Var v] when flatten -> normalize_actions ~flatten:true (S.solution v)
    | (x :: xs) as xxs ->
        try !(Hashtbl.find normalized_actions xxs)
        with Not_found ->
          let x' = normalize_action x in
          let xs' = normalize_actions ~flatten xs in
          let xxs' = x' :: xs' in
          Hashtbl.add normalized_actions xxs (ref xxs');
          xxs'

  and normalize_action = function
    | Abort | Reduce _ | Shift _ as a -> a
    | Var v -> Var (A (normalize_actions ~flatten:true (S.solution v)))

  let items_to_actions items =
    let prepare (st, prod, pos) =
      Var (Synthesis.Tail (st, prod, pos)) in
    normalize_actions ~flatten:false (List.map prepare items)

  let roots : Recovery.item list list ref = ref []

  let record_items root =
    roots := root :: !roots

  let share () =
    let table = Hashtbl.create 113 in
    let rec get = function
      | [] -> []
      | (x :: xs) as xxs ->
          try
            let r, v = Hashtbl.find table xxs in
            incr r; v
          with Not_found ->
            let xxs = (get_one x :: get xs) in
            Hashtbl.add table xxs (ref 1, xxs);
            xxs
    and get_one = function
      | Var (A v) -> Var (A (get v))
      | x -> x
    in
    Hashtbl.iter (fun k v -> v := get !v) normalized_actions;
    (* Return counter *)
    (fun v -> !(fst (Hashtbl.find table v)))

  type def =
    | Nil
    | Cons of def paction * def
    | Ref of string

  let emitter name =
    let counter = share () in
    let name = name ^ "_" in
    let gensym = let k = ref 0 in fun () -> incr k; name ^ string_of_int !k in
    let table = Hashtbl.create 113 in
    let frozen = ref false in
    let defs = ref [] in
    let rec emit = function
      | [] -> Nil
      | (x :: xs) as xxs ->
          try Hashtbl.find table xxs
          with Not_found ->
            let x = match x with
              | Var (A ys) -> Var (emit ys)
              | Abort | Reduce _ | Shift _ as a -> a
            in
            let value = Cons (x, emit xs) in
            if counter xxs = 1 then value else (
              assert (not !frozen);
              let sym = gensym () in
              defs := (sym, value) :: !defs;
              let value = Ref sym in
              Hashtbl.add table xxs value;
              Ref sym
            )
    in
    frozen, defs, emit

  let def_to_string def =
    let rec aux acc = function
      | Nil -> "[" ^ String.concat "; " (List.rev acc) ^ "]"
      | Ref sym -> String.concat " :: " (List.rev (sym :: acc))
      | Cons (act, xs) -> aux (one act :: acc) xs

    and one = function
      | Abort -> "Abort"
      | Reduce prod -> Printf.sprintf "Reduce %d" prod.p_index
      | Shift (T t) -> Printf.sprintf "Shift (T T_%s)" t.t_name
      | Shift (N n) -> Printf.sprintf "Shift (N N_%s)" n.n_name
      | Var defs -> Printf.sprintf "Sub (%s)" (aux [] defs)
    in
    aux [] def

  let normalize () =
    let roots = List.map items_to_actions !roots in
    let frozen, defs, emit = emitter "synth" in
    let pass_2 items = ignore (emit items) in
    List.iter pass_2 roots;
    frozen := true;
    let defs = List.rev_map (fun (k,v) -> k, def_to_string v) !defs in
    defs, (fun items -> def_to_string (emit (items_to_actions items)))
end

module Make
    (G : Utils.Grammar) (A : Recover_attrib.S)
    (S : Synthesis.S) (R : Recovery.S) :
sig
  val emit_prelude : name:string -> Format.formatter -> unit
  val emit_recovery : Format.formatter -> unit
end = struct

  open Format

  let emit_prelude ~name ppf =
    fprintf ppf "open %s\n\n" (String.capitalize name);
    fprintf ppf "module Default = struct\n";
    A.default_prelude ppf;

    fprintf ppf "  let value (type a) : a %s.symbol -> a = function\n" menhir;
    let default_t t =
      match A.default_terminal t with
      | None -> ()
      | Some str ->
          fprintf ppf "    | %s.T %s.T_%s -> %s\n" menhir menhir t.t_name str
    and default_n n =
      match A.default_nonterminal n with
      | None -> ()
      | Some str ->
          fprintf ppf "    | %s.N %s.N_%s -> %s\n" menhir menhir n.n_name str
    in
    Array.iter default_t G.grammar.g_terminals;
    Array.iter default_n G.grammar.g_nonterminals;
    fprintf ppf "    | _ -> raise Not_found\n";
    fprintf ppf "end\n\n"

  let emit_defs ppf =
    fprintf ppf "open %s\n\n" menhir;
    fprintf ppf "type t =\n\
                \  | Abort\n\
                \  | Reduce of int\n\
                \  | Shift : 'a symbol -> t\n\
                \  | Sub of t list\n\n"

  let emit_recovery ppf =
    let module Cons = Codeconsing(S) in
    emit_defs ppf;
    Array.iter (fun st ->
        let _depth, cases = R.recover st in
        List.iter (fun (_case, items) -> Cons.record_items items) cases
      ) G.grammar.g_lr1_states;
    let defs, to_string = Cons.normalize () in
    List.iter (fun (k, v) -> fprintf ppf "let %s = %s\n" k v) defs;
    fprintf ppf "\n";
    fprintf ppf "let recover = function\n";
    Array.iter (fun st ->
        let depth, cases = R.recover st in
        fprintf ppf "  | %d -> %d, begin function\n" st.lr1_index depth;
        List.iter (fun (case, items) ->
            let case = match case with
              | None -> -1
              | Some st -> st.lr1_index
            in
            fprintf ppf "    | %d -> %s\n" case (to_string items)
          ) cases;
        fprintf ppf "    | _ -> raise Not_found\n";
        fprintf ppf "  end\n";
      ) G.grammar.g_lr1_states;
    fprintf ppf "  | _ -> raise Not_found\n"

end

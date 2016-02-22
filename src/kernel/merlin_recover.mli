open Sturgeon.Tui

module Make
    (Parser : MenhirLib.IncrementalEngine.EVERYTHING)
    (Recovery : sig
       val default_value : 'a Parser.symbol -> 'a

       type action =
         | Abort
         | Pop
         | R of int
         | S : 'a Parser.symbol -> action
         | Sub of action list

       type decision =
         | Nothing
         | One of action list
         | Select of (int -> action list)

       val depth : int array

       val recover : int -> decision

       val guide : 'a Parser.symbol -> bool

       val token_of_terminal : 'a Parser.terminal -> 'a -> Parser.token
     end)
    (Dump : sig
       val token   : Parser.token -> string
       val element : cursor -> Parser.element -> unit
       val item    : cursor -> Parser.item -> unit
       val env     : cursor -> _ Parser.env -> unit
       val symbol  : Parser.xsymbol -> string
     end) :
sig

  type 'a candidate = {
    line: int;
    min_col: int;
    max_col: int;
    env: 'a Parser.env;
  }

  type 'a candidates = {
    final: 'a option;
    candidates: 'a candidate list;
  }

  val attempt :
    cursor -> 'a candidates ->
    Parser.token * Lexing.position * Lexing.position ->
    [> `Accept of 'a
    | `Fail
    | `Ok of 'a Parser.checkpoint * 'a Parser.env ]

  val generate :
    cursor -> 'a Parser.env -> 'a candidates

  val dump :
    Nav.t ->
    wrong:(Parser.token * Lexing.position * Lexing.position) ->
    rest:(Parser.token * Lexing.position * Lexing.position) list ->
    'a Parser.env -> unit

end

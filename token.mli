(* 
 * token.mli
 *
 * Tokens as lexer output.
 *
 * Ian Kuehne, 2015.
 *
 * Token deals with the 'token' type used for lexer output. It also provides
 * serialization capabilities intended for unit tests.
 *
 *)

open Core.Std

(** t is the same as Parser.token. The type is concrete because this module
    exists specifically to deal with that type, so it should easily be
    convertable with Parser.tokens. *)
type t = Parser.token

(** Alias for to_sexp, to help the sexp syntax extension recursively build
    parsers. *)
val sexp_of_t : t -> Sexp.t

(** Alias for of_sexp, to help the sexp syntax extension recursively build
    parsers. *)
val t_of_sexp : Sexp.t -> t

(** Make an s-expression from a token. *)
val to_sexp : t -> Sexp.t

(** Retrieve a token from an s-expression. Raises a Sexplib.Conv.Of_sexp_error
    on improper input. *)
val of_sexp : Sexp.t -> t

(** Show a token as a Sexp-like string. *)
val to_string : t -> string

(** Retrieve a token from a Sexp-like string. *)
val of_string : string -> t

(** 'load file' gets a list of 't's from the file named 'file' containing
    properly formatted s-expressions as strings. *)
val load : string -> t list

(*---------------------------------------------------------------------------
   Copyright (c) 2006-2009 Citrix Systems Inc.
   Copyright (c) 2010 Thomas Gazagnaire <thomas@gazagnaire.com>
   Copyright (c) 2014-2016 Anil Madhavapeddy <anil@recoil.org>
   Copyright (c) 2016 David Kaloper Meršinjak
   Copyright (c) 2018 Romain Calascibetta <romain.calascibetta@gmail.com>
   Copyright (c) 2021-2022 Patrick Ferris <patrick@sirref.org>

   Distributed under the ISC license, see terms at the end of the file.
  ---------------------------------------------------------------------------*)

(** Base32 RFC4648 implementation.

    The Base 32 encoding is designed to represent arbitrary sequences of
    octets in a form that needs to be case insensitive but that need not
    be human readable. *)

type alphabet
(** Type of an alphabet. *)

type sub = string * int * int
(** Type of sub-string: [str, off, len]. *)

val default_alphabet : alphabet
(** A 32-character alphabet specifying the regular Base32 alphabet. *)

val extended_hex : alphabet
(** A 32-character alphabet specifying the extended hex alphabet. This alphabet
        has the property that encoded data maintains its sort order when the encoded 
        data is compared bit-wise. *)

val make_alphabet : string -> alphabet
(** Make a new alphabet. *)

val length_alphabet : alphabet -> int
(** Returns length of the alphabet, should be 32. *)

val alphabet : alphabet -> string
(** Returns the alphabet. *)

val decode_exn :
  ?pad:bool -> ?alphabet:alphabet -> ?off:int -> ?len:int -> string -> string
(** Decodes a Base32 encoded string. [alphabet] defaults to {! default_alphabet}.

        @raise if Invalid_argument [s] is not a valid Base32 string. *)

val decode_sub :
  ?pad:bool ->
  ?alphabet:alphabet ->
  ?off:int ->
  ?len:int ->
  string ->
  (sub, [> `Msg of string ]) result
(** Same as {!decode_exn} but it returns a result type instead to raise an
        exception. Then, it returns a {!sub} string. Decoded input [(str, off, len)]
        will starting to [off] and will have [len] bytes - by this way, we ensure to
        allocate only one time result. *)

val decode :
  ?pad:bool ->
  ?alphabet:alphabet ->
  ?off:int ->
  ?len:int ->
  string ->
  (string, [> `Msg of string ]) result
(** Same as {!decode_exn}, but returns an explicit error message {!result} if it
        fails. *)

val encode :
  ?pad:bool ->
  ?alphabet:alphabet ->
  ?off:int ->
  ?len:int ->
  string ->
  (string, [> `Msg of string ]) result
(** [encode s] encodes the string [s] into base32. If [pad] is false, no
        trailing padding is added. [pad] defaults to [true], and [alphabet] to
        {!default_alphabet}.
    
        [encode] fails when [off] and [len] do not designate a valid range of [s]. *)

val encode_string : ?pad:bool -> ?alphabet:alphabet -> string -> string
(** [encode_string s] encodes the string [s] into base32. If [pad] is false, no
        trailing padding is added. [pad] defaults to [true], and [alphabet] to
        {!default_alphabet}. *)

val encode_sub :
  ?pad:bool ->
  ?alphabet:alphabet ->
  ?off:int ->
  ?len:int ->
  string ->
  (sub, [> `Msg of string ]) result
(** Same as {!encode} but return a {!sub}-string instead a plain result. By this
        way, we ensure to allocate only one time result. *)

val encode_exn :
  ?pad:bool -> ?alphabet:alphabet -> ?off:int -> ?len:int -> string -> string
(** Same as {!encode} but raises an invalid argument exception if we retrieve an
        error. *)

(*---------------------------------------------------------------------------
   Copyright (c) 2006-2009 Citrix Systems Inc.
   Copyright (c) 2010 Thomas Gazagnaire <thomas@gazagnaire.com>
   Copyright (c) 2014-2016 Anil Madhavapeddy <anil@recoil.org>
   Copyright (c) 2016 David Kaloper Meršinjak
   Copyright (c) 2018 Romain Calascibetta <romain.calascibetta@gmail.com>
   Copyright (c) 2021-2022 Patrick Ferris <patrick@sirref.org>

   Permission to use, copy, modify, and/or distribute this software for any
   purpose with or without fee is hereby granted, provided that the above
   copyright notice and this permission notice appear in all copies.

   THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
   WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
   MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
   ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
   WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
   ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
   OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  ---------------------------------------------------------------------------*)

(lang dune 2.9)
(using mdx 0.1)

(generate_opam_files true)

(source (github patricoferris/ocaml-base32))
(license ISC)
(authors "Patrick Ferris")
(maintainers "Patrick Ferris <patrick@sirref.org>")

(package
 (name base32)
 (synopsis "Base32 Encoding and Decoding")
 (description "A pure OCaml library for encoding and decoding in base32. Users of the base64 library will find it very familiar.")
 (depends
   (ocaml (>= 4.08.0))
   optint
   (alcotest :with-test)
   (mdx :with-test)))
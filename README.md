ocaml-base32
------------

Pure OCaml library for base32 encoding and decoding leaning heavily on the excellent [ocaml-base64](https://github.com/mirage/ocaml-base64) (see the LICENSE).

```ocaml
# let enc = Base32.encode_exn "OCaml is great!";;
val enc : string = "J5BWC3LMEBUXGIDHOJSWC5BB"
# let dec = Base32.decode_exn enc;;
val dec : string = "OCaml is great!"
```

*The library is not very well tested so care should be taken if you intend to use it in a production setting.*

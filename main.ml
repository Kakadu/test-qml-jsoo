open Printf

let counter = ref 0

let f () =
  incr counter;
  Firebug.console##log (Js.string @@ sprintf "called %d times" !counter)



let () =
  Js.Unsafe.( set (js_expr "Qt") (Js.string "plop") (Js.wrap_callback f) );
  ()

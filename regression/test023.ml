@type 'a a = [`A of 'a | `B of GT.string] with show, eq, compare
@type b = [`C of GT.int | `D of GT.string] with show, eq, compare
@type 'a c = ['a a | b] with show, eq, compare

let _ =
  let x = `A 3 in
  let y = `D "2" in
  Printf.printf "%s\n" (GT.transform(a) (fun _ x -> string_of_int x) (new @a[show]) () x);
  Printf.printf "%s\n" (GT.transform(b)                              (new @b[show]) () y);
  Printf.printf "%s\n" (GT.transform(c) (fun _ x -> string_of_int x) (new @c[show]) () x);
  Printf.printf "%s\n" (GT.transform(c) (fun _ x -> string_of_int x) (new @c[show]) () y);
  Printf.printf "%b\n" (GT.transform(a) (=) (new @a[eq]) x x);
  Printf.printf "%b\n" (GT.transform(b) (new @b[eq]) y y);
  Printf.printf "%b\n" (GT.transform(c) (=) (new @c[eq]) x x);
  Printf.printf "%b\n" (GT.transform(c) (=) (new @c[eq]) y y);
  Printf.printf "%b\n" (GT.transform(c) (=) (new @c[eq]) x y)

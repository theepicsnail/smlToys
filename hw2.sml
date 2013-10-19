use "hw2provided.sml";

fun all_except_option(x, []) = NONE
  all_except_option(needle:string, current::haystack:string list):string list option =
  let
    val rest = all_except_option(needle, haystack)
  in
    if needle = current then 
      if rest = None 
  

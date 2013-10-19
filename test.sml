load "TextIO";


load "OS";
OS.Process.system("/bin/stty -F /dev/tty -icanon min 1");

fun main() = 
  while (true) 
  do (
    let 
      val c = TextIO.inputNoBlock(TextIO.stdIn)
    in
      case c of 
          NONE => ()
        | SOME v => print(v)
    end 
  );
main()

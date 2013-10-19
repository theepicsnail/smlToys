load "TextIO";



load "OS";
fun getCh(): string option = TextIO.inputNoBlock(TextIO.stdIn);
fun ttyWrapper(cb) =
  let
    val _ = OS.Process.system("/bin/stty -F /dev/tty -icanon min 1 -echo")
  in
    cb(); 
    ()
  end
  handle Exception => (* fix after ctrl-c *)
    (OS.Process.system("/bin/stty -F /dev/tty sane");())
val KEY_UP   = "\^[[A";
val KEY_DOWN = "\^[[B";
val KEY_RIGHT= "\^[[C";
val KEY_LEFT = "\^[[D";



fun main() = 
  while (true) 
  do (
    let 
      val c = getCh()
    in
      case c of 
          NONE => ()
        | SOME "\^[[B" => print("DOWN")
        | SOME KEY_UP => print("UP")
        | SOME KEY_LEFT => print("LEFT")
        | SOME KEY_RIGHT => print("RIGHT")
        | SOME v => print(v)
    end 
  );

ttyWrapper(main);

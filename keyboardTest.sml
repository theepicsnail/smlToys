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


datatype KEY = KEY_UP 
             | KEY_DOWN 
             | KEY_LEFT 
             | KEY_RIGHT 
             | KEY_NONE
             | KEY_OTHER of string;

fun getKey(): KEY = 
  let 
    val c = getCh()
  in
    case c of
      SOME "\^[[A" => KEY_UP
    | SOME "\^[[B" => KEY_DOWN
    | SOME "\^[[C" => KEY_RIGHT
    | SOME "\^[[D" => KEY_LEFT
    | NONE => KEY_NONE
    | SOME x => KEY_OTHER(x)
  end


fun main() = 
  while (true) 
  do (
    let 
      val k = getKey()
    in
      case k of 
          KEY_NONE => ()
        | KEY_UP => print("UP")
        | KEY_DOWN => print("DOWN")
        | KEY_RIGHT => print("RIGHT")
        | KEY_LEFT  => print("LEFT")
        | KEY_OTHER(x) => print(x)
    end 
  );

ttyWrapper(main);

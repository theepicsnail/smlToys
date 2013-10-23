load "TextIO";
load "Int";


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


datatype KEY = KEY_UP     | KEY_DOWN   | KEY_LEFT 
             | KEY_RIGHT  | KEY_NONE   | KEY_OTHER of string;

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

(* MazeCell *)
datatype MazeCell
  = Path 
  | Wall;

fun PrintMazeCell(ref Path) = print(".")
|   PrintMazeCell(ref Wall) = print("#")
;

(* Maze1D *)
type Maze1D = MazeCell ref list;
fun New1DMaze(0):Maze1D = []
|   New1DMaze(x:int) = 
    ref Wall :: New1DMaze(x-1)
;

fun Print1DMaze([]) = ()
|   Print1DMaze(cell::maze:Maze1D):unit =
    (
      PrintMazeCell(cell);
      Print1DMaze(maze)
    )
;

(* Maze2D *)
type Maze2D = Maze1D list;
fun New2DMaze(x:int, 0):Maze2D = []
|   New2DMaze(x:int, y:int):Maze2D = 
    New1DMaze(x) :: New2DMaze(x, y-1)
;

fun Print2DMaze([]) = ()
|   Print2DMaze(maze1d::maze:Maze2D):unit = 
    (
      Print1DMaze(maze1d);
      print("\n");
      Print2DMaze(maze)
    )
;
fun Maze2DValidLocation(maze:Maze2D, x:int, y:int):bool =
  if x < 0 orelse y < 0 then false else
  if y >= List.length(maze) then false else
  if x >= List.length(hd maze) then false else
  true
;


print("---");
Print2DMaze(New2DMaze(20,10));



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
(*
ttyWrapper(main);
*)



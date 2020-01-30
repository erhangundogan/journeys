type direction = N | E | S | W
type command = L | R | F

let get_direction = function
  | "N" -> N
  | "E" -> E
  | "S" -> S
  | "W" -> W
  | _ -> failwith "Wrong direction!"

let get_point s =
  Core.String.split s ~on:' '
  |> function
  | [x; y; d] -> (int_of_string x, int_of_string y, get_direction d)
  | _ -> failwith "Wrong point!"

let rec to_command_list l = function
  | [] -> l
  | h :: t ->
    let find_command = function
      | 'L' -> L
      | 'R' -> R
      | 'F' -> F
      | _ -> failwith "Wrong command!"
    in
    List.rev @@ to_command_list (find_command h :: l) t

let move c (x, y, d) = match c, d with
  | R, N -> (x, y, E)
  | R, E -> (x, y, S)
  | R, S -> (x, y, W)
  | R, W -> (x, y, N)
  | L, N -> (x, y, W)
  | L, W -> (x, y, S)
  | L, S -> (x, y, E)
  | L, E -> (x, y, N)
  | F, N -> (x, (y + 1), N)
  | F, E -> ((x + 1), y, E)
  | F, S -> (x, (y - 1), S)
  | F, W -> ((x - 1), y, W)

let validate_journey p commands =
  let rec aux p = function
    | [] -> p
    | h :: t -> aux (move h p) t
  in aux p (List.rev (to_command_list [] commands))

let rec split_journeys l = function
  | ( [] | [_] | [_; _] ) -> l
  | s :: (c :: ( e :: t ) ) -> split_journeys ((s, e, c) :: l) t

let rec validate_journeys = function
  | [] -> ()
  | (s, e, c) :: t ->
    let end_point = get_point e in
    let commands = Core.String.to_list c in
    let calculated_end_point = validate_journey (get_point s) commands in
    Printf.printf "%s -> %b\n" e (calculated_end_point = end_point);
    validate_journeys t

let () =
  Sys.argv.(1) (* first argument for the file name *)
  |> Core.In_channel.read_lines
  |> List.filter (fun i -> i <> "")
  |> split_journeys []
  |> List.rev
  |> validate_journeys
;;

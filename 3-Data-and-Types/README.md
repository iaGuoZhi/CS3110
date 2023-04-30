## list expressions [\*]

```
let ls = [1;2;3;4;5];;
let ls = 1 :: 2 :: 3 :: 4 :: 5;;
let ls = [1] @ [2;3;4] @ [5];;
```

```
val ls : int list = [1; 2; 3; 4; 5]
```

## product [\*\*]

```
let rec product = function
| [] -> 1
| h :: t -> h * product t;;
product [1;2;3];;
```

```
val product : int list -> int = <fun>
- : int = 6
```

## concat [\*\*]

```
let rec concat = function
| [] -> ""
| h :: t -> h ^ concat t;;
concat ["hello"; " world"];;
```

```
val concat : string list -> string = <fun>
- : string = "hello world"
```

## product test [\*\*]

Run `tune build test.exe`

## patterns [\*\*\*]

```
let pattern1 = function
| [] -> false
| h :: t -> h = "bigred";;
pattern1 ["bigred"; "1"];;

let pattern2 = function
| _ :: _ :: [] -> true
| _ :: _ :: _ :: _ :: [] -> true
| _ -> false;;
val pattern2 : 'a list -> bool = <fun

let pattern3 = function
| h :: t :: s -> h = t
| _ -> false;;
val pattern3 : 'a list -> bool = <fun>
```

```
val pattern1 : string list -> bool = <fun>
- : bool = true

pattern2 [1;2];;
- : bool = true

pattern3 [1;2];;
- : bool = false
```

## library [\*\*\*]

```
let fifth_element lst =
if (List.length lst) >= 5 then List.nth lst 4 else 0;;
fifth_element [1;2];;

let sort_list_descending lst =
List.rev (List.sort Stdlib.compare lst);;
sort_list_descending [1;2];;
```

```
val fifth_element : int list -> int = <fun>
- : int = 0

val sort_list_descending : 'a list -> 'a list = <fun>
- : int list = [2; 1]
```

## library test [\*\*\*]

Run `dune build test.exe`

## library puzzle [\*\*\*]

```
let last_element lst =
List.nth lst ((List.length lst) - 1);;
last_element [1;2];;

let any_zeros lst =
List.exists (fun x -> x = 0) lst;;
val any_zeros : int list -> bool = <fun>
```

```
val last_element : 'a list -> 'a = <fun>
- : int = 2

any_zeros [1;2];;
- : bool = false
```

## take drop [\*\*\*]

```
let rec take n lst =
if n = 0 then [] else match lst with
| [] -> []
| x :: xs -> x :: take (n - 1) xs;;
take 2 [1;2;3];;

let rec drop n lst =
if n = 0 then lst else match lst with
| [] -> []
| x :: xs -> drop (n - 1) xs;;
drop 2 [1;2;3];;
```

```
val take : int -> 'a list -> 'a list = <fun>
- : int list = [1; 2]

val drop : int -> 'a list -> 'a list = <fun>
- : int list = [3]
```

## take drop tail [\*\*\*\*]

## unimodal [\*\*\*]

```
let rec is_mon_dec = function
| [] | [_] -> true
| h1 :: (h2 :: t2 as t) ->
h1 >= h2 && is_mon_dec t

let rec is_mon_inc_then_dec = function
| [] | [_] -> true
| h1 :: (h2 :: t2 as t) as lst ->
if h1 <= h2 then is_mon_inc_then_dec t else is_mon_dec lst;;

let is_unimodal lst =
is_mon_inc_then_dec lst;;
```

```
val is_mon_dec : 'a list -> bool = <fun>
val is_mon_inc_then_dec : 'a list -> bool = <fun>
val is_unimodal : 'a list -> bool = <fun>
```

## powerset [\*\*\*]

```
let rec powerset = function
| [] -> [[]]
| x :: s -> let p = powerset s in
List.map (List.cons x) p @ p;;
powerset [1;2;3];;
```

```
val powerset : 'a list -> 'a list list = <fun>
- : int list list = [[1; 2; 3]; [1; 2]; [1; 3]; [1]; [2; 3]; [2]; [3]; []]
```

## print int list rec [\*\*]

```
let rec print_int_list = function
| [] -> ()
| x :: xs -> print_endline (string_of_int x); print_int_list xs;;
print_int_list [1;2;3];;
```

```
val print_int_list : int list -> unit = <fun>
1
2
3
- : unit = ()
```

## print inst list iter [\*\*]

```
let print_int_list' lst =
List.iter (fun x -> print_endline (string_of_int x)) lst;;
print_int_list [1;2;3];;
```

```
val print_int_list : int list -> unit = <fun>
1
2
3
- : unit = ()
```

## student [\*\*]

```
type student = {first_name : string; last_name : string; gpa: float}
let s = {first_name = "Eric"; last_name = "Guo"; gpa = 4.0}
let get_full_name student = [student.first_name; student.last_name]
let make_stud first last g = { first_name = first; last_name = last; gpa = g}
get_full_name s;;
```

```
type student = { first_name : string; last_name : string; gpa : float; }
val s : student = {first_name = "Eric"; last_name = "Guo"; gpa = 4.}
val get_full_name : student -> string list = <fun>
val make_stud : string -> string -> float -> student = <fun>
- : string list = ["Eric"; "Guo"]
```

## pokerrecord [\*\*]

```
type poketype = Normal | Fire | Water
type pokemon = {name : string; hp : int; ptype : poketype}
let charizard = {name = "charizard"; hp = 78; ptype = Fire};;
```

```
type poketype = Normal | Fire | Water
type pokemon = { name : string; hp : int; ptype : poketype; }
val charizard : pokemon = {name = "charizard"; hp = 78; ptype = Fire}
```

## safe hd and tl [\*\*]

```
let safe_hd = function
| [] -> None
| x :: xs -> Some x;;

let rec safe_tl = function
| [] -> None
| _ :: x -> Some x;;
```

```
val safe_hd : 'a list -> 'a option = <fun>
val safe_tl : 'a list -> 'a option = <fun>
```

## pokefun [\*\*]

```
let rec max_hp = function
| [] -> None
| poke1::t -> begin
match max_hp t with
| None -> Some poke1
| Some poke2 -> Some (if poke1.hp >= poke2.hp then poke1 else poke2)
end;;
```

```
val max_hp : pokemon list -> pokemon option = <fun>
```

## date before [\*\*]

```
let is_before date1 date2 =
let (y1, m1, d1) = date1 in
let (y2, m2, d2) = date2 in
y1 < y2 || (y1 = y2 && m1 < m2) || (y1 = y2 && m1 = m2 && d1 < d2);;
```

```
val is_before : 'a * 'b * 'c -> 'a * 'b * 'c -> bool = <fun>
```

## earliest date [\*\*]

```
let rec earliest = function
| [] -> None
| x1 :: xs -> begin
match earliest xs with
| None -> Some x1
| Some x2 -> if is_before x1 x2 then Some x1 else Some x2
end;;
```

```
val earliest : ('a * 'b * 'c) list -> ('a * 'b * 'c) option = <fun>
```

## assoc list [\*]

```
let dict = insert 3 "three" (insert 2 "two" (insert 1 "one" []))
let some_two = lookup 2 dict
let none = lookup 4 dict;;
```

```
val dict : (int * string) list = [(3, "three"); (2, "two"); (1, "one")]
val some_two : string option = Some "two"
val none : string option = None
```

## cards [\*\*]

```
type suit = Hearts | Spades | Clubs | Diamonds
type rank = Number of int | Ace | Jack | Queen | King
type card = {suit : suit; rank : rank}
let ace_of_clubs: card = { suit = Clubs; rank = Ace };;
```

```
type suit = Hearts | Spades | Clubs | Diamonds
type rank = Number of int | Ace | Jack | Queen | King
type card = {suit : suit; rank : rank}
val ace_of_clubs : card = {suit = Clubs; rank = Ace}
```

## matching

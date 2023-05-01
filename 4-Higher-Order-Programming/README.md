## twice, no arguments [**]

```
quad: int -> int = <fun>
fourth: int -> int = <fun>
```

## mystery operator 1 [**]

Change the priority

## mystery operator 2 [**]

Run the two function

## repeat [**]

```
let rec repeat f n x =
match n with
| 0 -> x
| n -> repeat f (n - 1) (f x);;
repeat double 10 1;;
```

```
val repeat : ('a -> 'a) -> int -> 'a -> 'a = <fun>
- : int = 1024
```

## product [*]

```
let product_left lst = List.fold_left ( *. ) 1. lst;;
let product_right lst = List.fold_left ( *. ) lst 1.;;
val product : float list -> float = <fun>
```

## terse product [**]

## sum sube odd [**]

```
let rec from i j l =
if i > j then l
else from (i + 1) j (i::l);;

let (--) i j =
from i j [];;

let sum_cube_odd n =
let l = 0 -- n in
let odds_only = List.filter (fun i -> i mod 2 == 1) l in
let odds_cubes = List.map (fun i -> i * i * i) odds_only in
List.fold_left (+) 0 odds_cubes;;
```

```
val from : int -> int -> int list -> int list = <fun>
val ( -- ) : int -> int -> int list = <fun>
val sum_cube_odd : int -> int = <fun>
```

## sum cube odd pipeline

```
let sum_cube_odd_p n =
0 -- n
|> List.filter (fun i -> i mod 2 == 1)
|> List.map (fun i -> i * i * i)
|> List.fold_left (+) 0;;
```

```
val sum_cube_odd : int -> int = <fun>
```

## exists

```
let rec exists_rec f = function
| [] -> false
| x :: xs -> if (f x) then true else exists_rec f xs;;

let exists_fold f l = List.fold_left (fun acc elt -> acc || f elt) false l;;

let exists_lib f l = List.length (List.filter f l) > 0;;
```

```
val exists_rec : ('a -> bool) -> 'a list -> bool = <fun>
val exists_fold : ('a -> bool) -> 'a list -> bool = <fun>
val exists_lib : ('a -> bool) -> 'a list -> bool = <fun>
```

## account balance [***]

```
let deduct balance debits = List.fold_left ( - ) balance debits;;
```

```
val deduct : int -> int list -> int = <fun>
```

## library uncurried [**]

```
let uncurried_append (lst, e) = List.append lst e
let uncurried_compare (c1, c2) = Char.compare c1 c2
let uncurried_max (n1, n2) = Stdlib.max n1 n2;;
```

```
val uncurried_append : 'a list * 'a list -> 'a list = <fun>
val uncurried_compare : char * char -> int = <fun>
val uncurried_max : 'a * 'a -> 'a = <fun>
```

## map composition [***]

```
List.map (fun elt -> f (g elt)) lst;;
```

## more list fun [***]

```
List.filter (fun i -> (String.length i) > 3) ["12"; "abcd"]
List.map (fun i -> i +. 1.0) [1.0; 2.0]
let join strs sep = List.fold_left (fun acc str -> acc ^ str ^ sep) "" strs;;
```

```
- : string list = ["abcd"]
- : float list = [2.; 3.]
- : string = "1,2,"
```

## association list keys [***]

```
let keys2 lst =
List.fold_left
(fun acc (k, _) -> if List.exists ((=) k) acc then acc else k::acc)
[]
lst        
```

```
val keys2 : ('a * 'b) list -> 'a list = <fun>
```

## valid matrix [***]

```
let is_valid_matrix = function
| [] -> false
| r :: rows ->
let m = List.length r in
m > 0 && List.for_all (fun r' -> m = List.length r') rows;;
```

```
val is_valid_matrix : 'a list list -> bool = <fun>
```

## row vector add [***]

```
let add_row_vectors =
List.map2 (+)
;;
```

```
val add_row_vectors : int list -> int list -> int list = <fun>
```

## matrix add [***]

```
let add_matrices =
List.map2 (List.map2 (+));;
```

```
val add_matrices : int list list -> int list list -> int list list = <fun>
```

## matrix multiply [****]

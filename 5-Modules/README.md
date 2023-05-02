## complex synonym [*]

```
module type ComplexSig = sig
type t = float * float
val zero : t
val add : t -> t -> t
end;;
```

```
module type ComplexSig =
sig type t = float * float val zero : t val add : t -> t -> t end
```

## complex encapsulation [**]

signature mismatch

## big list queue [**]

```
module ListQueue = struct
type 'a queue = 'a list
let empty = []
let is_empty q = (q = [])
let enqueue x q = q @ [x]
let peek = function
| [] -> failwith "Empty"
| x::_ -> x
let dequeue = function
| [] -> failwith "Empty"
| _::q -> q
end
;;
```

```
module ListQueue :
  sig
    type 'a queue = 'a list
    val empty : 'a queue
    val is_empty : 'a queue -> bool
    val enqueue : 'a -> 'a queue -> 'a queue
    val peek : 'a queue -> 'a
    val dequeue : 'a queue -> 'a queue
  end
```

length that leads to at least 10 seconds: 30000

## big batched queue [**]

```
module BatchedQueue = struct
type 'a queue = 'a list
let empty = []
let is_empty q = (q = [])
let enqueue x q = x :: q
let peek = function
| [] -> failwith "Empty"
| x::_ -> x
let dequeue = function
| [] -> failwith "Empty"
| _::q -> q
end
;;
```

```
    module ListQueue :
  sig
    type 'a queue = 'a list
    val empty : 'a queue
    val is_empty : 'a queue -> bool
    val enqueue : 'a -> 'a queue -> 'a queue
    val peek : 'a queue -> 'a
    val dequeue : 'a queue -> 'a queue
  end
```

length that leads to at least 10 seconds: 100000000

## queue effiency [***]

ListQueue enqueue time complexity is O(n), because it has to walk down the whole list, while BatchedQueue enqueue is O(1)

## binary search tree map [****]

```
module type Map = sig
type ('k, 'v) t
val empty: ('k, 'v) t
val insert : 'k -> 'v -> ('k, 'v) t -> ('k, 'v) t
val lookup : 'k -> ('k, 'v) t -> 'v
end;;

module BstMap: Map = struct
type 'a tree =
| Leaf
| Node of 'a * 'a tree * 'a tree
type ('k, 'v) t = ('k * 'v) tree
let empty = Leaf
let rec insert k v = function
| Leaf -> Node((k, v), Leaf, Leaf)
| Node ((k', v'), l, r) ->
if (k = k') then Node ((k, v), l, r)
else if (k < k') then Node ((k', v'), (insert k v l), r)
else Node ((k', v'), l, insert k v r)
    let rec lookup k = function
| Leaf -> failwith "Not_found"
| Node ((k', v'), l, r) ->
if (k = k') then v'
else if (k < k') then lookup k l
else lookup k r
end
;;

open BstMap;;
let my_map = empty;;
let updated_map = insert 1 2 my_map;;
lookup 1 updated_map;;
```

```
module type Map =
sig
type ('k, 'v) t
val empty : ('k, 'v) t
val insert : 'k -> 'v -> ('k, 'v) t -> ('k, 'v) t
val lookup : 'k -> ('k, 'v) t -> 'v
end

module BstMap : Map

val my_map : ('a, 'b) t = <abstr>
val updated_map : (int, int) t = <abstr>
- : int = 2
```

## fraction [****]

```
module MyFraction: Fraction = struct
type t = (int * int)
let make n d = assert (d != 0); (n, d)
let numerator (n, d) = n
let denominator (n, d) = d
let to_string(n, d) = string_of_int n ^ " / " ^ string_of_int d
let to_float(n, d) = float_of_int n /. float_of_int d
let add (n1, d1) (n2, d2) = let d' = d1 * d2 in (n1 * d2 + n2 * d1, d')
let mul (n1, d1) (n2, d2) = (n1 * n2, d1 * d2)
end;;
```

## fraction reduced [***]

```
module MyFraction: Fraction = struct

type t = (int * int)
let make n d = assert (d != 0); let rec gcd x y = if x = 0 then y else if (x < y) then gcd (y - x) x else gcd y (x - y) in let g = gcd n d in (n /
g, d / g)
let numerator (n, d) = n
let denominator (n, d) = d
let to_string(n, d) = string_of_int n ^ " / " ^ string_of_int d
let to_float(n, d) = float_of_int n /. float_of_int d
let add (n1, d1) (n2, d2) = let d' = d1 * d2 in make (n1 * d2 + n2 * d1) d'
let mul (n1, d1) (n2, d2) = make (n1 * n2) (d1 * d2)
end;;

open MyFraction
let my_frac = make 10 20
to_string my_frac;;
```

```
module MyFraction : Fraction
val my_frac : MyFraction.t = <abstr>
- : string = "1 / 2"
```

## make char map [*]

1. [empty] is an empty character map, whose type is ['a t] which represent a map
2. [add] takes a key of type [key], a value of type ['a], an existing map of type ['a t], and return a new map with the key and value.
3. [remove] takes a key of type [key], an existing map of type ['a t], and return a new map without key.

## char ordered [*]

[Char] matches the [Map.OrderedType] signature because it contains a type named [t] as well as an ordering function [compare : t -> t -> int].

## use char map [**]

```
let map = CharMap.(
empty
|> add 'A' "Alpha"
|> add 'E' "Echo"
);;

let echo = CharMap.find 'E' map;;

let map' = CharMap.remove 'A' map;;

let exisits = CharMap.mem 'A' map';;

let ls = CharMap.bindings map';;
```

```
val map : string CharMap.t = <abstr>
val echo : string = "Echo"
val map' : string CharMap.t = <abstr>
val exisits : bool = false
val ls : (char * string) list = [('E', "Echo")]
```

## bindings [**]

all these expressions have the same association list.

## date order [**]

```
module Date = struct
type t = date

let compare d1 d2 =
if d1.month = d2.month then d1.day - d2.day
else d1.month - d2.month
end;;
```

```
module Date : sig type t = date val compare : t -> t -> int end
```


let rec prod = function
| [] -> 1
| h :: t -> h * prod t;;

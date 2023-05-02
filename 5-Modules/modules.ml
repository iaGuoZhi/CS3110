module type MATH = sig
    val fact : int -> int
end

module Math : MATH = struct
    let rec fact_aux n acc =
        if n = 0 then acc
        else fact_aux (n - 1) (n * acc)

    let fact n = fact_aux n 1
end

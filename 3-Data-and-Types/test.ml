open OUnit2
open Prod

let make_prod_test name input expected_output = 
  name >:: (fun _ -> assert_equal expected_output (prod input))

let prod_tests = [
  make_prod_test "empty" [] 1;
  make_prod_test "one" [1] 1;
  make_prod_test "two" [1;2] 2;
  make_prod_test "three" [1;2;3] 6;
  make_prod_test "four" [1;2;3;4] 24;
  make_prod_test "five" [1;2;3;4;5] 120;
]

let _ = run_test_tt_main ("suite" >::: prod_tests)

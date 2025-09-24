|| Test Runner for Introduction to Functional Programming Solutions
|| Basic testing framework for Miranda functions

%include "../src/chapter01/exercises.m"

|| Test assertions and utilities

|| Simple equality test for numbers
test_eq :: num -> num -> [char] -> [char]
test_eq expected actual test_name
  = "PASS: " ++ test_name, if expected = actual
  = "FAIL: " ++ test_name ++ " (expected " ++ show expected ++ ", got " ++ show actual ++ ")", otherwise

|| Test suite for Chapter 1 exercises

|| Test quad function
test_quad_cases = [test_eq 16 (quad 2) "quad 2 = 16",
                   test_eq 81 (quad 3) "quad 3 = 81",
                   test_eq 256 (quad 4) "quad 4 = 256",
                   test_eq 0 (quad 0) "quad 0 = 0",
                   test_eq 1 (quad 1) "quad 1 = 1",
                   test_eq 1 (quad (-1)) "quad (-1) = 1",
                   test_eq 16 (quad (-2)) "quad (-2) = 16",
                   test_eq 10000 (quad 10) "quad with larger number"]

|| Test maximum function
test_maximum_cases = [test_eq 5 (maximum 5 3) "maximum 5 3 = 5",
                      test_eq 8 (maximum 2 8) "maximum 2 8 = 8",
                      test_eq 7 (maximum 7 7) "maximum 7 7 = 7",
                      test_eq 0 (maximum 0 (-1)) "maximum 0 (-1) = 0",
                      test_eq 10 (maximum 10 5) "maximum 10 5 = 10",
                      test_eq 0 (maximum (-5) 0) "maximum with negative",
                      test_eq (-1) (maximum (-5) (-1)) "maximum with both negative",
                      test_eq 100 (maximum 100 99) "maximum with large numbers"]

|| Test circle_area function (using fractional approximation)
test_circle_area_cases = [test_eq (22/7) (circle_area 1) "circle_area 1 = 22/7",
                          test_eq (88/7) (circle_area 2) "circle_area 2 = 88/7",
                          test_eq 154 (circle_area 7) "circle_area 7 = 154",
                          test_eq 0 (circle_area 0) "circle_area 0 = 0",
                          test_eq (22*25/7) (circle_area 5) "circle_area 5",
                          test_eq (22*100/7) (circle_area 10) "circle_area 10"]

|| Test square helper function
test_square_cases = [test_eq 4 (square 2) "square 2 = 4",
                     test_eq 9 (square 3) "square 3 = 9",
                     test_eq 25 (square 5) "square 5 = 25",
                     test_eq 0 (square 0) "square 0 = 0",
                     test_eq 1 (square 1) "square 1 = 1"]

|| All test cases combined
all_tests = test_quad_cases ++ test_maximum_cases ++ test_circle_area_cases ++ test_square_cases

|| Test results summary
test_results = all_tests

|| Count passed tests
count_passed = #[t | t <- all_tests; take 4 t = "PASS"]
total_tests = #all_tests
count_failed = total_tests - count_passed

|| Test summary
test_summary = ["",
                "=== TEST SUMMARY ===",
                "Total tests: " ++ show total_tests,
                "Passed: " ++ show count_passed,
                "Failed: " ++ show count_failed,
                "Status: " ++ status_msg]

status_msg = "ALL TESTS PASSED", if count_failed = 0
           = "SOME TESTS FAILED", otherwise
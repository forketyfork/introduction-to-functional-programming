|| Test Runner for Introduction to Functional Programming Solutions
|| Basic testing framework for Miranda functions

%include "../src/chapter01/exercises.m"

|| Test assertions and utilities

|| Simple equality test for numbers
test_eq :: num -> num -> [char] -> [char]
test_eq expected actual test_name =
    "PASS: " ++ test_name, if expected = actual
  = "FAIL: " ++ test_name ++ " (expected " ++ show expected ++ ", got " ++ show actual ++ ")", otherwise

|| Test suite for Chapter 1 exercises

|| Test quad function
test_quad_cases = [
    test_eq 16 (quad 2) "quad 2 = 16",
    test_eq 81 (quad 3) "quad 3 = 81",
    test_eq 256 (quad 4) "quad 4 = 256",
    test_eq 0 (quad 0) "quad 0 = 0",
    test_eq 1 (quad 1) "quad 1 = 1"
]

|| Test max function
test_max_cases = [
    test_eq 5 (max 5 3) "max 5 3 = 5",
    test_eq 8 (max 2 8) "max 2 8 = 8",
    test_eq 7 (max 7 7) "max 7 7 = 7",
    test_eq 0 (max 0 (-1)) "max 0 (-1) = 0",
    test_eq 10 (max 10 5) "max 10 5 = 10"
]

|| Test circle_area function (using integer approximation)
test_circle_area_cases = [
    test_eq 22 (circle_area 1) "circle_area 1 ≈ 22/7",
    test_eq 88 (circle_area 2) "circle_area 2 ≈ 88/7",
    test_eq 22 (circle_area 1) "circle_area 1 = 22/7"
]

|| Test square helper function
test_square_cases = [
    test_eq 4 (square 2) "square 2 = 4",
    test_eq 9 (square 3) "square 3 = 9",
    test_eq 25 (square 5) "square 5 = 25",
    test_eq 0 (square 0) "square 0 = 0",
    test_eq 1 (square 1) "square 1 = 1"
]

|| All test cases combined
all_tests = test_quad_cases ++ test_max_cases ++ test_circle_area_cases ++ test_square_cases

|| Test results summary
test_results = all_tests

|| Count passed tests
count_passed = length [t | t <- all_tests; take 4 t = "PASS"]
total_tests = length all_tests
count_failed = total_tests - count_passed

|| Test summary
test_summary = [
    "",
    "=== TEST SUMMARY ===",
    "Total tests: " ++ show total_tests,
    "Passed: " ++ show count_passed,
    "Failed: " ++ show count_failed,
    "Status: " ++ (if count_failed = 0 then "ALL TESTS PASSED" else "SOME TESTS FAILED")
]
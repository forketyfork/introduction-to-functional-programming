|| Main module - Introduction to Functional Programming Solutions
|| Entry point for running and testing exercises

%include "chapter01/exercises.m"

|| Example usage and testing of Chapter 1 exercises

|| Test quad function
test_quad = [quad 2, quad 3, quad 4]  || Should give [16, 81, 256]

|| Test maximum function
test_maximum = [maximum 5 3, maximum 2 8, maximum 7 7]  || Should give [5, 8, 7]

|| Test circle_area function
test_circle_area = [circle_area 1, circle_area 2, circle_area 7]  || Approximate areas

|| All test results
all_tests = (test_quad, test_maximum, test_circle_area)
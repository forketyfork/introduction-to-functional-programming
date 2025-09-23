|| Chapter 1 Demonstration - Basic Function Definitions
|| Interactive examples for understanding functional programming concepts

%include "../src/chapter01/exercises.m"

|| Interactive demonstrations

|| Demonstrate quad function with different inputs
demo_quad = [quad 0, quad 1, quad 2, quad 3, quad 5]

|| Demonstrate max function with edge cases
demo_max = [max 10 5, max 3 3, max (-2) 7, max 0 (-1)]

|| Demonstrate circle_area with common radius values
demo_circle_area = [circle_area 1, circle_area 2, circle_area 3, circle_area 5, circle_area 10]

|| Combined demonstration
chapter1_demo = (demo_quad, demo_max, demo_circle_area)
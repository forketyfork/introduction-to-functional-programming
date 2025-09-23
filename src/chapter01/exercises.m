|| Chapter 1 Exercises - Introduction to Functional Programming
|| Solutions to exercises from Bird & Wadler

%export quad, max, circle_area, square

|| Helper function for squaring
square x = x * x

|| Exercise 1.1.1
|| Define a function quad that returns the fourth power of its argument
quad x = square(square x)

|| Exercise 1.1.2
|| Define a function max that returns the maximum of two numbers
max x y = x, if x >= y
        = y, if x < y

|| Exercise 1.1.3
|| Define a function circle_area that computes the area of a circle given its radius
|| Using approximation 22/7 for π
circle_area r = 22 * square r / 7
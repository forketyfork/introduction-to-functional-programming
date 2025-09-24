|| Chapter 1. Fundamental Concepts

%export quad maximum circle_area square

|| Helper function for squaring
square x = x * x

|| Exercise 1.1.1
|| Using a function `square`, design a function `quad` which raises its argument to the fourth power.
quad x = square(square x)

|| Exercise 1.1.2
|| Define a function `max` which returns the greater of its two arguments.
|| Note: the function was renamed to `maximum` to avoid clashing with Miranda's `max` function.
maximum x y = x, if x >= y
            = y, if x < y

|| Exercise 1.1.3
|| Define a function for computing area of a circle with given radius r (use 22/7 as an approximation to π).
circle_area r = 22 * square r / 7

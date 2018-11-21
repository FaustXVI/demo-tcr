fun fizzBuzz(n: Int): String = if (n % 5 == 0) {
    "Buzz"
} else if (n == 3) {
    "Fizz"
} else {
    "$n"
}
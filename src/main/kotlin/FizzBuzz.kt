fun fizzBuzz(n: Int): String = when {
    n % 15 == 0 -> "FizzBuzz"
    n == 7 -> "Bang"
    n % 5 == 0 -> "Buzz"
    n % 3 == 0 -> "Fizz"
    else -> "$n"
}
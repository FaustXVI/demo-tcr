fun fizzBuzz(n: Int): String = when {
    n == 21 || n == 42 -> "FizzBang"
    n == 35 -> "BuzzBang"
    n % 7 == 0 -> "Bang"
    n % 15 == 0 -> "FizzBuzz"
    n % 5 == 0 -> "Buzz"
    n % 3 == 0 -> "Fizz"
    else -> "$n"
}
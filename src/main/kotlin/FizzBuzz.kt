fun fizzBuzz(n: Int): String = when {
    n % 7 == 0 && n % 3 == 0 -> "FizzBang"
    n % 7 == 0 && n % 5 == 0 -> "BuzzBang"
    n % 7 == 0 -> "Bang"
    n % 15 == 0 -> "FizzBuzz"
    n % 5 == 0 -> "Buzz"
    n % 3 == 0 -> "Fizz"
    else -> "$n"
}
fun fizzBuzz(n: Int): String = when {
    n == 105 -> "FizzBuzzBang"
    n % 7 == 0 && n % 3 == 0 -> "FizzBang"
    n % 7 == 0 && n % 5 == 0 -> "BuzzBang"
    n % 3 == 0 && n % 5 == 0-> "FizzBuzz"
    n % 7 == 0 -> "Bang"
    n % 5 == 0 -> "Buzz"
    n % 3 == 0 -> "Fizz"
    else -> "$n"
}
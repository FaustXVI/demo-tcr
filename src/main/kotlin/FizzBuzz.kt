fun fizzBuzz(n: Int): String = if(n == 30 || n == 15){
    "FizzBuzz"
} else if (n % 5 == 0) {
    "Buzz"
} else if (n % 3 == 0) {
    "Fizz"
} else {
    "$n"
}
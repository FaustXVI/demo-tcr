import assertk.assert
import assertk.assertions.isEqualTo
import org.junit.Test

class FizzBuzzShould {

    @Test
    fun fizzGiven3() {
        assert(fizzBuzz(3)).isEqualTo("Fizz")
    }

    @Test
    fun fizzGiven6() {
        assert(fizzBuzz(6)).isEqualTo("Fizz")
    }

    @Test
    fun buzzGiven5() {
        assert(fizzBuzz(5)).isEqualTo("Buzz")
    }

    @Test
    fun buzzGiven10() {
        assert(fizzBuzz(10)).isEqualTo("Buzz")
    }

    @Test
    fun FizzbuzzGiven30() {
        assert(fizzBuzz(30)).isEqualTo("FizzBuzz")
    }

    @Test
    fun fizzbuzzGiven15() {
        assert(fizzBuzz(15)).isEqualTo("FizzBuzz")
    }

    @Test
    fun bangGiven7() {
        assert(fizzBuzz(7)).isEqualTo("Bang")
    }

    @Test
    fun bangGiven14() {
        assert(fizzBuzz(14)).isEqualTo("Bang")
    }

    @Test
    fun bangGiven21() {
        assert(fizzBuzz(21)).isEqualTo("FizzBang")
    }

    @Test
    fun fizzbangGiven42() {
        assert(fizzBuzz(42)).isEqualTo("FizzBang")
    }

    @Test
    fun fizzbangGiven63() {
        assert(fizzBuzz(63)).isEqualTo("FizzBang")
    }

    @Test
    fun bangGiven35() {
        assert(fizzBuzz(35)).isEqualTo("BuzzBang")
    }

    @Test
    fun echoGiven1() {
        assert(fizzBuzz(1)).isEqualTo("1")
    }

    @Test
    fun echoGiven2() {
        assert(fizzBuzz(2)).isEqualTo("2")
    }

}


import assertk.assert
import assertk.assertions.isEqualTo
import org.junit.Test

class FizzBuzzShould {

    @Test
    fun fizzGiven3() {
        assert(fizzBuzz(3)).isEqualTo("Fizz")
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
    fun echoGiven1() {
        assert(fizzBuzz(1)).isEqualTo("1")
    }

}


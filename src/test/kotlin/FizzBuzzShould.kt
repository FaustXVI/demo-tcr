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

}


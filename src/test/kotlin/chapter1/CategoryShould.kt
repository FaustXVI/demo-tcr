package chapter1

import assertk.assert
import assertk.assertions.isEqualTo
import kotlin.test.Test

class IdentityShould {

    @Test
    fun returnSameValue() {
        assert(identity(1)).isEqualTo(1)
        assert(identity("value")).isEqualTo("value")
    }

}

class CompositionShould {

    val times2: (Int) -> Int = { it * 2 }
    val plus5: (Int) -> Int = { it + 5 }
    val duplicate: (String) -> String = { it + it }
    val appendA: (String) -> String = { it + "A" }
    val toDouble: (Int) -> Double = { it * 1.0 }
    val toString: (Double) -> String = { it.toString() }
    @Test
    fun chainTwoFunctions() {
        assert(compose(times2, plus5)(1)).isEqualTo(7)
        assert(compose(duplicate, appendA)("test")).isEqualTo("testtestA")
        assert(compose(toDouble, toString)(2)).isEqualTo("2.0")
    }

    @Test
    fun respectIdentity() {
        assert(compose(times2, ::identity)(1)).isEqualTo(times2(1))
        assert(compose<Int, Int, Int>(::identity, times2)(1)).isEqualTo(times2(1))
    }

}


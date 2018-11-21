package chapter1

fun <A, B, C> compose(g: (A) -> B, f: (B) -> C): (A) -> C = { f(g(it)) }
fun <T> identity(value: T): T = value

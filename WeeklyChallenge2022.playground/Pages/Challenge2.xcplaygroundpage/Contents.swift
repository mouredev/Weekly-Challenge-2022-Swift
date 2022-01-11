import Foundation

/*
 * Reto #2
 * LA SUCESIÓN DE FIBONACCI
 * Fecha publicación enunciado: 10/01/22
 * Fecha publicación resolución: 17/01/22
 * Dificultad: DIFÍCIL
 *
 * Enunciado: Escribe un programa que imprima los 50 primeros números de la sucesión de Fibonacci empezando en 0.
 * La serie Fibonacci se compone por una sucesión de números en la que el siguiente siempre es la suma de los dos anteriores.
 * 0, 1, 1, 2, 3, 5, 8, 13...
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda la acomunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

func fibonacci(count: Int) -> Decimal {
    assert(count <= 186)
    return recursive(iteration: count, current: 1, previous: 0)
}

func recursive(iteration: Int, current: Decimal, previous: Decimal) -> Decimal {
    if iteration == 0 {
        return previous
    } else if iteration == 1 {
        return current
    }
    return recursive(iteration: iteration - 1, current: current+previous, previous: current)
}

assert(fibonacci(count: 0) == 0)
assert(fibonacci(count: 1) == 1)
assert(fibonacci(count: 2) == 1)
assert(fibonacci(count: 3) == 2)
assert(fibonacci(count: 4) == 3)
assert(fibonacci(count: 5) == 5)
assert(fibonacci(count: 6) == 8)
assert(fibonacci(count: 7) == 13)
assert(fibonacci(count: 50) == 12586269025)
assert("\(fibonacci(count: 100))" == "354224848179261915075")
assert("\(fibonacci(count: 150))" == "9969216677189303386214405760200")
assert("\(fibonacci(count: 186))" == "332825110087067562321196029789634457848")

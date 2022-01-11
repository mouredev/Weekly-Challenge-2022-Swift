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

func fibonacci(iteration: Int) -> Decimal {
    assert(iteration <= 187)
    if iteration <= 1 {
        return 0
    }
    return add(iteration: iteration-1, current: 1, previous: 0) //fibonacci(iteration: iteration - 1) + fibonacci(iteration: iteration - 2)
}

func add(iteration: Int, current: Decimal, previous: Decimal) -> Decimal {
    if iteration == 1 {
        return current
    }
    return add(iteration: iteration - 1, current: current+previous, previous: current)
}

assert(fibonacci(iteration: 0) == 0)
assert(fibonacci(iteration: 1) == 0)
assert(fibonacci(iteration: 2) == 1)
assert(fibonacci(iteration: 3) == 1)
assert(fibonacci(iteration: 4) == 2)
assert(fibonacci(iteration: 5) == 3)
assert(fibonacci(iteration: 6) == 5)
assert(fibonacci(iteration: 7) == 8)
assert(fibonacci(iteration: 8) == 13)
assert(fibonacci(iteration: 50) == 7778742049)

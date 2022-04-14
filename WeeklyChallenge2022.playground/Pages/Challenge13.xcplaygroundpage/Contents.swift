import Foundation

/*
 * Reto #13
 * FACTORIAL RECURSIVO
 * Fecha publicación enunciado: 28/03/22
 * Fecha publicación resolución: 04/04/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Escribe una función que calcule y retorne el factorial de un número dado de forma recursiva.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

func factorial(n: Int) -> Int? {
    return n < 0 ? nil : n <= 1 ? 1 : n * (factorial(n: n - 1)!)
}

print(factorial(n: 0) ?? "No tiene factorial")
print(factorial(n: 7) ?? "No tiene factorial")
print(factorial(n: 10) ?? "No tiene factorial")
print(factorial(n: 1) ?? "No tiene factorial")
print(factorial(n: -1) ?? "No tiene factorial")

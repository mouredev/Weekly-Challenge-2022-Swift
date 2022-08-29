import Foundation

/*
 * Reto #27
 * VECTORES ORTOGONALES
 * Fecha publicación enunciado: 07/07/22
 * Fecha publicación resolución: 11/07/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea un programa que determine si dos vectores son ortogonales.
 * - Los dos array deben tener la misma longitud.
 * - Cada vector se podría representar como un array. Ejemplo: [1, -2]
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

func areOrthogonal(vectorOne: (first: Int, second: Int), vectorTwo: (first: Int, second: Int)) -> Bool {
    return vectorOne.first * vectorTwo.first + vectorOne.second * vectorTwo.second == 0
}

print(areOrthogonal(vectorOne: (first: 1, second: 2), vectorTwo: (first: 2, second: 1)))
print(areOrthogonal(vectorOne: (first: 2, second: 1), vectorTwo: (first: -1, second: 2)))

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

private func areOrthogonals(vectorA: [Int], vectorB: [Int]) -> Bool {
    return vectorA.count != 2 || vectorB.count != 2 ? false : vectorA[0] * vectorB[0] + vectorA[1] * vectorB[1] == 0
}

print(areOrthogonals(vectorA: [-1, 2], vectorB: [2, 1]))
print(areOrthogonals(vectorA: [2, 3], vectorB: [3, 2]))
print(areOrthogonals(vectorA: [], vectorB: [3, 2]))
print(areOrthogonals(vectorA: [1, 2, 3], vectorB: [3, 2]))

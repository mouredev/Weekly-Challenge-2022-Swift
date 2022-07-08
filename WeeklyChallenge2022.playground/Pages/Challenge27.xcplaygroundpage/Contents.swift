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

func checkOrthogonalVectors(vectorA: [Int], vectorB: [Int]) {
    guard
        vectorA.count == vectorB.count
    else { return print("-----\n❗️The vectors must have the same length.\n-----") }
    guard
        vectorA.count > 1,
        vectorB.count > 1
    else { return print("-----\n❗️The length of both vectors must be greater than 1\n-----") }
    
    let dotProduct = zip(vectorA, vectorB).map { $0 * $1 }.reduce(0) { $0 + $1}
    let orthogonal = dotProduct == 0
    
    print("The vectors \(vectorA) and \(vectorB) \n are "
          + (orthogonal ? "✅ " : "❌ not ")
          + "orthogonal \n - Its dot product is \(dotProduct)")
    print("----")
}

checkOrthogonalVectors(vectorA: [2], vectorB: [-2])
checkOrthogonalVectors(vectorA: [3, 2], vectorB: [-2])
checkOrthogonalVectors(vectorA: [3, 2], vectorB: [-2, 3])
checkOrthogonalVectors(vectorA: [3, 2], vectorB: [-2, 4])
checkOrthogonalVectors(vectorA: [1, 1, -1], vectorB: [-1, 2, 1])


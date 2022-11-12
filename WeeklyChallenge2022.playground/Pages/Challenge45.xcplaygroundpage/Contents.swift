import Foundation

/*
 * Reto #45
 * CONTENEDOR DE AGUA
 * Fecha publicación enunciado: 07/10/22
 * Fecha publicación resolución: 14/11/22
 * Dificultad: MEDIA
 *
 * Enunciado: Dado un array de números enteros positivos, donde cada uno representa unidades
 * de bloques apilados, debemos calcular cuantas unidades de agua quedarán atrapadas entre ellos.
 *
 * - Ejemplo: Dado el array [4, 0, 3, 6, 1, 3].
 *
 *        ⏹
 *        ⏹
 *   ⏹💧💧⏹
 *   ⏹💧⏹⏹💧⏹
 *   ⏹💧⏹⏹💧⏹
 *   ⏹💧⏹⏹⏹⏹
 *
 *   Representando bloque con ⏹︎ y agua con 💧, quedarán atrapadas 7 unidades de agua.
 *   Suponemos que existe un suelo impermeable en la parte inferior que retiene el agua.
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal"
 *   para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en
 *   https://retosdeprogramacion.com/semanales2022.
 *
 */

internal func validArray(_ data:  [Int]) -> Bool {
    let lengthData = data.count
    if lengthData < 3 { return false }
    if data.contains(where: { $0  < 0 }) { return false }
    if data.filter({ $0  == 0 }).count == lengthData { return false }
    return true
}

func countGotas(_ data: [Int]) -> Int {
    guard validArray(data) else {
        return 0
    }
    
    var countTotal = 0
    let lengthData = data.count
    (1..<lengthData-1).forEach { index in
        let current = data[index]
        let prev = data[(0..<index)].max() ?? 0
        let next = data[(index+1..<lengthData)].max() ?? 0
        let min = [prev, next].min() ?? 0
        let valueToSum = min - current
        if valueToSum > 0 {
            countTotal += valueToSum
        }
    }
    
    return countTotal
}

let candidate1 = [2, 1, 2, 3, 0, 4, 0, 4]
print("En total hay \(countGotas(candidate1)) gotas de agua")

let candidate2 = [2, 3]
print("En total hay \(countGotas(candidate2)) gotas de agua")

let candidate3 = [2, 3, 2, 3, 5, 1, 5]
print("En total hay \(countGotas(candidate3)) gotas de agua")

let candidate4 = [2, 7, 2, 3, 0, 1]
print("En total hay \(countGotas(candidate4)) gotas de agua")

let candidate5 = [2, 0, 2, 3, 0, 0, 0, 4]
print("En total hay \(countGotas(candidate5)) gotas de agua")

let candidate6 = [2, 0, -2, 3, 0, 0, -1, 4]
print("En total hay \(countGotas(candidate6)) gotas de agua")

let candidate7 = [0, 0, 0, 0, 0]
print("En total hay \(countGotas(candidate7)) gotas de agua")

import Foundation

/*
 * Reto #44
 * BUMERANES
 * Fecha publicación enunciado: 02/10/22
 * Fecha publicación resolución: 07/11/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea una función que retorne el número total de bumeranes de un array de números
 * enteros e imprima cada uno de ellos.
 * - Un bumerán (búmeran, boomerang) es una secuencia formada por 3 números seguidos, en el que el
 *   primero y el último son iguales, y el segundo es diferente. Por ejemplo [2, 1, 2].
 * - En el array [2, 1, 2, 3, 3, 4, 2, 4] hay 2 bumeranes ([2, 1, 2] y [4, 2, 4]).
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal"
 *   para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en
 *   https://retosdeprogramacion.com/semanales2022.
 *
 */

func countBoomerang(_ data: [Int]) -> Int {
    let magicNumber = 3
    var countTotal = 0
    let lengthData = data.count
    
    if lengthData >= magicNumber {
        for idx in data.indices {
            if idx+magicNumber <= lengthData {
                let candidate: [Int] = Array(data[idx..<idx+magicNumber])
                if let firstValue = candidate.first,
                   let lastValue = candidate.last {
                    let midValue = candidate[1]
                    if firstValue == lastValue && firstValue != midValue {
                        print("Aquí un bumerán: \(candidate)")
                        countTotal += 1
                    }
                }
            } else {
                break
            }
        }
    }
    
    return countTotal
}

let candidate1 = [2, 1, 2, 3, 3, 4, 2, 4]
print("En total hay \(countBoomerang(candidate1)) bumerán/es")

let candidate2 = [2, 3]
print("En total hay \(countBoomerang(candidate2)) bumerán/es")

let candidate3 = [2, 3, 2, 3, 5, 1, 5]
print("En total hay \(countBoomerang(candidate3)) bumerán/es")

let candidate4 = [2, 7, 2, 3, -5, 1, -5]
print("En total hay \(countBoomerang(candidate4)) bumerán/es")

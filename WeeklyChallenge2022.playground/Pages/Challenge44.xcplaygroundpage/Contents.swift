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

func numberOfBoomerangs(numbers: [Int]) -> Int {

    if numbers.count < 3 { return 0 }
    
    var boomerangs = 0

    (1..<numbers.count - 1).forEach { index in

        let prev = numbers[index - 1]
        let current = numbers[index]
        let next = numbers[index + 1]

        if prev == next && prev != current {
            print("[\(prev), \(current), \(next)]")
            boomerangs += 1
        }
    }

    return boomerangs
}

print(numberOfBoomerangs(numbers: [2, 1, 2, 3, 3, 4, 2, 4]))
print(numberOfBoomerangs(numbers: [2, 1, 2, 1, 2]))
print(numberOfBoomerangs(numbers: [1, 2, 3, 4, 5]))
print(numberOfBoomerangs(numbers: [2, 2, 2, 2, 2]))
print(numberOfBoomerangs(numbers: [2, -2, 2, -2, 2]))
print(numberOfBoomerangs(numbers: [2, -2]))
print(numberOfBoomerangs(numbers: [2]))
print(numberOfBoomerangs(numbers: []))

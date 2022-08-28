import Foundation

/*
 * Reto #34
 * LOS NÚMEROS PERDIDOS
 * Fecha publicación enunciado: 22/08/22
 * Fecha publicación resolución: 29/08/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Dado un array de enteros ordenado y sin repetidos, crea una función que calcule y retorne todos los que faltan entre el mayor y el menor.
 * - Lanza un error si el array de entrada no es correcto.
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en https://retosdeprogramacion.com/semanales2022.
 *
 */

enum WrongArrayError: Error {
    case empty
    case nonUniqueValues
    case unsorted
}

func getMissedValues(numbers: Array<Int>) throws -> Array<Int> {
    var missedValues: Array<Int> = []
    if(numbers.isEmpty) {
        throw WrongArrayError.empty
    }
    var index = 0
    try numbers.sorted().forEach { number in
        if(number != numbers[index]) {
            throw WrongArrayError.unsorted
        }
        index += 1
    }
    if(Array(Set(numbers)).count != numbers.count) {
        throw WrongArrayError.nonUniqueValues
    }
    (0...(numbers.last! - numbers.first!)).forEach { index in
        if(!numbers.contains(index + numbers.first!)) {
            missedValues.append(index + numbers.first!)
        }
    }
    return missedValues
}

func printMissedValues(numbers: Array<Int>) {
    do {
        print(try getMissedValues(numbers: numbers))
    } catch WrongArrayError.unsorted {
        print("El array no es válido porque los elementos no están correctamente ordenados")
    } catch WrongArrayError.nonUniqueValues {
        print("El array no es válido porque tiene elementos repetidos")
    } catch {
        print("El array está vacío")
    }
}

printMissedValues(numbers: [5,5,6,7,8])
printMissedValues(numbers: [8,7,6,5])
printMissedValues(numbers: [])
printMissedValues(numbers: [5])
printMissedValues(numbers: [5,6,7,8])
printMissedValues(numbers: [5,8])

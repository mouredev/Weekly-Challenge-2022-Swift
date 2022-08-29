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

enum LostNumbers: Error {
    case numbersError
    
    var description: String {
        switch self {
        case .numbersError:
            return "El listado no puede poseer repetidos ni estar desordenado, y debe tener mínimo 2 valores."
        }
    }
}

func lostNumbers(numbers: [Int]) throws -> [Int] {

    // Errors
    if numbers.count < 2 {
        throw LostNumbers.numbersError
    }
    
    let first = numbers.first!
    let last = numbers.last!
    let asc = first < last
    
    var prev: Int?
    try numbers.forEach { number in
        if let prev = prev {
            if asc ? number <= prev : number >= prev {
                throw LostNumbers.numbersError
            }
        }
        prev = number
    }

    // Lost
    var lost: [Int] = []

    ((asc ? first : last)...(asc ? last : first)).forEach { number in
        if !numbers.contains(number) {
            lost.append(number)
        }
    }

    return lost
}

do {
    print(try lostNumbers(numbers: [1, 3, 5]))
    print(try lostNumbers(numbers: [5, 3, 1]))
    print(try lostNumbers(numbers: [5, 1]))
    print(try lostNumbers(numbers: [-5, 1]))
    //print(try lostNumbers(numbers: [1, 3, 3, 5]))
    //print(try lostNumbers(numbers: [5, 7, 1]))
    print(try lostNumbers(numbers: [10, 7, 7, 1]))
} catch LostNumbers.numbersError {
    print(LostNumbers.numbersError.description)
}

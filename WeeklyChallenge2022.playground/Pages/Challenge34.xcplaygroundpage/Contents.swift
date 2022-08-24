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

enum State {
    case unknown
    case duplicates
    case unsorted
    case empty
    case oneElement
    case correct
}

func losQueFaltan(array: [Int]) -> [Int]? {
    var state: State = .unknown
    var output: [Int] = []
    
    if (array.isEmpty) { state = .empty }
    else if (Set(array).count != array.count) { state = .duplicates }
    else if (array.sorted() != array) { state = .unsorted }
    else if (array.last != array.first) { state = .correct }
    else { state = .oneElement }
    
    switch(state) {
    case .unknown:
        print("\(array): 🤦‍♀️ Ehhh! Algo pasa pero no sé que es")
    case .duplicates:
        print("\(array): 🔁 Ehhh! Aquí hay números repetidos")
    case .unsorted:
        print("\(array): 📏 Ehhh! Esto no está ordenado")
    case .empty:
        print("\(array): 🪫 El array está vacio")
    case .oneElement:
        print("\(array): 🚨 El array solo tiene un elemento")
    case .correct:
        for i in array.first!...array.last! {
            output.append(i)
        }
        print("¡BIEEEEN! 🎊 \(output)")
    }
    
    return output
}


losQueFaltan(array: [1, 4, 7, 11, 12, 16])
losQueFaltan(array: [])
losQueFaltan(array: [1, 1, 2])
losQueFaltan(array: [1, 3, 2])
losQueFaltan(array: [1])
losQueFaltan(array: [1, 5, 9])

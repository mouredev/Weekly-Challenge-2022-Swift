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

// CALLS

let arraysTest = [
    [1, 2, 5],
    [1, 2, 5, 3],
    [1, 1, 2],
    [2, 6, 8],
    [10, 15, 16]
]

for arrayTest in arraysTest {
    do {
        try getLostNumbers(in: arrayTest)
    } catch let error as ArrayError {
        print("\(arrayTest) -> \(error.description)")
    }
}

// Data & Calculations

enum ArrayError: Error, CustomStringConvertible {
    case notSorted(ascending: Bool)
    case containsRepeatedElements
    case notEnoughElements
    
    var description: String {
        switch self {
        case .notSorted(let ascending): return "The array must be sorted in \(ascending ? "ASCENDING" : "DESCENDING") order."
        case .containsRepeatedElements: return "The array must NOT contain any repeated elements."
        case .notEnoughElements: return "The array must contain, at least, two elements."
        }
    }
}

func getLostNumbers(in array: [Int]) throws {
    
    // Error Handling
    
    let ascendingOrder = true
    
    let arrayMeetsConditionsResult = array.containsUniqueElementsAndIsSorted(ascending: ascendingOrder)
    try handleArrayErrors(array: array, withConditionResult: arrayMeetsConditionsResult, wantsAscendingOrder: ascendingOrder)
    
    // Calculations
    
    var lostNumbers = [Int]()
    
    for i in array.first!...array.last! {
        if array.contains(i) == false {
            lostNumbers.append(i)
        }
    }
    
    // Results
    
    print("The lost numbers are: \(lostNumbers)")
}

func handleArrayErrors(array: [Int], withConditionResult conditionResult: Int, wantsAscendingOrder: Bool) throws {
    guard array.count >= 2 else {
        throw ArrayError.notEnoughElements
    }
    
    switch conditionResult {
    case -1: throw ArrayError.notSorted(ascending: wantsAscendingOrder)
    case 1: throw ArrayError.containsRepeatedElements
    default: break
    }
}

extension Array where Element: Comparable & Hashable {
    
    /// Determines whether an array meets any, none or both of the next conditions: its sorted and doesn't contain repeated elements.
    /// - Returns -1 when: the array is NOT sorted in the given way (ascending or descending)
    /// - Returns 0 when: the array is sorted and doesn't contain repeated elements.
    /// - Returns 1 when: the array contains repeated elements.
    func containsUniqueElementsAndIsSorted(ascending: Bool) -> Int {
        for (index, item) in self.enumerated() {
            if index < self.count - 1 {
                let nextItem = self[index + 1]
                if item == nextItem {
                    return 1
                }
                
                if (item > self[index+1] && ascending) || (item < self[index+1] && !ascending) {
                    return -1
                }
            }
        }
        
        return 0
    }
}

import Foundation

/*
 * Reto #29
 * ORDENA LA LISTA
 * Fecha publicación enunciado: 18/07/22
 * Fecha publicación resolución: 26/07/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea una función que ordene y retorne una matriz de números.
 * - La función recibirá un listado (por ejemplo [2, 4, 6, 8, 9]) y un parámetro adicional
 *   "Asc" o "Desc" para indicar si debe ordenarse de menor a mayor o de mayor a menor.
 * - No se pueden utilizar funciones propias del lenguaje que lo resuelvan automáticamente.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

enum SortOrderType {
    case ASC
    case DESC
}

func customSort(order: SortOrderType, data: [Int]) {
    
    var outputData = data
    
    for firstIterationIndex in 0 ..< outputData.count {
        for secondIterationIndex in 0 ..< outputData.count {
            if compareWorkingValues(orderType: order, val1: outputData[firstIterationIndex], val2: outputData[secondIterationIndex]) {
                let aux = outputData[firstIterationIndex]
                outputData[firstIterationIndex] = outputData[secondIterationIndex]
                outputData[secondIterationIndex] = aux
            }
        }
    }
    
    print("##### orden: \(order) - inputData: \(data) - outputData: \(outputData) #####")
}

func compareWorkingValues(orderType: SortOrderType, val1: Int, val2: Int) -> Bool {
    switch orderType {
    case .ASC:
        return val1 < val2
    case .DESC:
        return val1 > val2
    }
}



// MARK: TEST CASES

customSort(order: .ASC, data: [5, 12, 8, 3, 1, 5, 9, 10, 7, 2])
// SALIDA: ##### orden: ASC - inputData: [5, 12, 8, 3, 1, 5, 9, 10, 7, 2] - outputData: [1, 2, 3, 5, 5, 7, 8, 9, 10, 12] #####

customSort(order: .DESC, data: [5, 12, 8, 3, 1, 5, 9, 10, 7, 2])
// SALIDA: ##### orden: DESC - inputData: [5, 12, 8, 3, 1, 5, 9, 10, 7, 2] - outputData: [12, 10, 9, 8, 7, 5, 5, 3, 2, 1] #####

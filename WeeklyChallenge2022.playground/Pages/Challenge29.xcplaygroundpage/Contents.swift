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

func quickSort(numbers: [Int], first: Int = 0, last: Int) -> [Int] {
    let p = numbers[(first + last) / 2]
    var i = first
    var j = last
    var result = numbers
    
    repeat {
        while(result[i] < p) { i += 1 }
        while(p < result[j]) { j -= 1 }
        if(i <= j) {
            let aux = result[i]
            result[i] = result[j]
            result[j] = aux
            i += 1
            j -= 1
        }
    } while(i <= j)
    if(first < j) {
        result = quickSort(numbers: result, first: first, last: j)
    }
    if(i < last) {
        result = quickSort(numbers: result, first: i, last: last)
    }
    
    return result
}

func bubbleSort(numbers: [Int]) -> [Int] {
    var result = numbers
    
    (1...result.count-1).forEach { _ in
        (0..<result.count-1).forEach { i in
            if(result[i] > result[i+1]) {
                let aux = result[i]
                result[i] = result[i+1]
                result[i+1] = aux
            }
        }
    }
    
    return result
}

func insertionSort(numbers: [Int]) -> [Int] {
    var result = numbers
    
    (1..<result.count).forEach { i in
        let aux = result[i]
        var j = i - 1
        while(j >= 0 && result[j] > aux) {
            result[j+1] = result[j]
            j -= 1
            result[j+1] = aux
        }
    }
    
    return result
}

func sortNumbers(numbers: [Int], order: String) {
    if(order == "Asc") {
        print("Quicksort: \(quickSort(numbers: numbers, last: numbers.count - 1))")
        print("Bubble: \(bubbleSort(numbers: numbers))")
        print("Insertion: \(insertionSort(numbers: numbers))")
        print()
    } else {
        print("Quicksort: \(Array(quickSort(numbers: numbers, last: numbers.count - 1).reversed()))")
        print("Bubble: \(Array(bubbleSort(numbers: numbers).reversed()))")
        print("Insertion: \(Array(insertionSort(numbers: numbers).reversed()))")
        print()
    }
}

sortNumbers(numbers: [8, 4, 2, 9, 1], order: "Asc")
sortNumbers(numbers: [9, 8, 0, 2, 5, 1, 3, 2, 9], order: "Desc")
sortNumbers(numbers: [3, 10, 1, 8, 15, 5, 12, 6, 5, 4], order: "Asc")

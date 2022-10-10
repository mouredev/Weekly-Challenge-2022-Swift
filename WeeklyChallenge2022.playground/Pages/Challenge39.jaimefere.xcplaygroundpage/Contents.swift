import Foundation

/*
 * Reto #39
 * TOP ALGORITMOS: QUICK SORT
 * Fecha publicación enunciado: 27/09/22
 * Fecha publicación resolución: 03/10/22
 * Dificultad: MEDIA
 *
 * Enunciado: Implementa uno de los algoritmos de ordenación más famosos: el "Quick Sort",
 * creado por C.A.R. Hoare.
 * - Entender el funcionamiento de los algoritmos más utilizados de la historia nos ayuda a
 *   mejorar nuestro conocimiento sobre ingeniería de software. Dedícale tiempo a entenderlo,
 *   no únicamente a copiar su implementación.
 * - Esta es una nueva serie de retos llamada "TOP ALGORITMOS", donde trabajaremos y entenderemos
 *   los más famosos de la historia.
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal"
 *   para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en
 *   https://retosdeprogramacion.com/semanales2022.
 *
 */

// Already implemented in challenge #29
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

let numbers = [3, 10, 1, 8, 15, 5, 12, 6, 5, 4]
print("Quicksort ASC: \(quickSort(numbers: numbers, last: numbers.count - 1))")
print("Quicksort DESC: \(Array(quickSort(numbers: numbers, last: numbers.count - 1).reversed()))")

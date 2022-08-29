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

func sort(numbers: [Int], asc: Bool) -> [Int] {

    var sortedNumbers: [Int] = []
    
    for number in numbers {
        
        var added = false
        
        for (index, sortedNumber) in sortedNumbers.enumerated() {
            
            if asc ? number < sortedNumber : number > sortedNumber {
                sortedNumbers.insert(number, at: index)
                added = true
                break
            }
        }
        
        if !added {
            sortedNumbers.append(number)
        }
    }
    
    return sortedNumbers
}

print(sort(numbers: [4, 6, 1, 8, 2], asc: true)) // 1, 2, 4, 6, 8
print(sort(numbers: [4, 6, 1, 8, 2], asc: false)) // 8, 6, 4, 2, 1

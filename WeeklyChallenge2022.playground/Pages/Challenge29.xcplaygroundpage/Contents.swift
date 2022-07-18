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

enum SortBy {
    case Asc
    case Desc
    
    func compareValue<T: Comparable>(num: T, with: T) -> Bool {
        switch self {
        case .Asc:
            return num > with
        case .Desc:
            return num < with
        }
    }
}

func sort<T: Comparable>(array: [T], by: SortBy) -> [T] {
    var arrayTmp = array
    var switched = 0
    repeat {
        var tmp = 0
        for index in 0..<arrayTmp.count {
            if index+1 < arrayTmp.count {
                if by.compareValue(num: arrayTmp[index], with: arrayTmp[index+1]) {
                    tmp += 1
                    let a = arrayTmp[index]
                    arrayTmp[index] = arrayTmp[index+1]
                    arrayTmp[index+1] = a
                }
            }
        }
        switched = tmp
    } while switched != 0
    return arrayTmp
}

var arrayInt = [1, 4, 2, 5, 3, 6, 7, 4, 0]
print(sort(array: arrayInt, by: .Asc))
print(sort(array: arrayInt, by: .Desc))

var arrayDouble = [1.3, 4.2, 2.2, 5.5, 3.2, 6.3, 7.1, 4.6, 0.9]
print(sort(array: arrayDouble, by: .Asc))
print(sort(array: arrayDouble, by: .Desc))

var arrayString = ["A", "P", "C", "D", "Q", "X", "O", "Y", "V"]
print(sort(array: arrayString, by: .Asc))
print(sort(array: arrayString, by: .Desc))

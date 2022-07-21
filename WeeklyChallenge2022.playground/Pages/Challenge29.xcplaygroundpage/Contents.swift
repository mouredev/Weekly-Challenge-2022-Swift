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
let myIntArray = [2, 4, 10, 8, 9]

enum Orden {
    case Asc
    case Desc
}

func ordenarLista(lista: [Int], param: Orden) -> [Int] {
    
    var myTempArray = [Int]()
    
    if param == .Asc {
        for index in UInt8.min...UInt8.max {
            for item in lista {
                if item == index {
                    myTempArray.append(item)
                }
            }
        }
    }

    if param == .Desc {
        for index in (UInt8.min...UInt8.max).reversed() {
            for item in lista {
                if item == index {
                    myTempArray.append(item)
                }
            }
        }
    }
  
    return myTempArray
}

print(ordenarLista(lista: myIntArray, param: .Asc))
print(ordenarLista(lista: myIntArray, param: .Desc))

import Foundation

/*
 * Reto #32
 * EL SEGUNDO
 * Fecha publicación enunciado: 08/08/22
 * Fecha publicación resolución: 15/08/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Dado un listado de números, encuentra el SEGUNDO más grande.
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en https://retosdeprogramacion.com/semanales2022.
 *
 */



func segundoMayor(listado: [Int])->Int? {
    
    var listaOrdenada : [Int] = []
    
    for number in listado {
        var found = false
        for (index, numOrdenado) in listaOrdenada.enumerated() {
            if number >= numOrdenado {
                if number != numOrdenado {
                    listaOrdenada.insert(number, at: index)
                }
                found = true
                break
            }
        }
        if !found {
            listaOrdenada.append(number)
        }
    }
    
    return listaOrdenada.count >= 2 ? listaOrdenada[1] : nil
//    let listadoOrdenado = listado.sorted(by: >)
//
//    return listadoOrdenado[1]
    
}


let numeros = [34,56,123,789,1243,675,12243, 12243]

segundoMayor(listado: numeros)

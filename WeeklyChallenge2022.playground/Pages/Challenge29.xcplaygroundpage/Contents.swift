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
func orderList(unorder: [Int], type: String) -> [Int] {
    var otherList : [Int] = unorder
    for item in 0..<otherList.count {
        for item2 in 0..<otherList.count {
            if(type=="Desc"){
                if(otherList[item] > otherList[item2]){
                    let temp : Int = otherList[item]
                    otherList[item] = otherList[item2]
                    otherList[item2] = temp
                }
            }
            if(type=="Asc"){
                if(otherList[item] < otherList[item2]){
                    let temp : Int = otherList[item]
                    otherList[item] = otherList[item2]
                    otherList[item2] = temp
                }
            }
        }
    }
    return otherList
}

orderList(unorder: [2,4,1,5], type: "Desc")
orderList(unorder: [2,4,1,5], type: "Asc")
orderList(unorder: [], type: "Assc")

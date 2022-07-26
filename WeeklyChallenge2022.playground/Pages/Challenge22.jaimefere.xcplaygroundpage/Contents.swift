import Foundation

/*
 * Reto #22
 * CONJUNTOS
 * Fecha publicación enunciado: 01/06/22
 * Fecha publicación resolución: 07/06/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea una función que reciba dos array, un booleano y retorne un array.
 * - Si el booleano es verdadero buscará y retornará los elementos comunes de los dos array.
 * - Si el booleano es falso buscará y retornará los elementos no comunes de los dos array.
 * - No se pueden utilizar operaciones del lenguaje que lo resuelvan directamente.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

func findItems(array1: [AnyObject], array2: [AnyObject], commons: Bool) -> [AnyObject] {
    if(commons) {
        return array1.filter{ item in array2.contains(where: {$0 === item}) }
    } else {
        return array1.filter{ item in array2.filter{ $0 === item }.count == 0 } + array2.filter{ item in array1.filter{ $0 === item }.count == 0 }
    }
}

print("Elementos comunes: \(findItems(array1: ["manzana", "pera", "mango"] as [AnyObject], array2: ["manzana", "melón"] as [AnyObject], commons: true))")
print("Elementos distintos: \(findItems(array1: ["manzana", "pera", "mango"] as [AnyObject], array2: ["manzana", "melón"] as [AnyObject], commons: false))")
print("Elementos comunes: \(findItems(array1: [2, "pera", 5] as [AnyObject], array2: ["manzana", 5] as [AnyObject], commons: true))")
print("Elementos distintos: \(findItems(array1: [2, "pera", 5] as [AnyObject], array2: ["manzana", 5] as [AnyObject], commons: false))")

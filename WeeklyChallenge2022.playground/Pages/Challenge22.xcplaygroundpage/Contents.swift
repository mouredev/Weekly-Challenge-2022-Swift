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

print(pickAll(commonElements: false, fromArrayA: ["A", "B", "D"], andArrayB: ["B", "C"]))
print(pickAll(commonElements: true, fromArrayA: [2, 4, 6], andArrayB: [1, 2, 3, 4, 5, 6]))

func pickAll<T>(commonElements: Bool, fromArrayA arrayA: [T], andArrayB arrayB: [T]) -> [T] where T: Hashable, T: Comparable {
    var pickedElements = [T]()
    
    pickedElements += pick(commonElements: commonElements, fromFirstArray: arrayA, inSecondArray: arrayB)
    pickedElements += pick(commonElements: commonElements, fromFirstArray: arrayB, inSecondArray: arrayA)
    
    return Array(Set(pickedElements)).sorted()
}

func pick<T: Hashable>(commonElements: Bool, fromFirstArray array1: [T], inSecondArray array2: [T]) -> [T] {
    array1.compactMap { element in
        let isCommonAndRequested = array2.contains(element) && commonElements
        let isNotCommonAndRequested = !array2.contains(element) && !commonElements
        
        if isCommonAndRequested || isNotCommonAndRequested  {
            return element
        }
        
        return nil
    }
}

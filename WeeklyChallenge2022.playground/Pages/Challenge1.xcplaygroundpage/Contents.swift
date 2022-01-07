import Foundation

/*
 * Reto #1
 * ¿ES UN ANAGRAMA?
 * Fecha publicación enunciado: 03/01/22
 * Fecha publicación resolución: 10/01/22
 * Dificultad: MEDIA
 *
 * Enunciado: Escribe una función que reciba dos palabras (String) y retorne verdadero o falso (Bool) según sean o no anagramas.
 * Un Anagrama consiste en formar una palabra reordenando TODAS las letras de otra palabra inicial.
 * NO hace falta comprobar que ambas palabras existan.
 * Dos palabras exactamente iguales no son anagrama.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🗓reto-semanal" para preguntas, dudas o prestar ayuda la acomunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

func comprobarAnagrama(palabra1: String, palabra2: String)-> Bool{
    var array1 = Array(palabra1)
    var array2 = Array(palabra2)
    let mismoNumeroDeLetras = array1.count == array2.count ? true : false
    let sonMismaPalabra = palabra1 == palabra2 ? true : false
    
    if mismoNumeroDeLetras{
        for _ in 0..<array1.count{
            if array2.contains(where: { $0 == array1.first}){
                for (index,value) in array2.enumerated(){
                    if value == array1.first{
                        array2.remove(at: index)
                        break
                    }
                }
                array1.removeFirst()
            }

        }
    }
    return (array1.count == 0 && array2.count == 0) || sonMismaPalabra ? true : false
}

print(comprobarAnagrama(palabra1: "mañano", palabra2: "nañoma"))


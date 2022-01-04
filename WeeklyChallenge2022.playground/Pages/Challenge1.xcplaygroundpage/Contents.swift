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
// LandaetaDev
func funcAnagrama (letWord1:String, letWord2:String) -> Bool {

    let arrWord1 = Array(letWord1)
    var arrWord2 = Array(letWord2)
    var varResult : Bool = false

    if (arrWord1.count == arrWord2.count) && (arrWord1 != arrWord2) {
        
        for i in 0...arrWord1.count-1 {
            
            for j in 0...arrWord2.count-1 {
                
                if arrWord1[i] == arrWord2[j] {
                    arrWord2.remove(at: j)
                    break
                }
                
            }

        }
        
    }

    if arrWord2.count == 0 {
        varResult = true
    }

    return varResult
}

funcAnagrama(letWord1: String("Canada"), letWord2: String("andaCa"))
funcAnagrama(letWord1: String("rablo"), letWord2: String("arbol"))
funcAnagrama(letWord1: String("ralo2"), letWord2: String("ao2"))
funcAnagrama(letWord1: String("prueba"), letWord2: String("prueba"))
funcAnagrama(letWord1: String("prueba"), letWord2: String("rupbae"))
funcAnagrama(letWord1: String("prueba"), letWord2: String("rupbaeXc"))

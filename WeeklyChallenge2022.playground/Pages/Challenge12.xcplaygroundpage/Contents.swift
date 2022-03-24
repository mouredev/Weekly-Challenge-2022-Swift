import Foundation

/*
 * Reto #12
 * ¿ES UN PALÍNDROMO?
 * Fecha publicación enunciado: 21/03/22
 * Fecha publicación resolución: 28/03/22
 * Dificultad: MEDIA
 *
 * Enunciado: Escribe una función que reciba un texto y retorne verdadero o falso (Boolean) según sean o no palíndromos.
 * Un Palíndromo es una palabra o expresión que es igual si se lee de izquierda a derecha que de derecha a izquierda.
 * NO se tienen en cuenta los espacios, signos de puntuación y tildes.
 * Ejemplo: Ana lleva al oso la avellana.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

func isPalindrome(str: String) -> Bool {
    
    var strArray: [Character] = []
    var str1 = ""
    var str2 = ""
    
    for i in str {
        strArray.append(i)
        switch i {
        case ",":
            strArray.removeLast()
        case ".":
            strArray.removeLast()
        case " ":
            strArray.removeLast()
        case "\u{27}":
            strArray.removeLast()
        default:
            strArray
        }
        var stp = 0
        for i in strArray {
            switch i {
            case "á":
                strArray[stp] = "a"
            case "é":
                strArray[stp] = "e"
            case "í":
                strArray[stp] = "i"
            case "ó":
                strArray[stp] = "o"
            case "ú":
                strArray[stp] = "u"
            default:
                strArray
            }
            stp += 1
        }
    }
    for i in strArray {
        str1.append(i.lowercased())
    }
    for i in strArray.reversed() {
        str2.append(i.lowercased())
    }
    if str1 == str2 {
        return true
    }
    return false
}

isPalindrome(str: "Ana Lleva al oSo la avéllaNa")
isPalindrome(str: "A la caTalana         Baal, atácala.")







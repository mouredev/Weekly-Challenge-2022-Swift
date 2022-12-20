import Foundation

/*
 * Reto #50
 * LA ENCRIPTACIÓN DE KARACA
 * Fecha publicación enunciado: 12/11/22
 * Fecha publicación resolución: 19/12/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea una función que sea capaz de encriptar y desencriptar texto utilizando el
 * algoritmo de encriptación de Karaca (debes buscar información sobre él).
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal"
 *   para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en
 *   https://retosdeprogramacion.com/semanales2022.
 *
 */
let vowels = "aeiou"

func karacaEncrypt(_ text: String) -> String {
    var result = ""
    text.reversed().forEach { letter in
            result = "\(result)\(vowels.contains(letter) ? String(vowels.firstIndex(of: letter)!.utf16Offset(in: vowels)) : String(letter))"
    }
    return "\(result)aca"
}

func karacaDecrypt(_ text: String) -> String {
    var result = ""
    text[..<text.index(text.startIndex, offsetBy: text.count - 3)].reversed().forEach { letter in
            result = "\(result)\(letter.isNumber && letter.wholeNumberValue! >= 0 && letter.wholeNumberValue! < 5 ? vowels[String.Index(utf16Offset: letter.wholeNumberValue!, in: vowels)] : letter)"
    }
    return result
}

var text = "apple"
var encryptedText = karacaEncrypt(text)
print(encryptedText)  // Imprime "1lpp0aca"
var decryptedText = karacaDecrypt(encryptedText)
print(decryptedText)  // Imprime "apple"
text = "banana"
encryptedText = karacaEncrypt(text)
print(encryptedText)  // Imprime "0n0n0baca"
decryptedText = karacaDecrypt(encryptedText)
print(decryptedText)  // Imprime "banana"

import Foundation

/*
 * Reto #9
 * CÓDIGO MORSE
 * Fecha publicación enunciado: 02/03/22
 * Fecha publicación resolución: 07/03/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea un programa que sea capaz de transformar texto natural a código morse y viceversa.
 * - Debe detectar automáticamente de qué tipo se trata y realizar la conversión.
 * - En morse se soporta raya "—", punto ".", un espacio " " entre letras o símbolos y dos espacios entre palabras "  ".
 * - El alfabeto morse soportado será el mostrado en https://es.wikipedia.org/wiki/Código_morse.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

func decoder(input: String) -> String {

    var decodedInput = ""

    let naturalDict = ["A":".—", "N":"—.", "0":"—————",
                           "B":"—...", "Ñ":"——.——", "1":".————",
                           "C":"—.—.", "O":"———", "2":"..———",
                           "CH":"————", "P":".——.", "3":"...——",
                           "D":"—..", "Q":"——.—", "4":"....—",
                           "E":".", "R":".—.", "5":".....",
                           "F":"..—.", "S":"...", "6":"—....",
                           "G":"——.", "T":"—", "7":"——...",
                           "H":"....", "U":"..—", "8":"———..",
                           "I":"..", "V":"...—", "9":"————.",
                           "J":".———", "W":".——", ".":".—.—.—",
                           "K":"—.—", "X":"—..—", ",":"——..——",
                           "L":".—..", "Y":"—.——", "?":"..——..",
                           "M":"——", "Z":"——..", "\"":".—..—.", "/":"—..—."]

    var morseDict: [String: String] = [:]
    naturalDict.forEach { key, value in
        morseDict[value] = key
    }

    if input.rangeOfCharacter(from: CharacterSet.letters) != nil || input.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil {

        // Natural

        var index = 0
        var ch = false

        input.uppercased().forEach { character in
            if !ch && character != " " {
                let nextIndex = index + 1
                if character == "C" && nextIndex < input.count && Array(input.uppercased())[nextIndex] == "H" {
                    decodedInput += naturalDict["CH"] ?? ""
                    ch = true
                } else {
                    decodedInput += naturalDict[character.description] ?? ""
                }

                decodedInput += " "
            } else {
                if (!ch) {
                    decodedInput += " "
                }
                ch = false
            }

            index += 1
        }

    } else if (input.contains(".") || input.contains("—")) {

        // Morse

        input.components(separatedBy: "  ").forEach { word in
            word.components(separatedBy: " ").forEach { symbols in
                decodedInput += morseDict[symbols] ?? ""
            }
            decodedInput += " "
        }
    }

    return decodedInput
}

let naturalText = "Chocapic. Es una marca de cereales?"
let morseText = decoder(input: naturalText)
print(morseText)
print(decoder(input: morseText))

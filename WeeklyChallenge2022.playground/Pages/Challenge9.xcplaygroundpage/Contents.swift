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
let letter = [
    "a", "b", "c", "ch", "d", "e",
    "f", "g", "h", "i", "j", "k",
    "l", "m", "n", "ñ", "o", "p",
    "q", "r", "s", "t", "u", "v",
    "w", "x", "y", "z", "0", "1",
    "2", "3", "4", "5", "6", "7",
    "8", "9", ".", ",", "?", "\"",
    " "
]

let code = [
    ".-", "-...", "-.-.", "————", "-..", ".",
    "..-.", "--.", "....", "..", ".---",
    "-.-", ".-..", "--", "-.", "——.——", "---", ".--.",
    "--.-", ".-.", "...", "-", "..-", "...-",
    ".--", "-..-", "-.--", "--..", "-----", ".----",
    "..---", "...--", "....-", ".....", "-....", "--...",
    "---..", "----.", ".—.—.—", "——..——", "..——..", ".—..—.",
    "/"
]

let word = "Terry0022 is the \"rockstar\""
print("Texto a traducir es: \(word)")
var text = translate(text: word)
print("Texto traducido \(text)")

let morse = "- . .-. .-. -.-- ----- ----- ..--- ..---  .. ...  - .... .  .—..—. .-. --- -.-. -.- ... - .- .-. .—..—."
print("Código morse a traducir es: \(morse)")
text = translate(text: morse)
print("Código traducido \(text)")

func translate(text: String) -> String {
    if (contains(letter: letter, text: text)) {
        return translateToMorse(text: text)
    } else {
        return translateToText(morse: text)
    }
}

func translateToMorse(text: String) -> String {
    var morse = ""
    let letters = text.lowercased().map(String.init)
    for i in 0..<letters.capacity {
        for j in 0..<letter.capacity {
            if letters[i] == letter[j] {
                if j == 42 {
                    morse += " "
                } else {
                    morse += code[j] + " "
                }
                break
            }
        }
    }
    return morse
}

func translateToText(morse: String) -> String {
    var text = ""
    let tmp = morse.replacingOccurrences(of: "  ", with: " / ")
    let array = tmp.components(separatedBy: " ")
    for i in 0..<array.capacity {
        for j in 0..<code.capacity {
            if array[i] == code[j] {
                if j == 42 {
                    text += " "
                } else {
                    text += letter[j]
                }
                break
            }
        }
    }
    return text
}

func contains(letter: [String], text: String) -> Bool {
    for l in letter {
        return text.contains(l)
    }
    return false
}

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

func decodificar(texto: String) -> String {
    
    var result : String = ""
    
    let codigoMorse = ["A":".—", "N":"—.", "0":"—————",
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
    
    var morseDict : [String:String] = [:]
    codigoMorse.forEach { key, value in
        morseDict[value] = key
    }
    
    var i = 0
    var dosChar = false
    
    if texto.rangeOfCharacter(from: CharacterSet.letters) != nil || texto.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil {
        // Texto normal
        texto.uppercased().forEach { character in
            if !dosChar && character != " " {
                // Controlamos la CH ya que son dos carácteres
                let nextI = i + 1
                if character == "C" && nextI < texto.count && Array(texto.uppercased())[nextI] == "H" {
                    result += codigoMorse["CH"] ?? ""
                    dosChar = true
                } else {
                    result  += codigoMorse[character.description] ?? ""
                }
                result += " "
            } else {
                if !dosChar {
                    result += " "
                }
                dosChar = false
            }
            
            i += 1
        }
    }else if ( texto.contains(".") || texto.contains("-") ){
        // Texto morse
        texto.components(separatedBy: "  ").forEach { word in
            word.components(separatedBy: " ").forEach { letter in
                result += morseDict[letter] ?? ""
            }
            result += " "
        }
    }
    
    return result
}

let test = "Que la fuerza te acompañe"
let textoMorse = decodificar(texto: test)

print(textoMorse)
print(decodificar(texto: textoMorse))


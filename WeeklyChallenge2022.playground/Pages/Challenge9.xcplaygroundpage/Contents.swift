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

<<<<<<< HEAD
let frase = "EN UN LUGAR DE LA MANCHA DE CUYO NOMBRE NO QUIERO ACORDARME"
let latinToMorse = ["A":"._", "B":"_...","C":"_._.","CH":"____", "D":"_..","E":".","F":".._.","G":"__.","H":"....","I":"..","J":".___","K":"_._","L":"._..","M":"__","N":"_.","Ñ":"__.__","O":"___","P":".__.","Q":"__._","R":"._.","S":"...","T":"_","U":".._","V":"..._","W":".__","X":"_.._","Y":"_.__","Z":"__.."]
let MorseToLatin = ["._":"A", "_...":"B","_._.":"C","____":"CH", "_..":"D",".":"E",".._.":"F","__.":"G","....":"H","..":"I",".___":"J","_._":"K","._..":"L","__":"M","_.":"N","__.__":"Ñ","___":"O",".__.":"P","__._":"Q","._.":"R","...":"S","_":"T",".._":"U","..._":"V",".__":"W","_.._":"X","_.__":"Y","__..":"Z"]

func palabraToMorse(palabra:String,dicionario:[String:String]) -> String {
 palabra.map { caracter in
     dicionario[String(caracter)] ?? "?"
   }.joined(separator: " ")
  
}

func fraseToMorse(fase:String, diccionario:[String:String]) -> String {
   frase.split(separator: " ").map { palabra in
        palabraToMorse(palabra: String(palabra), dicionario: diccionario)
    }.joined(separator: "  ")
}

func palabraLatin(palabra:String,dicionario:[String:String]) -> String {
    palabra.components(separatedBy: "  ").map { cadena in
        cadena.split(separator: " ").map { caracter in
             dicionario[String(caracter)] ?? " "
         }.joined()
    }.joined(separator: " ")
    

  
}

print(fraseToMorse(fase: frase, diccionario: latinToMorse))
print(palabraLatin(palabra: fraseToMorse(fase: frase, diccionario: latinToMorse), dicionario: MorseToLatin))
print(palabraLatin(palabra: "._ _... _._. _.. . .._. __. .... .. .___ _._ ._.. __ _. ___ .__. __._ ._. ... _ .._ .__ _.._ _.__ __..", dicionario: MorseToLatin))

=======
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
>>>>>>> a232f2e659634e0c91f2e9b5be912986bff92faf

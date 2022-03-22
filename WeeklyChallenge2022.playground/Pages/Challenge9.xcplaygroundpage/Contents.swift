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
var diccionary = loadHashMap()

print(translate(dictionary: diccionary, word: "Hola"))
print(translate(dictionary: diccionary, word: "Mouredev"))

func translate(dictionary: [String : String], word: String) -> String {
    var finalTranslate = ""

    for character in word.lowercased() {
        finalTranslate += (dictionary[String(character)] ?? "") + " "
    }

    return finalTranslate
}

func loadHashMap() -> [String : String] {
    var map = [String : String]()

    map["a"] = ".-"
    map["b"] = "-..."
    map["c"] = "-.-."
    map["d"] = "-.."
    map["e"] = "."
    map["f"] = "..-."
    map["g"] = "--."
    map["h"] = "...."
    map["i"] = ".."
    map["j"] = ".---"
    map["k"] = "-.-"
    map["l"] = ".-.."
    map["m"] = "--"
    map["n"] = "-."
    map["o"] = "---"
    map["p"] = ".--."
    map["q"] = "--.-"
    map["r"] = ".-."
    map["s"] = "..."
    map["t"] = "-"
    map["u"] = "..-"
    map["v"] = "...-"
    map["w"] = ".--"
    map["x"] = "-..-"
    map["y"] = "-.--"
    map["z"] = "--.."
    map["1"] = ".----"
    map["2"] = "..---"
    map["3"] = "...--"
    map["4"] = "....-"
    map["5"] = "....."
    map["6"] = "-...."
    map["7"] = "--..."
    map["8"] = "---.."
    map["9"] = "----."
    map["0"] = "-----"
    return map
}

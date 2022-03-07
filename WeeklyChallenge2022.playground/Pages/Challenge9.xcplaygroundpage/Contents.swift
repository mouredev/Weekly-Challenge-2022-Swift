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

enum Morse: String, CaseIterable {
    case a = ".-"
    case b = "-..."
    case c = "-.-."
    case d = "-.."
    case e = "."
    case f = "..-."
    case g = "--."
    case h = "...."
    case i = ".."
    case j = ".---"
    case k = "-.-"
    case l = ".-.."
    case m = "--"
    case n = "-."
    case ñ = "--.--"
    case o = "---"
    case p = ".--."
    case q = "--.-"
    case r = ".-."
    case s = "..."
    case t = "-"
    case u = "..-"
    case v = "...-"
    case w = ".--"
    case x = "-..-"
    case y = "-.--"
    case z = "--.."
    case _0 = "-----"
    case _1 = ".----"
    case _2 = "..---"
    case _3 = "...--"
    case _4 = "....-"
    case _5 = "....."
    case _6 = "-...."
    case _7 = "--..."
    case _8 = "---.."
    case _9 = "----."
    case emptyValue = ""
    
    static func withLabel(_ label: String) -> Morse {
        return self.allCases.first{ "\($0)" == label } ?? self.emptyValue
    }
}

func charToMorse(_ text: String) -> String {
    switch text {
    case ".": return ".-.-.-"
    case ",": return "--..--"
    case "?": return "..--.."
    case "\"": return ".-..-."
    default: break
    }
    
    return Morse.withLabel(text).rawValue
}

func codeToNatural(_ text: String) -> String {
    switch text {
    case ".-.-.-": return "."
    case "--..--": return ","
    case "..--..": return "?"
    case ".-..-.": return "\""
    default: break
    }
    
    return text == Morse.emptyValue.rawValue ? " " : "\(Morse(rawValue: text) ?? Morse.emptyValue)".replacingOccurrences(of: "_", with: "")
}

func translate(_ text: String) -> String {
    let text = text.lowercased()
    var translation = ""
    
    if text.rangeOfCharacter(from: NSCharacterSet.alphanumerics) != nil {
        text.forEach { char in
            let value: String = "\(char)".contains { $0.isNumber } ? "_\(char)" : "\(char)"
            translation += charToMorse(value) + " "
        }
    } else {
        let textArray = text.split(separator: " ", omittingEmptySubsequences: false).map { "\($0)" }
        textArray.forEach { char in
            translation += codeToNatural("\(char)")
        }
    }
    
    return translation
}


print("\(translate("hola mundo?"))")
print("\(translate(".... --- .-.. .-  -- ..- -. -.. --- ..--.."))")
print("\(translate("10"))")
print("\(translate(".---- ----- "))")
print("\(translate("The meaning of life is 42"))")
print(translate("- .... .  -- . .- -. .. -. --.  --- ..-.  .-.. .. ..-. .  .. ...  ....- ..---"))

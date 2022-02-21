import Foundation

/*
 * Reto #7
 * CONTANDO PALABRAS
 * Fecha publicación enunciado: 14/02/22
 * Fecha publicación resolución: 21/02/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea un programa que cuente cuantas veces se repite cada palabra y que muestre el recuento final de todas ellas.
 * - Los signos de puntuación no forman parte de la palabra.
 * - Una palabra es la misma aunque aparezca en mayúsculas y minúsculas.
 * - No se pueden utilizar funciones propias del lenguaje que lo resuelvan automáticamente.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda la acomunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

extension String {
    func getWords() -> Array<String> {
        var result = Array<String>()
        let characters = Array(self)
        var i: Int = Int.zero
        var word = ""
        while i < characters.count {
            let character = characters[i]
            if character.isValidWord() {
                word += "\(characters[i])"
            } else if !word.isEmpty {
                result.append(word)
                word = ""
            }
            i = i + 1
        }
        if !word.isEmpty {
            result.append(word)
        }
        return result
    }
}

extension Array where Element == String {
    func countOccurrences() -> Dictionary<String, Int> {
        var result = Dictionary<String, Int>()
        self.forEach {
            let word = $0
            if let key = result.keys.first(where: { $0.uppercased() == word.uppercased()}) {
                result[key] = (result[key] ?? 0) + 1
            } else if !word.isEmpty {
                result[word] = 1
            }
        }
        return result
    }
}

extension Character {

    func isValidWord() -> Bool {
        self.isASCIILetter() || self.isASCIINumber() || self.isASCIIMidDash()
    }
    
    func isASCIILetter() -> Bool {
        if let value = self.unicodeScalars.first?.value {
            return value.lowercaseLetters() || value.uppercaseLetters() || value.isSpanishLetter() || value.accentedVowels() || value.vowelsWithUmlauts()
        }
        return false
    }
    
    func isASCIINumber() -> Bool {
        if let value = self.asciiValue {
            return value >= 48 && value <= 57
        }
        return false
    }
    
    func isASCIIMidDash() -> Bool {
        if let value = self.asciiValue {
            return value == 45
        }
        return false
    }
}

extension UInt32 {
    
    func lowercaseLetters() -> Bool {
        (self >= 65 && self <= 90)
    }
    
    func uppercaseLetters() -> Bool {
        (self >= 97 && self <= 122)
    }
    
    func isSpanishLetter() -> Bool {
        self == 164 || self == 165
    }
    
    func accentedVowels() -> Bool {
        self == 160 || self == 130
        || self == 161 || self == 162
        || self == 163 || self == 181
        || self == 144 || self == 214
        || self == 224 || self == 233
    }

    func vowelsWithUmlauts() -> Bool {
        self == 132 || self == 137
        || self == 139 || self == 148
        || self == 129 || self == 142
        || self == 211 || self == 216
        || self == 153 || self == 154
    }
}

print("Esto és una prueba. Es impor-tante, contar las palabras de la PRUEBA".getWords().countOccurrences())
print("There are many variations of passages of Lorem Ipsum available, but the majority have suffered-alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.".getWords().countOccurrences())

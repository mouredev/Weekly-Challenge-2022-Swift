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
            if character.isASCIILetter() || character.isASCIINumber() {
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
    func isASCIILetter() -> Bool {
        if let value = self.asciiValue {
            return (value >= 65 && value <= 90) || (value >= 97 && value <= 122) || value == 164 || value == 165
        }
        return false
    }
    
    func isASCIINumber() -> Bool {
        if let value = self.asciiValue {
            return value >= 48 && value <= 57
        }
        return false
    }
}

print("Esto es una prueba. Es importante, contar las palabras de la PRUEBA".getWords().countOccurrences())
print("There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.".getWords().countOccurrences())

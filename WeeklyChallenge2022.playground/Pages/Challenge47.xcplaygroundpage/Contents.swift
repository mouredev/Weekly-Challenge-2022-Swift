import Foundation

/*
 * Reto #47
 * VOCAL MÁS COMÚN
 * Fecha publicación enunciado: 21/11/22
 * Fecha publicación resolución: 28/11/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea un función que reciba un texto y retorne la vocal que más veces se repita.
 * Si no hay vocales podrá devolver vacío.
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal"
 *   para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en
 *   https://retosdeprogramacion.com/semanales2022.
 *
 */

testCase(words: "Retorna la vocal que más veces se repita", expectedResult: ["e"])
testCase(words: "Prueba corta", expectedResult: ["a"])
testCase(words: "qq ww rr", expectedResult: nil)
testCase(words: "aAáÄÁ", expectedResult: ["a"])
testCase(words: "aaiio", expectedResult: ["a", "i"])

func testCase(words: String, expectedResult: Array<String>?) {
    var repeatedVowel = calculateMostRepeatedVowel(wordToEvaluate: words)
    
    if (repeatedVowel != expectedResult) {
        print("Case with the word '\(words)', returns \(String(describing: repeatedVowel)) but it should be \(String(describing: expectedResult))")
        return
    }
    
    print("Test pass '\(words)' with expected \(String(describing: expectedResult))")
}

func calculateMostRepeatedVowel(wordToEvaluate: String) -> Array<String>? {

    if (wordToEvaluate.isEmpty) {
        return nil
    }
    var vowels = ["a", "e", "i", "o", "u"]
    var repeatedVowel = Dictionary<String, Int>()

    var words = cleanWord(words: wordToEvaluate)
    words.forEach { char in
        if (vowels.contains(String(char))){
            var counter = repeatedVowel[String(char), default: 0] + 1
            repeatedVowel[String(char)] = counter
        }
    }

    if (repeatedVowel.isEmpty) {
        return nil
    }

    return Array(findMaxValueFromMap(maxRepeatedVowel: repeatedVowel).keys)
}

func cleanWord(words: String) -> String {
    return words.folding(options: .diacriticInsensitive, locale: .current).lowercased()
}

func findMaxValueFromMap(maxRepeatedVowel: Dictionary<String, Int>) -> [String : Int] {
    return maxRepeatedVowel.filter { key, value in
        value == maxRepeatedVowel.values.max()
    }
}

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
func getMostRepeatedVowels(text: String) -> String {
    let cleanedText = text.folding(options: .diacriticInsensitive, locale: .current).lowercased()
    var vowelOccurrences: [Character : Int] = [:]
    cleanedText.forEach { letter in
        if("aeiou".contains(letter)) {
            vowelOccurrences[letter] = vowelOccurrences[letter] == nil ? 1 : vowelOccurrences[letter]! + 1
        }
    }
    let maxNumberOfOccurrences = vowelOccurrences.values.max()
    return vowelOccurrences.isEmpty ? "" : String(vowelOccurrences.filter{ $0.value == maxNumberOfOccurrences }.keys)
}

print(getMostRepeatedVowels(text: "¡Pssst!"))
print(getMostRepeatedVowels(text: "¡Hola Brais!"))
print(getMostRepeatedVowels(text: "¡Adiós Brais!"))
print(getMostRepeatedVowels(text: "¡Adiós Martín!"))

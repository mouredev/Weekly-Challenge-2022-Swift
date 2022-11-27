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
func getMostRepeatedVocals(text: String) -> String {
    let cleanedText = text.folding(options: .diacriticInsensitive, locale: .current).lowercased()
    var vocalOccurrences: [Character : Int] = [:]
    cleanedText.forEach { letter in
        if("aeiou".contains(letter)) {
            vocalOccurrences[letter] = vocalOccurrences[letter] == nil ? 1 : vocalOccurrences[letter]! + 1
        }
    }
    return vocalOccurrences.isEmpty ? "" : String(vocalOccurrences.filter{ $0.value == vocalOccurrences.values.max() }.keys)
}

print(getMostRepeatedVocals(text: "¡Pssst!"))
print(getMostRepeatedVocals(text: "¡Hola Brais!"))
print(getMostRepeatedVocals(text: "¡Adiós Brais!"))
print(getMostRepeatedVocals(text: "¡Adiós Martín!"))

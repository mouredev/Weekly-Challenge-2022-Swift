import Foundation

/*
 * Reto #47
 * VOCAL MÁS COMÚN
 * Fecha publicación enunciado: 21/11/22
 * Fecha publicación resolución: 28/11/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea un función que reciba un texto y retorne la vocal que más veces se repita.
 * - Ten cuidado con algunos casos especiales.
 * - Si no hay vocales podrá devolver vacío. 
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal"
 *   para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en
 *   https://retosdeprogramacion.com/semanales2022.
 *
 */

func mostRepeatedVowel(text: String) -> [String] {

    var vowelCount: [Character : Int] = [:]

    text.lowercased().folding(options: .diacriticInsensitive, locale: .current).forEach { character in
        if character == "a" || character == "e" || character == "i" || character == "o" || character == "u" {
            vowelCount[character] = (vowelCount[character] ?? 0) + 1
        }
    }

    var mostRepeated: [String] = []
    var maxRepeated = 0
    
    vowelCount.forEach { (vowel: Character, count: Int) in
        if count >= maxRepeated {
            if count > maxRepeated {
                mostRepeated.removeAll()
            }
            mostRepeated.append(vowel.description)

            maxRepeated = count
        }
    }

    return mostRepeated
}

print(mostRepeatedVowel(text: "aaaaaeeeeiiioou"))
print(mostRepeatedVowel(text: "AáaaaEeeeIiiOoU"))
print(mostRepeatedVowel(text: "eeeeiiioouaaaaa"))
print(mostRepeatedVowel(text: ".-Aá?aaaBbEeeweIiiOoU:"))
print(mostRepeatedVowel(text: ".-Aá?aaa BbEeew eIiiOoU:"))
print(mostRepeatedVowel(text: ".-Aá?aaa BbEeew eEIiiOoU:"))
print(mostRepeatedVowel(text: ".-Aá?aaa BbEeew eEIiiOoUuuuuu:"))
print(mostRepeatedVowel(text: "aeiou"))
print(mostRepeatedVowel(text: "brp qyz"))

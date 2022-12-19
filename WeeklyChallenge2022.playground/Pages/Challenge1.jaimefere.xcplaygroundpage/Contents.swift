import Foundation

/*
 * Reto #1
 * ¿ES UN ANAGRAMA?
 * Fecha publicación enunciado: 03/01/22
 * Fecha publicación resolución: 10/01/22
 * Dificultad: MEDIA
 *
 * Enunciado: Escribe una función que reciba dos palabras (String) y retorne verdadero o falso (Bool) según sean o no anagramas.
 * Un Anagrama consiste en formar una palabra reordenando TODAS las letras de otra palabra inicial.
 * NO hace falta comprobar que ambas palabras existan.
 * Dos palabras exactamente iguales no son anagrama.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda la acomunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

func areAnagrams(wordA: String, wordB: String) -> Bool {
    return wordA.count == wordB.count && (wordA.lowercased().enumerated().filter { (index, c) in
        String(c) == String(Array(wordB)[index]).lowercased() ||  // que cumpla que TODAS las letras están en otra posición (reordenadas)
        wordA.split(separator: c).count != wordB.split(separator: c).count
    }.isEmpty)
}

print(areAnagrams(wordA: "Roma", wordB: ""))
print(areAnagrams(wordA: "Roma", wordB: "Roma"))
print(areAnagrams(wordA: "Roma", wordB: "romana"))
print(areAnagrams(wordA: "Roma", wordB: "Peru"))
print(areAnagrams(wordA: "Roma", wordB: "ramo"))
print(areAnagrams(wordA: "Roma", wordB: "mora"))
print(areAnagrams(wordA: "Roma", wordB: "moar"))
print(areAnagrams(wordA: "Roma", wordB: "amor"))

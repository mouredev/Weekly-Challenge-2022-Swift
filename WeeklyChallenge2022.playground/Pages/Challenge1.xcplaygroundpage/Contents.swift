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
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

func isAnagram(wordA: String, wordB: String) -> Bool {
    wordA != wordB && wordA.sorted() == wordB.sorted()
}

var wordA = "Hola"
var wordB = "aloH"
var result = isAnagram(wordA: wordA, wordB: wordB)
print("\(wordA) and \(wordB) are \(result ? "" : "not ")an anagram.")

wordA = "Hola"
wordB = "aloh"
result = isAnagram(wordA: wordA, wordB: wordB)
print("\(wordA) and \(wordB) are \(result ? "" : "not ")an anagram.")

wordA = "Hola"
wordB = "Hola"
result = isAnagram(wordA: wordA, wordB: wordB)
print("\(wordA) and \(wordB) are \(result ? "" : "not ")an anagram.")

wordA = "paro"
wordB = "ropa"
result = isAnagram(wordA: wordA, wordB: wordB)
print("\(wordA) and \(wordB) are \(result ? "" : "not ")an anagram.")

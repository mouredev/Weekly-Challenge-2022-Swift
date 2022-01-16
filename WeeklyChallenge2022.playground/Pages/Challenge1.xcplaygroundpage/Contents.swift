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

// MARK: - My solution

func checkAnagramFor(firstWord: String, secondWord: String) -> Bool {
    if firstWord == secondWord { return false }
    return firstWord.lowercased().sorted() == secondWord.lowercased().sorted()
}

checkAnagramFor(firstWord: "mouredev", secondWord: "mouredev")
checkAnagramFor(firstWord: "mouredev", secondWord: "euromvde")
checkAnagramFor(firstWord: "mouredev", secondWord: "w")


// MARK: - MoureDev solution
func isAnagram(wordOne: String, wordTwo: String) -> Bool {
    return wordOne.lowercased() == wordTwo.lowercased() ? false : wordOne.lowercased().sorted().elementsEqual(wordTwo.lowercased().sorted())
}

print(isAnagram(wordOne: "amor", wordTwo: "roma"))


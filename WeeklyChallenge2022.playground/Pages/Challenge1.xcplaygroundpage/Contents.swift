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
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🗓reto-semanal" para preguntas, dudas o prestar ayuda la acomunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

func anagram(firstWord: String, secondWord: String) -> Bool {
    let first = firstWord.uppercased().folding(options: .diacriticInsensitive, locale: .current)
    let second = secondWord.uppercased().folding(options: .diacriticInsensitive, locale: .current)
    guard !first.isEmpty, !second.isEmpty, first != second else { return false }
    
    return first.sorted() == second.sorted()
    
}

// Anagram list - Should succeed
anagram(firstWord: "Jamón", secondWord: "Monja")
anagram(firstWord: "Amor", secondWord: "Roma")
anagram(firstWord: "Irónicamente", secondWord: "Renacimiento")
anagram(firstWord: "Frase", secondWord: "Fresa")
anagram(firstWord: "Lucía", secondWord: "Licúa")
anagram(firstWord: "Aspero", secondWord: "Espora")

// Same words list - Should fail
anagram(firstWord: "hola", secondWord: "hola")
anagram(firstWord: "mundo", secondWord: "mundo")
anagram(firstWord: "prueba", secondWord: "prueba")
anagram(firstWord: "MoureDev", secondWord: "MoureDev")

// Random words list - Should fail
anagram(firstWord: "hola", secondWord: "casa")
anagram(firstWord: "ok", secondWord: "okk")
anagram(firstWord: "bueno", secondWord: "boeno")
anagram(firstWord: "aaa", secondWord: "a")

// Empty strings - Should fail
anagram(firstWord: "", secondWord: "something")
anagram(firstWord: "something", secondWord: "")
anagram(firstWord: "", secondWord: "")

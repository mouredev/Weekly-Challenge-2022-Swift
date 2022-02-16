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

func countWords(from phrase: String) -> [String: Int] {
    // Separate words
    let words = phrase.split(whereSeparator: { (char) -> Bool in !char.isLetter && char != "-" })

    // Initialize a dictionary for the unique words
    var wordCount = [String: Int]()

    // For every valid word, if it exists in the dictionary, increment the count else set it to 0
    for word in words {
        let newWord = String(word).lowercased()
        wordCount[newWord, default: 0] += wordCount[newWord] != 0 ? 1 : 0
    }
    return wordCount
}

let frase = "Cuenta cuántos cuentos cuentas porque cuando cuentes cuentos no sabrás cuantos cuentos sabes contar"

let frase2 = "(Code Weekly Challenge Swift/iOS 2022 Reto #7)[https://github.com/mouredev/Weekly-Challenge-2022-Swift]"

print(countWords(from: frase))
print(countWords(from: frase2))

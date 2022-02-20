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

func countWords(phrase: String) {
    let text = phrase.lowercased().components(separatedBy: CharacterSet.punctuationCharacters).joined(separator: "")
    Set(text.split(separator: " ")).forEach { word in
        let wordOccurrences = text.components(separatedBy: word).count - 1
        print("\(word.uppercased()) aparece \(wordOccurrences) \(wordOccurrences > 1 ? "veces" : "vez") en la frase")
    }
}

countWords(phrase: "Hola Brais, yo no me llamo brais.")

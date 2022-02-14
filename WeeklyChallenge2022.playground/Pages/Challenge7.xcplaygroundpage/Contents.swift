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

// -

func countWords(for sentence: String) {
    let words = sentence.lowercased().components(separatedBy: CharacterSet(charactersIn: " ,.:;¡!¿?")).filter { !$0.isEmpty }
    let uniqueWords = Set(words)
    
    for uniqueWord in uniqueWords {
        var counter: Int = 0
        for word in words where word == uniqueWord {
            counter += 1
        }
        print("\"\(uniqueWord)\" appears \(counter) time(s)")
    }
}

countWords(for: "Hola mundo, me gusta el mundo") // 2 mundo, los demás 1
print("\n")
countWords(for: "Hola Brais, mi nombre también es brais.") // 2 brais, los demás 1
print("\n")
countWords(for: "Este texto cuenta con la palabra la repetida 4 veces y la verdad es la única que se repite") // 4 la, los demás 1
print("\n")
countWords(for: "¿Qué te gustaría comer? ¡Qué hambre tengo! que weba") // 2 qué, los demás 1
print("\n")
countWords(for: "El espacio-tiempo es un modelo matemático que combina el espacio y el tiempo") // 3 el, los demás 1 (incluyendo 1 espacio-tiempo)

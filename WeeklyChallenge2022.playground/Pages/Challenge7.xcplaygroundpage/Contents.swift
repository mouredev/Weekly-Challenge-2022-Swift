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
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

extension String {
    var wordList: [String] {
        return components(separatedBy: CharacterSet.alphanumerics.inverted).filter { !$0.isEmpty }
    }
}

func repeatedWords(text: String) {
    var wordsList: [String:Int] = [:]
    let words = text.lowercased().wordList
    
    if !words.isEmpty {
        words.forEach { word in
            if wordsList[word] != nil {
                wordsList.updateValue(1 + 1, forKey: word)
            } else {
                wordsList[word] = 1
            }
        }
        
        wordsList.forEach { key, value in
            print("La palabra '\(key)' se ha repetido \(value) veces")
        }
    } else {
        print("Debes introducir al menos una palabra")
    }
}

repeatedWords(text: "Hola, mi nombre es edu. Mi nombre completo es Edu Martin.")

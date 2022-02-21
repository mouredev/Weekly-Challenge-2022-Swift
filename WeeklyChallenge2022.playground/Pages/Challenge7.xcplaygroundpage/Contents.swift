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

func countingWords(from string: String) -> [String: Int] {

    var newDictionary: [String: Int] = [:]
    let newString = string.lowercased().split(separator: " ")

    for word in newString {
        let newWord = replaceSpecialCharactersFrom(string: String(word))
        if !newWord.contains(" ") {
            newDictionary[newWord] = newDictionary[newWord] == nil ? 1 : newDictionary[newWord]! + 1
        }
    }

    return newDictionary
}

func replaceSpecialCharactersFrom(string: String) -> String {

    return string.replacingOccurrences(of: ".", with: " ")
        .replacingOccurrences(of: ",", with: " ")
        .replacingOccurrences(of: ";", with: " ")
        .replacingOccurrences(of: ":", with: " ")
        .replacingOccurrences(of: "¡", with: " ")
        .replacingOccurrences(of: "!", with: " ")
        .replacingOccurrences(of: "¿", with: " ")
        .replacingOccurrences(of: "?", with: " ")
        .replacingOccurrences(of: "(", with: " ")
        .replacingOccurrences(of: ")", with: " ")
        .replacingOccurrences(of: "[", with: " ")
        .replacingOccurrences(of: "]", with: " ")
        .replacingOccurrences(of: "{", with: " ")
        .replacingOccurrences(of: "}", with: " ")
        .replacingOccurrences(of: "\"", with: " ")
        .trimmingCharacters(in: .whitespaces)
}

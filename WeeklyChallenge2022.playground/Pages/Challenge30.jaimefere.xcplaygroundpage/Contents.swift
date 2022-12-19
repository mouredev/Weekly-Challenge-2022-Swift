import Foundation

/*
 * Reto #30
 * MARCO DE PALABRAS
 * Fecha publicación enunciado: 26/07/22
 * Fecha publicación resolución: 01/08/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea una función que reciba un texto y muestre cada palabra en una línea, formando
 * un marco rectangular de asteriscos.
 * - ¿Qué te parece el reto? Se vería así:
 *   **********
 *   * ¿Qué   *
 *   * te     *
 *   * parece *
 *   * el     *
 *   * reto?  *
 *   **********
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

func printFramedPhrase(sentence: String) {
    let words = sentence.split(separator: " ")
    let largestWord = words.map{ $0.count }.sorted().last!
    var line = ""
    (1...(largestWord + 4)).forEach { _ in line.append("*") }
    print(line)
    words.forEach { word in
        line = "* \(word)"
        (word.count...largestWord).forEach{ _ in line.append(" ") }
        print("\(line)*")
    }
    line = ""
    (1...(largestWord + 4)).forEach { _ in line.append("*") }
    print(line)
}

printFramedPhrase(sentence: "¿Qué te parece el reto?")

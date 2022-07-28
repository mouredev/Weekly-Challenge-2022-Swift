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

let symbol = "*"
let prefix = "\(symbol) "
let suffix = " \(symbol)"

private func printSymbolsLine(count: Int) {
    print(String(repeating: symbol, count: count + prefix.count + suffix.count))
}

func putInAFrame(text: String) {
    let words = text.split(separator: " ")
    
    guard let longestWordCount = words.max(by: { lhs, rhs in
        lhs.count < rhs.count
    })?.count else { return }
    
    printSymbolsLine(count: longestWordCount)
    
    words.forEach { word in
        let remainingCharsToFill = abs(word.count - longestWordCount)
        let whitespaces = String(repeating: " ", count: remainingCharsToFill)
        
        print(prefix + word + whitespaces + suffix)
    }
    
    printSymbolsLine(count: longestWordCount)
}

let text1 = "¿Qué te parece el reto de la semana?"
let text2 = "Dale limosna, mujer, que no hay en la vida nada como la pena de ser ciego en Granada."

putInAFrame(text: text2)

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

printWordsInIndividualLines(from: "¿Qué te parece el reto?")

func printWordsInIndividualLines(from string: String) {
    let words = string.components(separatedBy: .whitespacesAndNewlines)
    guard let maxWordLength = words.max(by: { $0.count < $1.count })?.count else {
        return
    }
    
    // The horizontal divider contains as many * as the longest word's number of characters
    // it contains, plus an exactly leading space and another trailing one.
    let horizontalDivider = String(repeating: "*", count: maxWordLength + 2)
    print(delimit(horizontalDivider))
    
    for word in words {
        let leadingSpace = " "
        let trailingSpacingCount = maxWordLength - word.count + 1
        let trailingSpace = String(repeating: " ", count: trailingSpacingCount)
        
        print(delimit("\(leadingSpace)\(word)\(trailingSpace)"))
    }
    
    print(delimit(horizontalDivider))
}

func delimit(_ line: String) -> String {
    "*\(line)*"
}

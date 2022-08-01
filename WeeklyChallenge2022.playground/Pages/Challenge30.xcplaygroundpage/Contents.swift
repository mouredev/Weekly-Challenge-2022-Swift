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

public enum Constants {
    static let linePrefix: String = "* "
    static let lineSufix: String = " *"
    static let asterisk: String = "*"
    static let space: String = " "
    static let nextLine: String = "\n"
    static let marginLength: Int = 4
}

public func generateTextFrame(withText inputText: String) {
    let wordsArray = inputText.components(separatedBy: Constants.space)
    let maxLenght: Int = wordsArray.map{ $0.count }.max() ?? 0
    let topBottomFrame = String(repeating: Constants.asterisk, count: (maxLenght) + Constants.marginLength)
    var outputText: String = topBottomFrame + Constants.nextLine
    
    for word in wordsArray {
        let marginFill = String(repeating: Constants.space, count: maxLenght - word.count)
        outputText += Constants.linePrefix + word + marginFill + Constants.lineSufix + Constants.nextLine
    }
    
    outputText += topBottomFrame
    
    print(outputText)
}



generateTextFrame(withText: "¡Un saludo desde Alicante Moure!")

// ************
// * ¡Un      *
// * saludo   *
// * desde    *
// * Alicante *
// * Moure!   *
// ************

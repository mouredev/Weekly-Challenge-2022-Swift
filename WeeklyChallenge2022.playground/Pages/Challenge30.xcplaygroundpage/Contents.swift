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

func drawFrame(text: String) {

    let words = text.components(separatedBy: " ")
    var maxLength = 0
    words.forEach { word in
        if word.count > maxLength {
            maxLength = word.count
        }
    }

    print(String(repeating: "*", count: maxLength + 4))

    words.forEach { word in
        if !word.isEmpty {
            print("* \(word)\(String(repeating: " ", count: maxLength - word.count)) *")
        }
    }

    print(String(repeating: "*", count: maxLength + 4))
}

drawFrame(text: "¿Qué te parece el reto?")
drawFrame(text: "¿Qué te     parece el reto?")
drawFrame(text: "¿Cuántos retos de código de la comunidad has resuelto?")

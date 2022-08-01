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


func asterisksTextBox(text: String) {
    // Dividimos en un array de string cada palabra, haciendo la división por espacios
    let textWordToWord = text.components(separatedBy: " ")
    
    // Calculamos el tamaño da cada palabra, las ordenamos de mayor a menor y nos quedamos con la mayor.
    let longestWord = textWordToWord.map{$0.count}.sorted(by: >)[0] + 4
    
    // Creamos la fila de asteriscos inicial y final.
    var asterisksLine = "*"
    while asterisksLine.count < longestWord {
        asterisksLine += "*"
    }
    
    // Dibujamos la primera fila de asteriscos.
    print(asterisksLine)
    
    // Creamos el resto de filas.
    for word in textWordToWord {
        var wordText = word
        // Rellenamos de espacios hasta que mida cada palabra un caracter más que la más larga, incluida ésta.
        while wordText.count < longestWord - 3 {
            wordText += " "
        }
        // Le añadimos el asterisco final
        wordText += "*"
        print("* \(wordText)")
    }
    
    // Dibujamos la última fila de asteriscos.
    print(asterisksLine)
}



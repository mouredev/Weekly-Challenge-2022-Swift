import Foundation

/*
 * Reto #40
 * TRIÁNGULO DE PASCAL
 * Fecha publicación enunciado: 03/10/22
 * Fecha publicación resolución: 10/10/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea una función que sea capaz de dibujar el "Triángulo de Pascal" indicándole
 * únicamente el tamaño del lado.
 * - Aquí puedes ver rápidamente cómo se calcula el triángulo:
 *   https://commons.wikimedia.org/wiki/File:PascalTriangleAnimated2.gif
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal"
 *   para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en
 *   https://retosdeprogramacion.com/semanales2022.
 *
 */

private func printLine(line: [Int], tab: Int) {
    var result = ""
    (0...(tab * 2 + Int(round(Double(line.count) / 2.0)))).forEach { _ in
        result = "\(result) "
    }
    line.forEach { i in
        result += "\(i<10 ? "  " : " ")\(i)"
    }
    print(result)
}

private func drawPascalTriangle(side: Int) {
    var previousLine = [1]
    var row = 1
    (1..<side).forEach { _ in
        var currentLine = [1]
        printLine(line: previousLine, tab: side - row)
        var column = 1
        (1..<row).forEach { _ in
            currentLine.append(previousLine[column-1] + previousLine[column])
            column += 1
        }
        currentLine.append(1)
        previousLine = currentLine
        row += 1
    }
    printLine(line: previousLine,  tab: 0)
}

drawPascalTriangle(side: 9)

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

func pascalTriangle(size: Int) {

    if size < 0 {
        return
    }
    
    var lastRow: [Int] = []

    for row in 0..<size {

        var currentRow: [Int] = []

        var triangleRow = ""

        for element in 0...row {

            if element > 0 && element < row {
                let value = lastRow[element - 1] + lastRow[element]
                triangleRow += "\(value) "
                currentRow.append(value)
            } else {
                triangleRow += "1 "
                currentRow.append(1)
            }
        }
        print(String(repeating: " ", count: size - row) + triangleRow)

        lastRow = currentRow
    }
    printLine(line: previousLine,  tab: 0)
}

pascalTriangle(size: 5)
pascalTriangle(size: 1)
pascalTriangle(size: 0)
pascalTriangle(size: -5)

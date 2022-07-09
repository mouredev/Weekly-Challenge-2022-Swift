import Foundation

/*
 * Reto #26
 * CUADRADO Y TRIÁNGULO 2D
 * Fecha publicación enunciado: 27/06/22
 * Fecha publicación resolución: 07/07/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea un programa que dibuje un cuadrado o un triángulo con asteriscos "*".
 * - Indicaremos el tamaño del lado y si la figura a dibujar es una u otra.
 * - EXTRA: ¿Eres capaz de dibujar más figuras?
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

enum PolygonType {
    case square, triangle, diamond
}

func drawPolygon(size: Int, type: PolygonType) {

    if size < 2 {
        print("El tamaño debe ser mayor a 1")
    }
    
    var totalSize = size
    if type == .diamond {
        totalSize *= 2
    }

    for value in 1...totalSize {
        switch type {
        case .square:
            print(String(repeating: "* ", count: totalSize))
        case .triangle:
            print(String(repeating: "* ", count: value))
        case .diamond:
            if value <= size {
                print(String(repeating: "* ", count: value))
            } else {
                print("\(String(repeating: "  ", count: value - size))\(String(repeating: "* ", count: totalSize - value))")
            }
            print(rowLine)
        }
        print()
    }

    print("")
}

drawPolygon(size: 10, type: .square)
drawPolygon(size: 15, type: .triangle)
drawPolygon(size: 12, type: .diamond)

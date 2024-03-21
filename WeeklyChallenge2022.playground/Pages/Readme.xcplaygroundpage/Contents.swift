/*
 * Tienes toda la información ensencial en:
 * https://github.com/mouredev/Weekly-Challenge-2022-Swift/blob/main/README.md
 *
 * Cada nuevo reto se añadirá en un fichero del playground
 *
 * Recuerda que puedes ejecutar código Swift de una forma muy simple
 * pulsando el botón de "play ►" en el lateral.
 */

enum Polygon {
    case triangle
    case square
    case rectangle
}

func calculateArea(for polygon: Polygon, height: Double, width: Double) -> Double {
    
    guard height >= .zero, width >= .zero else { return .zero }
    
    switch polygon {
        case .rectangle, .square: // Alternative to square -> `2 * height` and make `width` optional parameter
            return width * height
        case .triangle:
            return (width * height) / 2
    }
}

calculateArea(for: .triangle, height: 2, width: 4) == 4 ? "✅" : "❌"
calculateArea(for: .square, height: 2, width: 2) == 4 ? "✅" : "❌"
calculateArea(for: .rectangle, height: 2, width: 4) == 8 ? "✅" : "❌"
calculateArea(for: .rectangle, height: 0, width: -1) == 0 ? "✅" : "❌"

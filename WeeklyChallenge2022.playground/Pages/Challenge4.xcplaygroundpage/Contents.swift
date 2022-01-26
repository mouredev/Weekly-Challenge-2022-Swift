import Foundation

/*
 * Reto #4
 * ÁREA DE UN POLÍGONO
 * Fecha publicación enunciado: 24/01/22
 * Fecha publicación resolución: 31/01/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea UNA ÚNICA FUNCIÓN (importante que sólo sea una) que sea capaz de calcular y retornar el área de un polígono.
 * - La función recibirá por parámetro sólo UN polígono a la vez.
 * - Los polígonos soportados serán Triángulo, Cuadrado y Rectángulo.
 * - Imprime el cálculo del área de un polígono de cada tipo.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda la acomunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

struct Polygon {
    private var possibleDistinctSideLengths: Int
    private var width: Double
    private var height: Double = 0.0
    private var length: Double = 0.0
    
    init(square sideWidth: Double) {
        possibleDistinctSideLengths = 1
        width = sideWidth
    }
    
    init(rectangle base: Double, height: Double) {
        possibleDistinctSideLengths = 2
        width = base
        self.height = height
    }
    
    init(triangle sideLengthA: Double, sideLengthB: Double, sideLengthC: Double) {
        possibleDistinctSideLengths = 3
        width = sideLengthA
        height = sideLengthB
        length = sideLengthC
    }
    
    func getArea() -> Double {
        switch possibleDistinctSideLengths {
        case 1:
            return width * width
        case 2:
            return width * height
        default:
            let semiperimeter = (width + height + length) / 2.0
            return sqrt(semiperimeter * (semiperimeter - width) * (semiperimeter - height) * (semiperimeter - length))
        }
    }
}

print(Polygon.init(square: 4).getArea())
print(Polygon.init(rectangle: 7, height: 4).getArea())
print(Polygon.init(triangle: 3, sideLengthB: 4, sideLengthC: 5).getArea())

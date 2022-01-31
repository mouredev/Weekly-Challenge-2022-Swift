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

class Polygon {
    var sides: [Double]
    internal init(sides: Double...){
        self.sides = sides
    }
    func getArea() -> Double {
        return Double.zero
    }
}

class Triangle: Polygon {
    init(_ side1: Double, _ side2: Double, _ side3: Double){
        super.init(sides: side1, side2, side3)
    }
    
    override func getArea() -> Double {
        let semiperimetro = (sides[0] + sides[1] + sides[2]) / 2
        return sqrt(semiperimetro * (semiperimetro - sides[0]) * (semiperimetro - sides[1]) * (semiperimetro - sides[2]))
    }
}

class Square: Polygon {
    init(_ side: Double){
        super.init(sides: side)
    }

    override func getArea() -> Double {
        return sides[0] * sides[0]
    }
}

class Rectangle: Polygon {
    init(_ side1: Double, _ side2: Double){
        super.init(sides: side1, side2)
    }

    override func getArea() -> Double {
        return sides[0] * sides[1]
    }
}

enum PolygonType {
    case TriangleType(_ side1: Double, _ side2: Double, _ side3: Double)
    case SquareType(_ side: Double)
    case RectangeType(_ side1: Double, _ side2: Double)
    func getArea() -> Double {
        switch(self) {
        case .TriangleType(let side1, let side2, let side3):
            let semiperimetro = (side1 + side2 + side3) / 2
            return sqrt(semiperimetro * (semiperimetro - side1) * (semiperimetro - side2) * (semiperimetro - side3))
        case .SquareType(let side):
            return side * side
        case .RectangeType(let side1, let side2):
            return side1 * side2
        }
    }
}

print(Triangle(4, 5, 7).getArea())
print(Square(10).getArea())
print(Rectangle(5, 10).getArea())
print(PolygonType.TriangleType(4, 5, 7).getArea())
print(PolygonType.SquareType(10).getArea())
print(PolygonType.RectangeType(5, 10).getArea())

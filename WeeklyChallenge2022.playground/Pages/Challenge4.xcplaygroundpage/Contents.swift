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
    private var side: Double
    private var height: Double
    internal init(side: Double, height: Double){
        self.side = side
        self.height = height
    }
    func getArea() -> Double {
        return self.side * self.height
    }
}

class Triangle: Polygon {
    override init(side: Double, height: Double){
        super.init(side: side, height: height)
    }
    
    override func getArea() -> Double {
        return super.getArea() / 2.0
    }
}

class Square: Polygon {
    init(side: Double){
        super.init(side: side, height: side)
    }
}

class Rectangle: Polygon {
    override init(side: Double, height: Double){
        super.init(side: side, height: height)
    }
}

enum PolygonType {
    case TriangleType(side: Double, height: Double)
    case SquareType(side: Double)
    case RectangeType(side: Double, height: Double)
    func getArea() -> Double {
        switch(self) {
        case .TriangleType(side: let side, height: let height):
            return side * height / 2.0
        case .SquareType(side: let side):
            return side * side
        case .RectangeType(side: let side, height: let height):
            return side * height
        }
    }
}

print(Triangle(side: 10, height: 10).getArea())
print(Square(side: 10).getArea())
print(Rectangle(side: 5, height: 10).getArea())
print(PolygonType.TriangleType(side: 10, height: 10).getArea())
print(PolygonType.SquareType(side: 10).getArea())
print(PolygonType.RectangeType(side: 5, height: 10).getArea())

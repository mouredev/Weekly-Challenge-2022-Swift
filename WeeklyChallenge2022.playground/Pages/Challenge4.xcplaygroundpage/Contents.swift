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
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

area(polygon: Triangle(base: 10.0, height: 5.0))
area(polygon: Rectangle(length: 5.0, width: 7.0))
area(polygon: Square(side: 4.0))

protocol Polygon {

    func area() -> Double
    func printArea()
}

struct Triangle: Polygon {

    let base, height: Double
    
    func area() -> Double {
        return (base * height) / 2
    }

    func printArea() {
        print("El área del triángulo es \(area())")
    }
}

struct Rectangle: Polygon {

    let length, width: Double
    
    func area() -> Double {
        return length * width
    }

    func printArea() {
        print("El área del rectángulo es \(area())")
    }
}

struct Square: Polygon {

    let side: Double
    
    func area() -> Double {
        return side * side
    }

    func printArea() {
        print("El área del cuadrado es \(area())")
    }
}

func area(polygon: Polygon) -> Double {
    polygon.printArea()
    return polygon.area()
}

print(Polygon.init(hasFourVertices: true, sideA: 4).getArea())
print(Polygon.init(hasFourVertices: true, sideA: 7, sideB: 4).getArea())
print(Polygon.init(hasFourVertices: false, sideA: 3, sideB: 4, sideC: 5).getArea())
print(Polygon.init(hasFourVertices: false, sideA: 3, sideB: 4).getArea())   // isosceles
print(Polygon.init(hasFourVertices: false, sideA: 3).getArea())             // equilateral

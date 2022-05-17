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

protocol Polygon {
    func area() -> Double
}

struct Triangle: Polygon {
    var width: Double
    var height: Double
    
    func area() -> Double {
        (height * width) / 2
    }
}

struct Square: Polygon {
    var sideLength: Double
    
    func area() -> Double { pow(sideLength, 2) }
}

struct Rectangle: Polygon {
    var width: Double
    var height: Double
    
    func area() -> Double { width * height }
}

let rectangle = Rectangle(width: 4, height: 2)
print("Rectangle (\(rectangle.width) x \(rectangle.height)) = \(rectangle.area())")

let square = Square(sideLength: 4)
print("Square (\(square.sideLength)) = \(square.area())")

let triangle = Triangle(width: 4, height: 2)
print("Triangle (\(triangle.width) x \(triangle.height)) = \(triangle.area())")

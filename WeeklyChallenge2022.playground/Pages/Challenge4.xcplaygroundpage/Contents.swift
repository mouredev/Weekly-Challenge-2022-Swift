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
    func printArea()
}

struct Triangle: Polygon {
    let base, height: Double
    
    func area() -> Double {
        base * height
    }
    
    func printArea() {
        print("El area del triangulo es \(area())")
    }
}

struct Square: Polygon {
    let side: Double
    
    func area() -> Double {
        side * side
    }
    
    func printArea() {
        print("El area del cuadrado es \(area())")
    }
}

struct Rectangle: Polygon {
    let side, height: Double
    
    func area() -> Double {
        side * height
    }
    
    func printArea() {
        print("El area del rectangulo es \(area())")
    }
}

func calculate(polygon: Polygon) -> Double {
    polygon.printArea()
    return polygon.area()
}

let triangle = Triangle(base: 10, height: 20)
let square = Square(side: 15)
let rectangle = Rectangle(side: 8, height: 5)

calculate(polygon: triangle)
calculate(polygon: square)
calculate(polygon: rectangle)

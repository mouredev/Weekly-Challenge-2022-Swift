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

enum Polygon {
    case triangle, square, rectangle
}

func calculateArea(forPolygon polygon: Polygon, base: Double, height: Double) -> Double {
    switch polygon {
    case .triangle:
        return (base * height) / 2
    case .square, .rectangle:
        return base * height
    }
}

let rectangleArea = calculateArea(forPolygon: .rectangle, base: 4.0, height: 6.0)
print(String(format: "Rectangle area (base: 4, height: 6): %.2f", rectangleArea))

let squareArea = calculateArea(forPolygon: .square, base: 4.0, height: 4.0)
print(String(format: "Square area (base: 4): %.2f", squareArea))

let triangleArea = calculateArea(forPolygon: .triangle, base: 4.0, height: 4.0)
print(String(format: "Triangle area (base: 4, height: 4): %.2f", triangleArea))

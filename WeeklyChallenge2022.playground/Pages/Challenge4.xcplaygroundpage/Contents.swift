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
    case triangle(base: Int, height: Int)
    case square(sideLength: Int)
    case rectangle(base: Int, height: Int)
}

func getAreaForPolygon(_ polygon: Polygon) -> Int {
    switch polygon {
    case .triangle(let base, let height):
        return (base * height) / 2
    case .square(let sideLength):
        return sideLength * sideLength
    case .rectangle(let base, let height):
        return base * height
    }
}

let squareSide = 10
let square: Polygon = .square(sideLength: squareSide)
print("Área de un Cuadrado de lado \(squareSide): \(getAreaForPolygon(square)) unidades cuadradas")

let triangleBase = 5
let triangleHeight = 10
let triangle: Polygon = .triangle(base: triangleBase, height: triangleHeight)
print("Área de un Triángulo de base \(triangleBase) y altura \(triangleHeight): \(getAreaForPolygon(triangle)) unidades cuadradas")

let rectangleBase = 2
let rectangleHeight = 5
let rectangle: Polygon = .rectangle(base: rectangleBase, height: rectangleHeight)
print("Área de un Rectángulo de base \(rectangleBase) y altura \(rectangleHeight): \(getAreaForPolygon(rectangle)) unidades cuadradas")

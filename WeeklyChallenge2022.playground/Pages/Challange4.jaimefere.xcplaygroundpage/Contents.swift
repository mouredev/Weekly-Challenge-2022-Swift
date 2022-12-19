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
    private var hasFourVertices: Bool
    private var sideA: Double
    private var sideB: Double
    private var sideC: Double
    
    init(hasFourVertices:Bool, sideA: Double, sideB: Double = 0.0, sideC: Double = 0.0) {
        self.hasFourVertices = hasFourVertices
        self.sideA = sideA
        self.sideB = (sideB == 0.0) ? sideA : sideB
        self.sideC = (sideC == 0.0) ? self.sideB : sideC
    }
    
    func getArea() -> Double {
        if(hasFourVertices) {
            return sideA * sideB
        } else {
            let semiperimeter = (sideA + sideB + sideC) / 2.0
            return sqrt(semiperimeter * (semiperimeter - sideA) * (semiperimeter - sideB) * (semiperimeter - sideC))
        }
    }
}

print(Polygon.init(hasFourVertices: true, sideA: 4).getArea())
print(Polygon.init(hasFourVertices: true, sideA: 7, sideB: 4).getArea())
print(Polygon.init(hasFourVertices: false, sideA: 3, sideB: 4, sideC: 5).getArea())
print(Polygon.init(hasFourVertices: false, sideA: 3, sideB: 4).getArea())   // isosceles
print(Polygon.init(hasFourVertices: false, sideA: 3).getArea())             // equilateral

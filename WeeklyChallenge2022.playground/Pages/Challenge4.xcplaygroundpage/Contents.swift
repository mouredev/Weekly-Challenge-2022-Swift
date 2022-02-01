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

enum Polygon{
    case SQUARE(side: Double)
    case RECTANGLE(side: Double, side2: Double)
    case TRIANGLE(side: Double, side2: Double)
    func getArea() -> Double{
        switch(self){
            case .SQUARE(let side):
                return side*side
            case .RECTANGLE(let side, let side2):
                return side*side2
            case .TRIANGLE(let side, let side2):
                return (side*side2) / 2
    }

}}  


func main(){
    print(Polygon.SQUARE(side: 6).getArea())
    print(Polygon.RECTANGLE(side: 7.5, side2: 12.20).getArea())
    print(Polygon.TRIANGLE(side: 4.18, side2: 6).getArea())
}

main()
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


func area(of polygonType: String, width: Double, height: Double) -> Double {
    
    var area = 0.0
    
    switch polygonType {
        
    case "Cuadrado":
        if width != height {
            print("Los lados no son iguales, no puede ser un cuadrado")
        } else {
            area = width * height
            print("El area del Cuadrado es: \(area)")
            return area
        }
    case "Rectangulo":
        if width == height {
            print("Los lados son iguales, no puede ser un retangulo")
        } else {
            area = width * height
            print("El area del Retangulo es: \(area)")
            return area
        }
    case "Triangulo":
        area = (width * height) / 2
        print("El area del Triangulo es: \(area)")
        return area
        
    default:
        print("No es un poligono")
    }
    return 0.0
}

area(of: "Cuadrado", width: 23, height: 23)
area(of: "Triangulo", width: 23, height: 23)
area(of: "Rectangulo", width: 33, height: 23)








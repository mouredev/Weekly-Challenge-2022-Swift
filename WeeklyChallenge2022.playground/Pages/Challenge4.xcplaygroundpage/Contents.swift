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

enum poligono{
    case triangulo
    case cuadrado
    case rectangulo
}

struct Poligono {
    let tipo: poligono
    let base: Float
    let altura: Float
    
    init(tipo: poligono, base: Float, altura: Float? = nil) {
        self.tipo = tipo
        self.base = base
        self.altura = altura == nil || tipo == .cuadrado ? base : altura!
    }
}

func area(poligono: Poligono) -> Float{
    var area = poligono.base * poligono.altura
    
    if poligono.tipo == .triangulo {
        area /= 2
    }
    
    return area
}

let triangulo = Poligono(tipo: .triangulo, base: 3, altura: 4)
print(area(poligono: triangulo))

let cuadrado = Poligono(tipo: .cuadrado, base: 3)
print(area(poligono: cuadrado))

let rectangulo = Poligono(tipo: .rectangulo, base: 3, altura: 4)
print(area(poligono: rectangulo))

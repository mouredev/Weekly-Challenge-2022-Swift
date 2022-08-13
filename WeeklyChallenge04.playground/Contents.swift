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

struct Triangulo : Polygon {
    let base, altura: Double
    
    func area() -> Double {
        return base * altura / 2
    }
    
    func printArea() {
        print(String(self.area()))
    }
    
}

struct Rectangulo : Polygon {
    let ancho, alto: Double
    
    func area() -> Double {
        return alto * ancho
    }
    
    func printArea() {
        print(String(self.area()))
    }
    
}

struct Cuadrado : Polygon {
    let lado : Double
    
    func area() -> Double {
        return pow(lado,2)
    }
    
    func printArea() {
        print(String(self.area()))
    }
}

func area(poligono: Polygon) -> Double {
    print(poligono.printArea())
    return poligono.area()
}

area(poligono: Triangulo(base: 2, altura: 5))
area(poligono: Rectangulo(ancho: 45, alto: 7) )
area(poligono: Cuadrado(lado: 4))

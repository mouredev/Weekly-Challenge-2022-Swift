import Foundation
//: [Previous](@previous)

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

func CalcularPoligono(ladoA: Double = 0,ladoB: Double = 0,ladoC: Double = 0,ladoD: Double = 0)->Double{
        //guardar lados en un array.
    var arrayLados = [ladoA,ladoB,ladoC,ladoD]
    
        //quitar los lados que sean = a 0, que indica que no se ha introducido ningun valor.
    arrayLados.removeAll{$0 == 0}
    
        //comprobar que hay mas de un lado.
    if arrayLados.count > 1{
        
        //si hay tres lados introducidos es un triangulo
        if arrayLados.count == 3{
                //Formula de HERON
                //calcular el area: raizCuiadrada de S(S - A)(S - B)(S - C)
                //para calcular el semiperimetro: S = (A * B * C)/2
            let s: Double = (arrayLados[0]+arrayLados[1]+arrayLados[2])/2
            let calculoRadicando: Double = s * (s - arrayLados[0]) * (s - arrayLados[1]) * (s - arrayLados[2])
            return calculoRadicando.squareRoot()
        }
            //si solo se han introducido dos lados puede ser un cuadrado o un rectangulo, se calculan igual.
        else if arrayLados.count == 2{
            return arrayLados.first! * arrayLados.last!
        }
            //si se han introducido los 4 lados tambien puede ser un cuadrado o un rectangulo.
        else if arrayLados.count == 4{
            let lado1 = arrayLados.first
                //comprueba si todos los lados son iguales (cuadrado) o hay alguno diferente (rectangulo)
            let lado2 = arrayLados.first{ $0 != lado1 } ?? lado1
            return lado1! * lado2!
        }
    }
    else{
        return Double(0)
    }
    
    return Double(0)

}

//imprimir con a 2 decimales.
print(String(format:"%.2f",CalcularPoligono(ladoA: 5, ladoB: 15)))
print(String(format:"%.2f",CalcularPoligono(ladoA: 5, ladoB: 5)))
print(String(format:"%.2f",CalcularPoligono(ladoA: 5, ladoB: 15, ladoC: 11)))
print(String(format:"%.2f",CalcularPoligono(ladoA: 5, ladoB: 15, ladoC: 5, ladoD: 15)))
print(String(format:"%.2f",CalcularPoligono(ladoA: 5, ladoB: 5, ladoC: 5, ladoD: 5)))

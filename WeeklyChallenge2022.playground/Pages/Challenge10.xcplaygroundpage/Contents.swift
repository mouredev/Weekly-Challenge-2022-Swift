import Foundation

/*
 * Reto #10
 * EXPRESIONES EQUILIBRADAS
 * Fecha publicación enunciado: 07/03/22
 * Fecha publicación resolución: 14/03/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea un programa que comprueba si los paréntesis, llaves y corchetes de una expresión están equilibrados.
 * - Equilibrado significa que estos delimitadores se abren y cieran en orden y de forma correcta.
 * - Paréntesis, llaves y corchetes son igual de prioritarios. No hay uno más importante que otro.
 * - Expresión balanceada: { [ a * ( c + d ) ] - 5 }
 * - Expresión no balanceada: { a * ( c + d ) ] - 5 }
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */


let expresionT = "{ [ a * ( c + d ) ] - 5 }"
let expresionF = "{ a * ( c + d ) ] - 5 }"
let apertura = ["[", "{" , "("]
let cierre = ["]", "}" , ")"]


final class Pila {
    var pila:[String] = []
    var vacia:Bool { pila.isEmpty}
    var elementos:Int {pila.count}
    
    func push(_ element:String) -> Int {
        pila.append(element)
        return elementos
    }
    
    func pop(_ element:String) -> Int? {
        if !pila.isEmpty {
            pila.removeLast()
            return elementos
        }
        
        return nil
        
    }
    
    
}

func revisa(_ expresion:String) -> Bool{
    let pila = Pila()
    var errorPila = false
    expresion.forEach { caracter in
        
        if apertura.contains(String(caracter)) {
            pila.push(String(caracter))
        }
        
        if cierre.contains(String(caracter)) {
            if (pila.pop(String(caracter)) == nil ) {
                errorPila = true
            }
        }
        
    }
    if !pila.vacia || errorPila {
        return false
    }
    
    return true
    
    
}

revisa(expresionF)
revisa(expresionT)


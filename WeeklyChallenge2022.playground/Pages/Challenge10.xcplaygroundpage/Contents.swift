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

func isBalanced(text: String) -> Bool {
    var parenthesis: [String] = []
    var keys: [String] = []
    var brackets: [String] = []
    
    var balanced = true
    
    Array(text).forEach { char in
        let character = String(char)
        
        switch(character) {
        case "{":
            keys.append(character)
        case "}":
            if (keys.count != 0) {
                keys.removeFirst()
            } else {
                balanced = false
            }
        case "[":
            brackets.append(character)
        case "]":
            if (brackets.count != 0) {
                brackets.removeFirst()
            } else {
                balanced = false
            }
        case "(":
            parenthesis.append(character)
        case ")":
            if (parenthesis.count != 0) {
                parenthesis.removeFirst()
            } else {
                balanced = false
            }
        default:
            print("Caracter no reconocido")
        }
    }
    
    if (balanced && keys.count == 0 && parenthesis.count == 0 && brackets.count == 0) {
        return true
    } else {
        return false
    }
}

isBalanced(text: "{ [ a * ( c + d ) ] - 5 }")

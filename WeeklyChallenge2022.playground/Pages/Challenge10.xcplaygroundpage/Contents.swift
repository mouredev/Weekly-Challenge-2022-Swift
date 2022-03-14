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

func isBalanced(expression: String) -> Bool {
    let openBrackets = ["{","(","["]
    let closeBrackets = ["}",")","]"]
    let onlyBrackets = expression.filter{ openBrackets.contains(String($0)) || closeBrackets.contains(String($0)) }

    if(onlyBrackets.count == 2) {
        return (onlyBrackets == "{}" || onlyBrackets == "()" || onlyBrackets == "[]")
    } else {
        let firstCloseBracketIndex = onlyBrackets.firstIndex(where: { closeBrackets.contains(String($0)) } )
        if(firstCloseBracketIndex == nil || onlyBrackets[...firstCloseBracketIndex!].count < 2) {
            return false
        } else {
            let currentCouple = String(onlyBrackets[onlyBrackets.index(firstCloseBracketIndex!, offsetBy: -1)..<onlyBrackets.index(firstCloseBracketIndex!, offsetBy: 1)])
            let prevExpression = String(onlyBrackets[..<onlyBrackets.index(firstCloseBracketIndex!, offsetBy: -1)])
            let restExpression = String(onlyBrackets[onlyBrackets.index(firstCloseBracketIndex!, offsetBy: 1)..<onlyBrackets.endIndex])
            return isBalanced(expression: currentCouple) && isBalanced(expression: "\(prevExpression)\(restExpression)")
        }
    }
}

let balancedExpressions = ["{ [ a * ( c + d ) ] - 5 }", "[()]{}{[()()]()}", "{[{}{}]}[()]", "{{}{}}", "[]{}()"]
balancedExpressions.forEach { exp in
    print("\(exp) \(!isBalanced(expression: exp) ? "NO " : "")está balanceada")
}
print()
let notBalancedExpressions = ["{ a * ( c + d ) ] - 5 }", "[(])", "{()}[)", "{(})", "{"]
notBalancedExpressions.forEach { exp in
    print("\(exp) \(!isBalanced(expression: exp) ? "NO " : "")está balanceada")
}

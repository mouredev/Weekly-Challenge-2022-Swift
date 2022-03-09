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

public class Open {
    public static let parenthesis: Character = "("
    public static let bracket: Character = "["
    public static let key: Character = "{"
    static func containsa(character: Character) -> Bool {
        return Open.parenthesis == character
        || Open.bracket == character
        || Open.key == character
    }
}

public class Close {
    public static let parenthesis: Character = ")"
    public static let bracket: Character = "]"
    public static let key: Character = "}"
    static func containsa(character: Character) -> Bool {
        return Close.parenthesis == character
        || Close.bracket == character
        || Close.key == character
    }
}

extension Character {
    func equalsOpen(character: Character) -> Bool {
        if Close.parenthesis == character {
            return Open.parenthesis == self
        } else if Close.bracket == character {
            return Open.bracket == self
        } else if Close.key == character {
            return Open.key == self
        }
        return false
    }
}

func isBalanced(value: String) -> Bool {
    var marks: [Character] = [Character]()
    var notFound = false
    value.forEach {
        if Close.containsa(character: $0) {
            guard let last = marks.last else {
                notFound = true
                return
            }
            if last.equalsOpen(character: $0) {
                marks.removeLast()
            } else {
                notFound = true
            }
        } else if (Open.containsa(character: $0)){
            marks.append($0)
        }
    }
    return !notFound && marks.count == 0
}

print(isBalanced(value: "{ [ a * ( c + d ) ] - 5 }"))
print(isBalanced(value: "{ a * ( c + d ) ] - 5 }"))
print(isBalanced(value: "]{ a * ( c + d ) ] - 5 }"))
print(isBalanced(value: "{ a * ( c + d - 5"))
print(isBalanced(value: "{(([{[[]]}]))}"))

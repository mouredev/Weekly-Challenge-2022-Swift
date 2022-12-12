import Foundation

/*
 * Reto #10
 * EXPRESIONES EQUILIBRADAS
 * Fecha publicación enunciado: 07/03/22
 * Fecha publicación resolución: 14/03/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea un programa en Swift que comprueba si los paréntesis, llaves y corchetes de una expresión están equilibrados.
 * - Equilibrado significa que estos delimitadores se abren y cieran en orden y de forma correcta.
 * - Paréntesis, llaves y corchetes son igual de prioritarios. No hay uno más importante que otro.
 * - Expresión balanceada: { [ a * ( c + d ) ] - 5 }
 * - Expresión no balanceada: { a * ( c + d ) ] - 5 }
 *
 * Resuelto: Sí. A la primera.
 * Explicación:
 * ·Para resolver este problema, podemos utilizar una pila, un tipo de dato que nos permite agregar elementos en un orden determinado y recuperarlos en orden inverso.
 * ·Para comprobar si los delimitadores de una expresión están equilibrados, podemos iterar sobre cada carácter de la expresión y hacer lo siguiente:
 * ·Si el carácter es un delimitador de apertura, lo agregamos a la pila.
 * ·Si el carácter es un delimitador de cierre, verificamos si el último elemento de la pila es el delimitador de apertura correspondiente. Si lo es, eliminamos el elemento de la pila. Si no lo es, la expresión no está equilibrada.
 * ·Al finalizar la iteración, si la pila está vacía, significa que todos los delimitadores de apertura y cierre se encuentran en pares y en orden correcto, por lo que la expresión está equilibrada. Si la pila no está vacía, significa que hay delimitadores de apertura que no tienen su correspondiente delimitador de cierre, por lo que la expresión no está equilibrada.
 *
 */

// Crea un diccionario de caracteres para los delimitadores abiertos y cerrados
let delimiters = ["{": "}", "[": "]", "(": ")"]

// Función para verificar si la expresión es equilibrada
func isBalanced(_ expression: String) -> Bool {
    // Crea una pila para guardar los delimitadores abiertos
    var stack = [String]()

    // Itera sobre cada caracter en la expresión
    for character in expression {
        // Si el caracter es un delimitador abierto, agrégalo a la pila
        if delimiters.keys.contains(String(character)) {
            stack.append(String(character))
        }
        // Si el caracter es un delimitador cerrado, comprueba si se corresponde con el último delimitador abierto en la pila
        else if delimiters.values.contains(String(character)) {
            // Si la pila está vacía o el último delimitador abierto no se corresponde con el delimitador cerrado, la expresión no es equilibrada
            if stack.isEmpty || delimiters[stack.last!] != String(character) {
                return false
            }
            // Si el delimitador cerrado se corresponde con el último delimitador abierto en la pila, elimina el delimitador abierto de la pila
            stack.removeLast()
        }
    }

    // Si la pila está vacía al final de la iteración, significa que todos los delimitadores abiertos fueron cerrados en orden y de forma correcta, por lo que la expresión es equilibrada
    return stack.isEmpty
}

// Ejemplos de expresiones equilibradas
print(isBalanced("{ [ a * ( c + d ) ] - 5 }"))
print(isBalanced("[ 1 + 2 ] + { 3 - 4 }"))

// Brais cases
print(isBalanced("{a + b [c] * (2x2)}}}}"))               // false
print(isBalanced("{ [ a * ( c + d ) ] - 5 }"))            // true
print(isBalanced("{ a * ( c + d ) ] - 5 }"))              // false
print(isBalanced("{a^4 + (((ax4)}"))                      // false
print(isBalanced("{ ] a * ( c + d ) + ( 2 - 3 )[ - 5 }")) // false
print(isBalanced("{{{{{{(}}}}}}"))                        // false
print(isBalanced("(a"))                                   // false

// Jaime cases
print(isBalanced("{ [ a * ( c + d ) ] - 5 }"))    // true
print(isBalanced("[()]{}{[()()]()}"))             // true
print(isBalanced("{[{}{}]}[()]"))                 // true
print(isBalanced("{{}{}}"))                       // true
print(isBalanced("[]{}()"))                       // true
print(isBalanced("a+2"))                          // true
print(isBalanced("{ a * ( c + d ) ] - 5 }"))      // false
print(isBalanced("{()}[)"))                       // false
print(isBalanced("[(])"))                         // false
print(isBalanced("{(})"))                         // false
print(isBalanced("{"))                            // false


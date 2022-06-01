import Foundation

/*
 * Reto #21
 * CALCULADORA .TXT
 * Fecha publicación enunciado: 23/05/22
 * Fecha publicación resolución: 01/06/22
 * Dificultad: MEDIA
 *
 * Enunciado: Lee el fichero "Challenge21.txt" incluido en el proyecto, calcula su resultado e imprímelo.
 * - El .txt se corresponde con las entradas de una calculadora.
 * - Cada línea tendrá un número o una operación representada por un símbolo (alternando ambos).
 * - Soporta números enteros y decimales.
 * - Soporta las operaciones suma "+", resta "-", multiplicación "*" y división "/".
 * - El resultado se muestra al finalizar la lectura de la última línea (si el .txt es correcto).
 * - Si el formato del .txt no es correcto, se indicará que no se han podido resolver las operaciones.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

enum Operation {
    case add, div, mul, sub, error
}

func isNumber(symbol: String?) -> Bool {
    return symbol != nil && symbol!.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil
}

func getOperation(symbol: String) -> Operation {
    switch(symbol) {
    case "+": return Operation.add
    case "-": return Operation.sub
    case "*": return Operation.mul
    case "/": return Operation.div
    default: return Operation.error
    }
}

func processOperations(fileName: String) -> String {
    let BAD_RESPONSE = "Las operaciones no han podido ser resueltas."
    do {
        if let operationsFilePath = Bundle.main.path(forResource:fileName, ofType: "txt") {
            let operationSymbols = try String(contentsOfFile: operationsFilePath, encoding: String.Encoding.utf8).components(separatedBy: "\n").dropLast()
            if(isNumber(symbol: operationSymbols.first)) {
                var result = Double(operationSymbols.first!)!
                for index in stride(from: 1, to: operationSymbols.count, by: 2) {
                    if((getOperation(symbol: operationSymbols[index]) != Operation.error) && (index + 1 < operationSymbols.count) && isNumber(symbol: operationSymbols[index+1])) {
                        switch(getOperation(symbol: operationSymbols[index])) {
                        case .add:
                            result = result + Double(operationSymbols[index+1])!
                        case .div:
                            result = result / Double(operationSymbols[index+1])!
                        case .mul:
                            result = result * Double(operationSymbols[index+1])!
                        default:
                            result = result - Double(operationSymbols[index+1])!
                        }
                    } else {
                        return BAD_RESPONSE
                    }
                }
                return "\(result)"
            } else {
                return BAD_RESPONSE
            }
        }
        return BAD_RESPONSE
    } catch {
        return BAD_RESPONSE
    }
}

print(processOperations(fileName: "Challenge21"))
print(processOperations(fileName: "OneValue"))
print(processOperations(fileName: "TooNumbers"))
print(processOperations(fileName: "TooOperators"))
print(processOperations(fileName: "WithDecimals"))

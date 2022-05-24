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

do {
    let result = try calculate(fromFile: "Challenge21")
    print(result)
} catch {
    if let error = error as? FileError {
        print("ERROR: \(error.description)")
    } else {
        print(error.localizedDescription)
    }
}

enum OperationType: String {
    case sum = "+", subtraction = "-" , multiplication = "*" , division = "/"
}

enum FileError: Error {
    case notFound, cannotRead, incorrectFormat
    
    var description: String {
        switch self {
        case .notFound: return "The file wasn't found."
        case .cannotRead: return "The file couldn't be read."
        case .incorrectFormat: return "The file content has an incorrect format."
        }
    }
}

func calculate(fromFile fileName: String) throws -> Double {
    var lines = [String]()
    lines = try readLines(fromFile: fileName)
    
    var currentResult = 0.0
    var currentOperationType: OperationType?
    
    for (index, line) in lines.enumerated() {
        // Even lines should contain a number.
        if index.isMultiple(of: 2) {
            guard let number = Double(line) else {
                throw FileError.incorrectFormat
            }
            
            currentResult = (currentOperationType == nil)
                                ? number
                                : operate(withType: currentOperationType!, numA: currentResult, numB: number)
        } else {
            // Odd lines should contain the operation type.
            guard let operationType = OperationType(rawValue: line) else {
                throw FileError.incorrectFormat
            }
            
            currentOperationType = operationType
        }
    }
    
    return currentResult
}

func readLines(fromFile fileName: String) throws -> [String]  {
    guard let bundleURL = Bundle.main.url(forResource: fileName, withExtension: ".txt") else {
        throw FileError.notFound
    }
    
    guard let fileContent = try? String(contentsOf: bundleURL).trimmingCharacters(in: .whitespacesAndNewlines) else {
        throw FileError.cannotRead
    }
    
    let lines = fileContent.components(separatedBy: "\n")
    return lines
}

func operate(withType operationType: OperationType, numA: Double, numB: Double) -> Double {
    switch operationType {
    case .sum: return numA + numB
    case .subtraction: return numA - numB
    case .multiplication: return numA * numB
    case .division: return numA / numB
    }
}

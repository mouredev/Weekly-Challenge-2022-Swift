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

func calculate(filePath: String, fileType: String) -> String {

    var fileError = false
    var result: Double?
    var lastOperator: String?

    if let path = Bundle.main.path(forResource: filePath, ofType: fileType) {
        do {
            let content = try String(contentsOfFile: path, encoding: .utf8).components(separatedBy: "\n")
            
            for line in content {
                if let number = Double(line) {
                    
                    if result == nil {
                        result = number
                    } else {
                        switch lastOperator {
                        case "+":
                            result! += number
                        case "-":
                            result! -= number
                        case "*":
                            result! *= number
                        case "/":
                            result! /= number
                        default:
                            fileError = true
                            break
                        }
                        lastOperator = nil
                    }
                    
                } else if lastOperator == nil {
                    lastOperator = line
                } else {
                    fileError = true
                    break
                }
            }
        } catch {
            fileError = true
        }
    }
    
    return fileError || lastOperator != nil ? "No se han podido resolver las operaciones" : result!.description
}

print(calculate(filePath: "Challenge21", fileType: "txt"))

import Foundation

/*
 * Reto #30
 * MARCO DE PALABRAS
 * Fecha publicación enunciado: 26/07/22
 * Fecha publicación resolución: 01/08/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea una función que reciba un texto y muestre cada palabra en una línea, formando
 * un marco rectangular de asteriscos.
 * - ¿Qué te parece el reto? Se vería así:
 *   **********
 *   * ¿Qué   *
 *   * te     *
 *   * parece *
 *   * el     *
 *   * reto?  *
 *   **********
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

var arrayInput = [String]()
var maxArray: Int
var asteriskString: String = ""
var spaceString: String

if let strInput = readLine() {
    arrayInput = strInput.components(separatedBy: " ")
    
    if let maxArray = arrayInput.max(by: {$1.count > $0.count })?.count {
        
        for _ in 1...maxArray+4 {
            asteriskString += "*"
        }
        
        print(asteriskString)
        
        for item in arrayInput {
            let difValue = maxArray - item.count
            spaceString = ""
            
            for _ in 0...difValue {
                spaceString += " "
            }
            print("* \(item)\(spaceString)*")   
        }
        
        print(asteriskString)
    }
}



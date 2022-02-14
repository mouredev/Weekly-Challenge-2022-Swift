import Foundation

/*
 * Reto #6
 * INVIRTIENDO CADENAS
 * Fecha publicación enunciado: 07/02/22
 * Fecha publicación resolución: 14/02/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea un programa que invierta el orden de una cadena de texto sin usar funciones propias del lenguaje que lo hagan de forma automática.
 * - Si le pasamos "Hola mundo" nos retornaría "odnum aloH"
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda la acomunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

import Foundation

extension String {
    func customReversed() -> String {
        var result: String = ""
        let text = self
        var intIndex = text.count - 1
        while intIndex >= 0 {
            let index = text.index(text.startIndex, offsetBy: intIndex)
            result += "\(text[index])"
            intIndex -= 1
        }
        return result
    }
}

func main(){
    var inputString: String = "Hello World"
    var outputString: String = inputString.customReversed()
    print("Entrada: \(inputString) \nSalida: \(outputString)")
}

main()
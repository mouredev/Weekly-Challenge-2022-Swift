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


/**
  Space Complexity: o(n)
  Time Complexity: o(n)
 */

extension String {
    var reversedString: String {
        var array = Array(self)
        
        for i in 0..<array.count/2 {
            let temp = array[i]
            array[i] = array[array.count-1-i]
            array[array.count-1-i] = temp
        }
        
        return String(array)
    }
}


"Hola mundo".reversedString == "odnum aloH" ? "✅" : "❌"
"Desarrollo".reversedString == "ollorraseD" ? "✅" : "❌"
"Twitch Channel".reversedString == "lennahC hctiwT" ? "✅" : "❌"
"123456789".reversedString == "987654321" ? "✅" : "❌"
"".reversedString == "" ? "✅" : "❌"

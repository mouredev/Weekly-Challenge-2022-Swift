import Foundation

/*
 * Reto #41
 * LA LEY DE OHM
 * Fecha publicación enunciado: 10/10/22
 * Fecha publicación resolución: 17/10/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea una función que calcule el valor del parámetro perdido correspondiente a la ley de Ohm.
 * - Enviaremos a la función 2 de los 3 parámetros (V, R, I), y retornará el valor del tercero (redondeado a 2 decimales).
 * - Si los parámetros son incorrectos o insuficientes, la función retornará la cadena de texto "Invalid values".
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal"
 *   para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en
 *   https://retosdeprogramacion.com/semanales2022.
 *
 */

class Solution {
    
    func ohm(V: Double? = nil, R: Double? = nil, I: Double? = nil) -> String {
        
        guard V != nil && R != nil || V != nil && I != nil || R != nil && I != nil else {
            return "Invalid values"
        }
        
        if V == nil, let R = R, let I = I {
           return "V = " + String(format: "%.2f", R * I)
        }
        if R == nil, let V = V, let I = I, I != 0 {
           return "R = " + String(format: "%.2f", V / I)
        }
        if I == nil, let V = V, let R = R, R != 0 {
           return "I = " + String(format: "%.2f", V / R)
        }
           
        return "Invalid values"
    }
    
}

let solution = Solution()

let res = solution.ohm(R: 20, I: 10)
let res1 = solution.ohm(R: 20, I: 0)
let res2 = solution.ohm(R: 0.20, I: -7.10)

let res3 = solution.ohm(V: 20, I: 10)
let res4 = solution.ohm(V: 20, I: 0)
let res5 = solution.ohm(V: 0.20, I: -7.10)

let res6 = solution.ohm(V: 20, R: 10)
let res7 = solution.ohm(V: 20, R: 0)
let res8 = solution.ohm(V: 0.20, R: -7.10)

let res9 = solution.ohm(V: 20, R: 10, I: 20)
let res10 = solution.ohm(V: 20)
let res11 = solution.ohm(R: 10)
let res12 = solution.ohm(I: 20)
let res13 = solution.ohm()

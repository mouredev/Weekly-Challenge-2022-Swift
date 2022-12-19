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

private func calculateOhmLayer(V: Double? = nil, R: Double? = nil, I: Double? = nil) -> String {
    if(V == nil) {
        return (R == nil || I == nil) ? "Invalid values" : String(format: " %.2f", R! * I!)
    } else if(R == nil) {
        return (V == nil || I == nil) ? "Invalid values" : String(format: " %.2f", V! / I!)
    } else if(I == nil) {
        return (V == nil || R == nil) ? "Invalid values" : String(format: " %.2f", V! / R!)
    } else {
        return (V! != R! * I!) ? "Invalid values" : "Right values"
    }
}

print(calculateOhmLayer(V: 5, R: 10, I: 0.5))
print(calculateOhmLayer(V: nil, R: 10, I: 0.5))
print(calculateOhmLayer(V: 5, R: nil, I: 0.5))
print(calculateOhmLayer(V: 5, R: 10, I: nil))
print(calculateOhmLayer(V: nil, R: nil, I: 0.5))

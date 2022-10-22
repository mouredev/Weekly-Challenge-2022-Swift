import Foundation

/*
 * Reto #42
 * CONVERSOR DE TEMPERATURA
 * Fecha publicación enunciado: 17/10/22
 * Fecha publicación resolución: 24/10/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea una función que transforme grados Celsius en Fahrenheit y viceversa.
 * - Para que un dato de entrada sea correcto debe poseer un símbolo "°" y su unidad ("C" o "F").
 * - En caso contrario retornará un error.
 * - ¿Quieres emplear lo aprendido en este reto?
 *   Revisa el reto mensual y crea una App: https://retosdeprogramacion.com/mensuales2022
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal"
 *   para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en
 *   https://retosdeprogramacion.com/semanales2022.
 *
 */

func degreeConverter(_ input: String) -> String {
    
    if input.hasSuffix("°C"), let celsius = Double(input.dropLast(2)) {
        
        let fahrenheit = celsius * 1.8 + 32.0
        return "\(String(format: "%.1f", fahrenheit))°F"
        
    } else if input.hasSuffix("°F"), let fahrenheit = Double(input.dropLast(2)){
        
        let celsius = (fahrenheit - 32) / 1.8
        return "\(String(format: "%.0f", celsius))°C"
    }
    
    return "Error: Value cannot be converted"
}


print(degreeConverter("27°C"));     // 80.6°F
print(degreeConverter("80.6°F"));   // 27°C

print(degreeConverter(""));         // Error
print(degreeConverter("27"));       // Error
print(degreeConverter("27°"));      // Error
print(degreeConverter("27 C"));     // Error

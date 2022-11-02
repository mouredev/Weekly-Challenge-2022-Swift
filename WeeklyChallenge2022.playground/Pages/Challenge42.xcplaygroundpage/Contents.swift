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

func temperatureConverter(degrees: String) -> String? {

    if degrees.replacingOccurrences(of: " ", with: "").contains("°C"),
       let celsiusDegrees = Double(degrees.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "°C", with: "")) {
       
        return "\(String(format: "%.2f", (celsiusDegrees * 9/5) + 32))°F"
        
    } else if degrees.replacingOccurrences(of: " ", with: "").contains("°F"),
      let fahrenheitDegrees = Double(degrees.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "°F", with: "")) {
      
       return "\(String(format: "%.2f", (fahrenheitDegrees - 32) * 5/9))°C"
   }
    
    return nil
}

print(temperatureConverter(degrees: "100°C" ) ?? "Error")
print(temperatureConverter(degrees: "100°F") ?? "Error")
print(temperatureConverter(degrees: "100C") ?? "Error")
print(temperatureConverter(degrees: "100F") ?? "Error")
print(temperatureConverter(degrees: "100") ?? "Error")
print(temperatureConverter(degrees: "100") ?? "Error")
print(temperatureConverter(degrees: "- 100 °C ") ?? "Error")
print(temperatureConverter(degrees: "- 100 °F ") ?? "Error")
print(temperatureConverter(degrees: "100A°C") ?? "Error")
print(temperatureConverter(degrees: "100A°F") ?? "Error")
print(temperatureConverter(degrees: "°C") ?? "Error")
print(temperatureConverter(degrees: "°F") ?? "Error")

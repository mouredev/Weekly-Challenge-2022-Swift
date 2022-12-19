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

enum TemperatureUnit: String, CaseIterable {
    case celsius = "C"
    case fahrenheit = "F"
    
    static func isValid(unit: String) -> Bool {
        return TemperatureUnit.allCases.filter{ $0.rawValue == unit }.count > 0
    }
}

func isNumber(symbol: String?) -> Bool {
    return symbol != nil && symbol!.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil
}

func toggleTemperatureUnits(temperature: String) -> String {
    let temperatureParts = temperature.replacingOccurrences(of: " ", with: "").uppercased().split(separator: "º")
    if(temperatureParts.count == 2 && isNumber(symbol: String(temperatureParts[0])) && TemperatureUnit.isValid(unit: String(temperatureParts[1]))) {
        let value = Double(temperatureParts[0])!
        let units = temperatureParts[1]
        if(units == TemperatureUnit.celsius.rawValue) {
            return "\(String(format: "%.2f", value * 9.0 / 5.0 + 32.0)) º\(TemperatureUnit.fahrenheit.rawValue)"
        } else {
            return "\(String(format: "%.2f", (value - 32.0) * 5.0 / 9.0)) º\(TemperatureUnit.celsius.rawValue)"
        }
    } else {
        return "Incorrect input"
    }
}

print(toggleTemperatureUnits(temperature: "60 F"))
print(toggleTemperatureUnits(temperature: "ab ºC"))
print(toggleTemperatureUnits(temperature: "12 ºCF"))
print(toggleTemperatureUnits(temperature: "273.15ºC"))
print(toggleTemperatureUnits(temperature: "-40.0ºC"))
print(toggleTemperatureUnits(temperature: "0 ºC"))
print(toggleTemperatureUnits(temperature: "98.6ºF"))
print(toggleTemperatureUnits(temperature: "212ºF"))

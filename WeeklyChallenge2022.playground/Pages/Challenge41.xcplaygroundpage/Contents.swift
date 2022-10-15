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

protocol NumericProtocol {
  var value: Double { get }
}

extension Double: NumericProtocol {
  var value: Double { return self }
}

extension Int: NumericProtocol {
  var value: Double { return Double(self) }
}

func ohm<T: NumericProtocol>(volts: T? = nil, resistance: T? = nil, intensity: T? = nil) {
    if volts == nil {
        guard let resistance = resistance, let intensity = intensity else {
            print("Invalid values")
            return
        }
        print("Volts: \(String(format: "%.2f", resistance.value * intensity.value)) V")

    } else if resistance == nil {
        guard let volts = volts, let intensity = intensity else {
            print("Invalid values")
            return
        }
        print("Resistance: \(String(format: "%.2f", volts.value / intensity.value)) Ω")

    } else if intensity == nil {
        guard let resistance = resistance, let volts = volts else {
            print("Invalid values")
            return
        }
        print("Intensity: \(String(format: "%.2f", volts.value / resistance.value)) A")

    } else {
        print("Invalid values")
    }
}

// Valid cases
ohm(volts: 1.1234, intensity: 10.1234)
ohm(volts: 1.1234, resistance: 5.1234)
ohm(resistance: 5.1234, intensity: 10.1234)
ohm(volts: 1, intensity: 10)
ohm(volts: 1, resistance: 5)
ohm(resistance: 5, intensity: 10)

// Invalid cases
ohm(volts: 1.1234)
ohm(resistance: 5.1234)
ohm(intensity: 30.1234)
ohm(volts: 1.1234, resistance: 5.1234, intensity: 10.1234)

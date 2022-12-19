import Foundation

/*
 * Reto #50
 * LA ENCRIPTACIÓN DE KARACA
 * Fecha publicación enunciado: 12/12/22
 * Fecha publicación resolución: 19/12/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea una función que sea capaz de encriptar y desencriptar texto utilizando el
 * algoritmo de encriptación de Karaca (debes buscar información sobre él).
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal"
 *   para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en
 *   https://retosdeprogramacion.com/semanales2022.
 *
 */

func karaca(text: String, isKaraca: Bool) -> String {

    var result = ""
    
    text.lowercased().split(separator: " ").forEach { word in

        if isKaraca {
            result += word
                .dropLast(3).description
                .replacingOccurrences(of: "0", with: "a")
                .replacingOccurrences(of: "1", with: "e")
                .replacingOccurrences(of: "2", with: "i")
                .replacingOccurrences(of: "3", with: "o")
                .replacingOccurrences(of: "4", with: "u")
                .reversed() + " "
        } else {
            result += String(word.reversed())
                .replacingOccurrences(of: "a", with: "0")
                .replacingOccurrences(of: "e", with: "1")
                .replacingOccurrences(of: "i", with: "2")
                .replacingOccurrences(of: "o", with: "3")
                .replacingOccurrences(of: "u", with: "4") + "aca "
        }
    }

    return result
}

print(karaca(text: "placa", isKaraca: false))
print(karaca(text: "0c0lpaca", isKaraca: true))

print(karaca(text: "Este es el penúltimo reto de programación del año", isKaraca: false))
print(karaca(text: "1ts1aca s1aca l1aca 3m2tlún1paca 3t1raca 1daca nó2c0m0rg3rpaca l1daca 3ñ0aca", isKaraca: true))

// El algoritmo no soporta estos casos
print(karaca(text: "1", isKaraca: false))
print(karaca(text: "1aca ", isKaraca: true))

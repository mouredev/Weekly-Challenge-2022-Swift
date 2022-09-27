import Foundation

/*
 * Reto #38
 * BINARIO A DECIMAL
 * Fecha publicación enunciado: 19/09/22
 * Fecha publicación resolución: 27/09/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea un programa se encargue de transformar un número binario a decimal sin utilizar
 * funciones propias del lenguaje que lo hagan directamente.
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal"
 *   para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en
 *   https://retosdeprogramacion.com/semanales2022.
 *
 */

func binaryToDecimal(binary: String) -> Int? {

    let length = binary.count - 1
    
    if length < 0 {
        return nil
    }

    var decimal: Int? = nil

    for index in 0...length {
        let digitString = Array(binary)[length - index].description
        if digitString == "0" || digitString == "1" {
            if decimal == nil {
                decimal = 0
            }
            decimal! += (Int(digitString) ?? 0) * Int(truncating: pow(2.0, index) as NSDecimalNumber)
        } else {
            return nil
        }
    }

    return decimal
}

print(binaryToDecimal(binary: "00110") ?? "Es nulo")
print(binaryToDecimal(binary: "01100") ?? "Es nulo")
print(binaryToDecimal(binary: "000000000") ?? "Es nulo")
print(binaryToDecimal(binary: "00210") ?? "Es nulo")
print(binaryToDecimal(binary: "001101001110") ?? "Es nulo")
print(binaryToDecimal(binary: "00b10") ?? "Es nulo")
print(binaryToDecimal(binary: "") ?? "Es nulo")
print(binaryToDecimal(binary: "-00110") ?? "Es nulo")
print(binaryToDecimal(binary: " ") ?? "Es nulo")
print(binaryToDecimal(binary: " 10011") ?? "Es nulo")
print(binaryToDecimal(binary: "1O1OO11") ?? "Es nulo")

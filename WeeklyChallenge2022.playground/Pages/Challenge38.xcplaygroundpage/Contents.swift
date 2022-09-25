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

func passToDecimal(binaryNumber: String) -> Int {
    var result = 0.0
    var index = 0.0
    binaryNumber.reversed().forEach { c in
        pow(2, index)
        result += Double(c.description)! * pow(2.0, index)
        index += 1.0
    }
    return Int(result)
}

let binaryNumbers = ["012", "01", "10", "10000000"]
binaryNumbers.forEach { binaryNumber in
    if(binaryNumber.filter { $0 != "0" && $0 != "1" }.isEmpty ) {
        print(passToDecimal(binaryNumber: binaryNumber))
    } else {
        print("No es un número binario correcto")
    }
}

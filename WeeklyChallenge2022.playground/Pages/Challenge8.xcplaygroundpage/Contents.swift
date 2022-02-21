import Foundation

/*
 * Reto #8
 * DECIMAL A BINARIO
 * Fecha publicación enunciado: 18/02/22
 * Fecha publicación resolución: 02/03/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea un programa se encargue de transformar un número decimal a binario sin utilizar funciones propias del lenguaje que lo hagan directamente.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda la acomunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

func toBinary(from number: Int) -> String {
    var number = number
    var result: String = ""
    while number > 0 {
        result = "\(number % 2)\(result)"
        number /= 2
    }
    return result
}

print("10 en binario es \(toBinary(from: 10))")
print("11 en binario es \(toBinary(from: 11))")
print("1 en binario es \(toBinary(from: 1))")
print("2 en binario es \(toBinary(from: 2))")
print("3 en binario es \(toBinary(from: 3))")
print("512 en binario es \(toBinary(from: 512))")
print("32 en binario es \(toBinary(from: 32))")
print("15 en binario es \(toBinary(from: 15))")

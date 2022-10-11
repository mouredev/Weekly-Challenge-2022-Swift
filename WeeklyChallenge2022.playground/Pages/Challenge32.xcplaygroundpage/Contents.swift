import Foundation

/*
 * Reto #32
 * EL SEGUNDO
 * Fecha publicación enunciado: 08/08/22
 * Fecha publicación resolución: 15/08/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Dado un listado de números, encuentra el SEGUNDO más grande.
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en https://retosdeprogramacion.com/semanales2022.
 *
 */

func findSecondGreater(numbers: [Int]) -> Int? {
    if numbers.isEmpty { return nil }
    var numbers = numbers.sorted(by: >)
    for num in numbers{
        if (num < numbers[numbers.startIndex]) { return num }
    }
    return nil
}

print(findSecondGreater(numbers: [4, 6, 1, 8, 2]) ?? "No se ha encontrado un valor")
print(findSecondGreater(numbers: [4, 6, 8, 8, 6]) ?? "No se ha encontrado un valor")
print(findSecondGreater(numbers: [4, 4]) ?? "No se ha encontrado un valor")
print(findSecondGreater(numbers: []) ?? "No se ha encontrado un valor")

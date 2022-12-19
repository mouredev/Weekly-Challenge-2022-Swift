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

func getTheBigestTwo(numbers: [Int]) -> Int? {
    if(numbers.count < 2) {
        print("¡El listado debe contener al menos 2 números!")
        return nil
    } else {
        var biggest = numbers[0]
        var result = numbers[0]
        numbers.forEach {
            if($0 > biggest) {
                result = biggest
                biggest = $0
            }
        }
        return result
    }
}

print(getTheBigestTwo(numbers: []) ?? "")
print(getTheBigestTwo(numbers: [4]) ?? "")
print(getTheBigestTwo(numbers: [4, 4]) ?? "")
print(getTheBigestTwo(numbers: [4, 6, 1, 8, 2]) ?? "")



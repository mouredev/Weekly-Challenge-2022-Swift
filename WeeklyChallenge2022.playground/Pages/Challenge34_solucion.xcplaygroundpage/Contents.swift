import Foundation

/*
 * Reto #34
 * LOS NÚMEROS PERDIDOS
 * Fecha publicación enunciado: 22/08/22
 * Fecha publicación resolución: 29/08/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Dado un array de enteros ordenado y sin repetidos, crea una función que calcule y retorne todos los que faltan entre el mayor y el menor.
 * - Lanza un error si el array de entrada no es correcto.
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en https://retosdeprogramacion.com/semanales2022.
 *
 */

let array_1: [Int] = [1,2,3,4,7,9,10,16,20]
let array_2: [Int] = [1,3,3,4,7,9,10,16,20]
let array_3: [Int] = [1,3,2,4,7,9,10,16,20]
let array_4: [Int] = [1,8,15,22,30]
let array_5: [Int] = [1,2,3,4,5,6,7,8,9,10]

func faltantes(_ array: [Int]) -> [Int] {
    var missing: [Int] = []
    let count: Int = array.count
    guard count > 2 else {
        print("Debe haber al menos 2 elementos en el array")
        return []
    }
    for i in 0 ..< count - 1 {
        let current: Int = array[i]
        let next: Int = array[i+1]
        let diff: Int = next - current
        if diff < 1 {
            print("El array de entrada no es correcto")
            return []
        } else if diff > 1 {
            for j in current + 1 ..< next {
                missing.append(j)
            }
        }
    }
    return missing
}

print(faltantes(array_1))
print("****************************************************************************************************")
print(faltantes(array_2))
print("****************************************************************************************************")
print(faltantes(array_3))
print("****************************************************************************************************")
print(faltantes(array_4))
print("****************************************************************************************************")
print(faltantes(array_5))

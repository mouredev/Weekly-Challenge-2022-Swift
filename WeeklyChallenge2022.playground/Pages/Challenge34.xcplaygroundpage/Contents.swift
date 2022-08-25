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

//¿Estan ordenados?
func ordenado(myArray:Array<Int>)->Bool{
    if myArray.sorted() != myArray{
        print("Error, los numeros deben de estar ordenados")
        return false
    }
    return true
}

//¿Hay elementos repetidos?
func repetidos(myArray:Array<Int>)->Bool{
    if myArray.sorted() != myArray{
        print("Error, los numeros deben de estar ordenados")
        return false
    }
    return true
}


var firstArray = [2,5,8]
var secondArray: [Int] = []


for i in firstArray.min()!...firstArray.max()!{
    secondArray.append(i)}

secondArray.removeAll(where: {firstArray.contains($0)})
print(firstArray)
print(secondArray)

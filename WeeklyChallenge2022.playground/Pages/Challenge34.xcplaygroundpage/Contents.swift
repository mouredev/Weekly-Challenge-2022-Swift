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

func losNumerosPerdidos(firstArray: Array<Int>)->Bool{
  if firstArray.sorted() != firstArray{
        print("❌ Error, los numeros deben de estar ordenados de Menor a Mayor ❌")
        return false
    }
var i = 0
while i < (firstArray.count-1) {
    if firstArray[i] == firstArray[i+1] {
        print("❌ Error, los numeros no deben de repetirse ❌")
        return false
    }
    i=i+1
}
var secondArray: [Int] = []
for i in firstArray.min()!...firstArray.max()!{
    secondArray.append(i)}
secondArray.removeAll(where: {firstArray.contains($0)})
print("✅ Los números perdidos para el array \(firstArray) son \(secondArray) ✅")
return true
}

losNumerosPerdidos(firstArray: [1,2,5])
losNumerosPerdidos(firstArray: [3,8,15])
losNumerosPerdidos(firstArray: [-8,1,5])
losNumerosPerdidos(firstArray: [4,6,6,10])
losNumerosPerdidos(firstArray: [1,1,5])
losNumerosPerdidos(firstArray: [10,2,5])


//Solucionado

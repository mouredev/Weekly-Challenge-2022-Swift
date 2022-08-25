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

/*func losNumerosPerdidos(numbers: Array)->Array {
    return numbers
}
losNumerosPerdidos(numbers: [1,2,3,5])*/

func losNumerosPerdidos(myArray: Array<Int>)-> Bool {

    /*let myArray = [1,2,5,10,14,14]*/
    var i=0
    var k=0
    var nuevoArray = [Int]()
    

    if myArray.sorted() != myArray{
        print("Error, los numeros deben de estar ordenados")
        return false
    }
    while i < myArray.count-1{
        if myArray[i] == myArray[i+1]{
        print("Error hay un numero repetido")
        return false
        }
    i=i+1
    }
    
    for i in myArray.min()!...myArray.max()!{
            print(i)
    }
    return true
}
print(losNumerosPerdidos(myArray: [3,5,6,10]))

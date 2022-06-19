import Foundation

/*
 * Reto #23
 * MÁXIMO COMÚN DIVISOR Y MÍNIMO COMÚN MÚLTIPLO
 * Fecha publicación enunciado: 07/06/22
 * Fecha publicación resolución: 13/06/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea dos funciones, una que calcule el máximo común divisor (MCD) y otra que calcule el mínimo común múltiplo (mcm) de dos números enteros.
 * - No se pueden utilizar operaciones del lenguaje que lo resuelvan directamente.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

func mcd(firstNumber: Int, secondNumber: Int) -> Int {
    
    var a = firstNumber
    var b = secondNumber
    
    while a != 0 && b != 0 {
        let temp = b
        b = a % b
        a = temp
    }
    
    return a + b
}

func mcm(firstNumber: Int, secondNumber: Int) -> Int {
    return (firstNumber * secondNumber) / mcd(firstNumber: firstNumber, secondNumber: secondNumber)
}

func mcdRecursive(firstNumber: Int, secondNumber: Int) -> Int {
    return (firstNumber == 0 || secondNumber == 0) ? (firstNumber + secondNumber) : mcdRecursive(firstNumber: secondNumber, secondNumber: firstNumber % secondNumber)
}

print(mcd(firstNumber: 56, secondNumber: 180))
print(mcdRecursive(firstNumber: 56, secondNumber: 180))
print(mcm(firstNumber: 56, secondNumber: 180))

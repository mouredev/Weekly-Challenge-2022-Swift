import Foundation

/*
 * Reto #13
 * FACTORIAL RECURSIVO
 * Fecha publicación enunciado: 28/03/22
 * Fecha publicación resolución: 04/04/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Escribe una función que calcule y retorne el factorial de un número dado de forma recursiva.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

func factorial (numero: Int) -> Int? {
    
    if numero < 1 {
        if numero < 0 {
            return nil
        } else {
            return 1
        }
    } else {
        return numero * factorial(numero: numero - 1)!
    }
}


print(factorial(numero: 0) ?? "Error")
print(factorial(numero: 7) ?? "Error")
print(factorial(numero: 10) ?? "Error")
print(factorial(numero: 1) ?? "Error")
print(factorial(numero: -1) ?? "Error")

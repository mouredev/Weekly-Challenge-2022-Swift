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

extension Int {
    func factorial() -> Int {
        if self <= 1 {
            return 1
        }
        return self * (self-1).factorial()
    }
}


print(0.factorial() == 1)
print(1.factorial() == 1)
print(2.factorial() == 2)
print(3.factorial() == 6)
print(4.factorial() == 24)
print(5.factorial() == 120)
print(6.factorial() == 720)
print(7.factorial() == 5040)
print(8.factorial() == 40320)
print(9.factorial() == 362880)
print(10.factorial() == 3628800)
print(15.factorial() == 1307674368000)
print(20.factorial() == 2432902008176640000)

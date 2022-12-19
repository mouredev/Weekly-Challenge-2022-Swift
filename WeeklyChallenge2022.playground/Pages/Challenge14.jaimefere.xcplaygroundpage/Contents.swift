import Foundation

/*
 * Reto #14
 * ¿ES UN NÚMERO DE ARMSTRONG?
 * Fecha publicación enunciado: 04/04/22
 * Fecha publicación resolución: 11/04/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Escribe una función que calcule si un número dado es un número de Armstrong (o también llamado narcisista).
 * Si no conoces qué es un número de Armstrong, debes buscar información al respecto.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

func isArmstrong(number: Int) -> Bool {
    var summatory = 0.0
    String(number).forEach {
        summatory += pow(Double(String($0))!, Double(String(number).count))
    }
    return Int(summatory) == number
}

print(isArmstrong(number: 123))
print(isArmstrong(number: 153))
print(isArmstrong(number: 371))
print(isArmstrong(number: 1080))
print(isArmstrong(number: 1634))
print(isArmstrong(number: 8208))

import Foundation

/*
 * Reto #19
 * CONVERSOR TIEMPO
 * Fecha publicación enunciado: 09/05/22
 * Fecha publicación resolución: 16/05/22
 * Dificultad: FACIL
 *
 * Enunciado: Crea una función que reciba días, horas, minutos y segundos (como enteros) y retorne su resultado en milisegundos.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

func timeToMillis(days: Int, hours: Int, minutes: Int, seconds: Int) -> Int {

    let daysInMillis = days * 24 * 60 * 60 * 1000
    let hoursInMillis = hours * 60 * 60 * 1000
    let minutesInMillis = minutes * 60 * 1000
    let secondsToMillis = seconds * 1000

    return daysInMillis + hoursInMillis + minutesInMillis + secondsToMillis
}

print(timeToMillis(days: 0, hours: 0, minutes: 0, seconds: 10))
print(timeToMillis(days: 2, hours: 5, minutes: -45, seconds: 10))
print(timeToMillis(days: 2000000000, hours: 5, minutes: 45, seconds: 10))

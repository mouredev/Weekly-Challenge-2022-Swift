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

func getMillis(days: Int, hours: Int, minutes: Int, seconds: Int) -> Int {
    return (abs(days) * 86400 + abs(hours) * 3600 + abs(minutes) * 60 + abs(seconds)) * 1000
}

print(getMillis(days: -365, hours: 0, minutes: 0, seconds: 0))
print(getMillis(days: 365, hours: 0, minutes: 0, seconds: 0))

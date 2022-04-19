import Foundation

/*
 * Reto #15
 * ¿CUÁNTOS DÍAS?
 * Fecha publicación enunciado: 11/04/22
 * Fecha publicación resolución: 18/04/22
 * Dificultad: DIFÍCIL
 *
 * Enunciado: Crea una función que calcule y retorne cuántos días hay entre dos cadenas de texto que representen fechas.
 * - Una cadena de texto que representa una fecha tiene el formato "dd/MM/yyyy".
 * - La función recibirá dos String y retornará un Int.
 * - La diferencia en días será absoluta (no importa el orden de las fechas).
 * - Si una de las dos cadenas de texto no representa una fecha correcta se lanzará una excepción.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

private func daysInterval(dateText1: String, dateText2: String) -> Int {
    let daySeconds = 60 * 60 * 24
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"
    if let date1 = formatter.date(from: dateText1), let date2 = formatter.date(from: dateText2) {
        return Int(abs(date1.timeIntervalSince(date2))) / daySeconds
    } else {
        print("Alguna de las dos fechas de entrada es errónea")
        return -1
    }
}

print(daysInterval(dateText1: "16/04/2022", dateText2: "16-04-2022"))
print(daysInterval(dateText1: "16/04/2022", dateText2: "16/13/2022"))
print(daysInterval(dateText1: "16/04/2022", dateText2: "32/04/2022"))
print(daysInterval(dateText1: "16/04/2022", dateText2: "17/04/2022"))
print(daysInterval(dateText1: "17/04/2022", dateText2: "16/04/2022"))
print(daysInterval(dateText1: "17/04/2022", dateText2: "16/04/2023"))

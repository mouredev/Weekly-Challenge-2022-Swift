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

class InvalidAnyDates: Error {}

extension String {
    func toDate() -> Date? {
        let format = DateFormatter()
        format.dateFormat = "dd/MM/yyyy"
        return format.date(from: self)
    }
}

extension Calendar {
    func daysBetween(from: Date, to: Date) -> Int {
        dateComponents([.day], from: from, to: to).day!
    }
}

func howManyDates(from: String, to: String) throws -> Int {
    if let fromDate = from.toDate(), let toDate = to.toDate() {
        return abs(Calendar.current.daysBetween(from: fromDate, to: toDate))
    }
    throw InvalidAnyDates()
}

do {
    print(try howManyDates(from: "01/02/2004", to: "01/03/2004"))
    print(try howManyDates(from: "01/02/2005", to: "01/03/2005"))
} catch {
    print(error)
}

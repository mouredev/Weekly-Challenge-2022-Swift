import Foundation

/*
 * Reto #31
 * AÑOS BISIESTOS
 * Fecha publicación enunciado: 01/08/22
 * Fecha publicación resolución: 08/08/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea una función que imprima los 30 próximos años bisiestos siguientes a uno dado.
 * - Utiliza el menor número de líneas para resolver el ejercicio.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

// MARK: SOLUTION WITHOUT CALENDAR
private func getNextThirtyLeapYearsWithoutCalendarFrom(year: Int) {
    var inputYear: Int = year
    var numberOfLeapYearsFinded: Int = 0
    while numberOfLeapYearsFinded < 30 {
        if (inputYear % 4 == 0) && (inputYear % 100 != 0) || (inputYear % 4 == 0) && (inputYear % 100 == 0) && (inputYear % 400 == 0) {
            numberOfLeapYearsFinded += 1
            print("\(numberOfLeapYearsFinded)) - LeapYear: \(inputYear)")
        }
        inputYear += 1
    }
}

// MARK: SOLUTION WITH CALENDAR
private func getNextThirtyLeapYearsWithCalendarFrom(year: Int) {
    var inputYear: Int = year
    var numberOfLeapYearsFinded: Int = 0
    while numberOfLeapYearsFinded < 30 {
        if let date = Calendar.current.date(from: DateComponents(year: inputYear)), let numDays = Calendar.current.range(of: .day, in: .year, for: date)?.count, numDays > 365 {
            numberOfLeapYearsFinded += 1
            print("\(numberOfLeapYearsFinded)) - LeapYear: \(inputYear)")
        }
        inputYear += 1
    }
}





getNextThirtyLeapYearsWithCalendarFrom(year: 1900)
getNextThirtyLeapYearsWithoutCalendarFrom(year: 1900)

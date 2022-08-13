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

enum DaysBetweenError: Error {
    case dateFormat
}

func daysBetween(firstDate: String, secondDate: String) throws -> Int {
    
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"
    
    let regex = try! NSRegularExpression(pattern: "^([0-9]){2}[/]([0-9]){2}[/]([0-9]){4}$", options: [])
    
    if regex.firstMatch(in: firstDate, range: NSMakeRange(0, firstDate.count)) != nil,
       regex.firstMatch(in: secondDate, range: NSMakeRange(0, secondDate.count)) != nil,
       let firstParsedDate = formatter.date(from: firstDate),
       let secondParsedDate = formatter.date(from: secondDate),
       let days = Calendar.current.dateComponents([.day], from: firstParsedDate, to: secondParsedDate).day {
       
        return abs(days)
    }
    
    throw DaysBetweenError.dateFormat
}

func printDaysBetween(firstDate: String, secondDate: String) {
    do {
        print(try daysBetween(firstDate: firstDate, secondDate: firstDate))
    } catch DaysBetweenError.dateFormat {
        print("Error en el formato de alguna fecha")
    } catch {
        print("Error en el parse de alguna fecha")
    }
}

printDaysBetween(firstDate: "18/05/2022", secondDate: "29/05/2022")
printDaysBetween(firstDate: "mouredev", secondDate: "29/04/2022")
printDaysBetween(firstDate: "18/5/2022", secondDate: "29/04/2022")

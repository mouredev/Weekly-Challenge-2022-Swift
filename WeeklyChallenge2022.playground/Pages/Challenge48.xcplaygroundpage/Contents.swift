import Foundation

/*
 * Reto #48
 * EL CALENDARIO DE ADEVIENTO 2022
 * Fecha publicación enunciado: 28/11/22
 * Fecha publicación resolución: 05/12/22
 * Dificultad: FÁCIL
 *
 * ¿Conoces el calendario de adviento de la comunidad (https://adviento.dev)?
 * 24 días, 24 regalos sorpresa relacionados con desarrollo de software, ciencia y tecnología desde el 1 de diciembre.
 *
 * Enunciado: Crea una función que reciba un objeto de tipo "Date" y retorne lo siguiente:
 * - Si la fecha coincide con el calendario de aDEViento 2022: Retornará el regalo de ese día (a tu elección) y cuánto queda para que finalice el sorteo de ese día.
 * - Si la fecha es anterior: Cuánto queda para que comience el calendario.
 * - Si la fecha es posterior: Cuánto tiempo ha pasado desde que ha finalizado.
 *
 * Notas:
 * - Tenemos en cuenta que cada día del calendario comienza a medianoche 00:00:00 y finaliza a las 23:59:59.
 * - Debemos trabajar con fechas que tengan año, mes, día, horas, minutos y segundos.
 * - 🎁 Cada persona que aporte su solución entrará en un nuevo sorteo del calendario de aDEViento hasta el día de su corrección (sorteo exclusivo para quien entregue su solución).
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal"
 *   para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en
 *   https://retosdeprogramacion.com/semanales2022.
 *
 */

func aDEViento2022(date: Date) -> String? {

    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"

    if let startDate = formatter.date(from: "2022/12/01 00:00:00"),
       let endDate = formatter.date(from: "2022/12/24 23:59:59") {
        
        if date >= startDate && date <= endDate {
            
            let gifts = [
                "El programador pragmático",
                "while True: learn()",
                "Aprende Javascript ES9, HTML, CSS3 y NodeJS desde cero",
                "Patrones de Diseño en JavaScript y TypeScript",
                "Aprende Python en un fin de semana",
                "Regalo 6",
                "Regalo 7",
                "Regalo 8",
                "Regalo 9",
                "Regalo 10",
                "Regalo 11",
                "Regalo 12",
                "Regalo 13",
                "Regalo 14",
                "Regalo 15",
                "Regalo 16",
                "Regalo 17",
                "Regalo 18",
                "Regalo 19",
                "Regalo 20",
                "Regalo 21",
                "Regalo 22",
                "Regalo 23",
                "Regalo 24"]
            
            var calendar = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
            calendar.hour = 23
            calendar.minute = 59
            calendar.second = 59

            if let day = calendar.day, let dayEndDate = Calendar.current.date(from: calendar) {
                
                return "El regalo del día es: \(gifts[day - 1]) y el sorteo del día acaba en: \(diffTimeComponentsText(startDate: date, endDate: dayEndDate))"
            }
        } else {
            
            let intro = date < startDate ? "El calendario de aDEViento 2022 comenzará en:" : "El calendario de aDEViento 2022 ha finalizado hace:"
            let timeComponents = diffTimeComponentsText(startDate: date < startDate ? date : endDate, endDate: date < startDate ? startDate : date)
            return "\(intro) \(timeComponents)"
        }
    }
    
    return nil
}

func diffTimeComponentsText(startDate: Date, endDate: Date) -> String {
    
    let diffInMillis = Int((endDate.timeIntervalSince1970 * 1000).rounded() - (startDate.timeIntervalSince1970 * 1000).rounded())
    
    let second = diffInMillis / 1000 % 60
    let minutes = diffInMillis / (1000 * 60) % 60
    let hours = diffInMillis / (1000 * 60 * 60) % 24
    let days = diffInMillis / (1000 * 60 * 60 * 24) % 365
    let years = diffInMillis / (1000 * 60 * 60 * 24 * 365)

    return "\(years) años, \(days) días, \(hours) horas, \(minutes) minutos, \(second) segundos"
}

//var dateComponents = DateComponents()
//dateComponents.year = 2022
//dateComponents.month = 12
//dateComponents.day = 5
//dateComponents.hour = 20
//dateComponents.minute = 27
//dateComponents.second = 56
//
//if let date = Calendar.current.date(from: dateComponents) {
//    aDEViento2022(date: date)
//}

let formatter = DateFormatter()
formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"

if let date = formatter.date(from: "2022/12/05 20:27:56") {
    print(aDEViento2022(date: date) ?? "Error")
}
if let date = formatter.date(from: "2022/12/01 00:00:00") {
    print(aDEViento2022(date: date) ?? "Error")
}
if let date = formatter.date(from: "2022/12/24 23:59:59") {
    print(aDEViento2022(date: date) ?? "Error")
}
if let date = formatter.date(from: "2022/11/30 23:59:59") {
    print(aDEViento2022(date: date) ?? "Error")
}
if let date = formatter.date(from: "2022/12/25 00:00:00") {
    print(aDEViento2022(date: date) ?? "Error")
}
if let date = formatter.date(from: "2022/10/30 00:00:00") {
    print(aDEViento2022(date: date) ?? "Error")
}
if let date = formatter.date(from: "2022/12/30 04:32:12") {
    print(aDEViento2022(date: date) ?? "Error")
}
if let date = formatter.date(from: "2020/10/30 00:00:00") {
    print(aDEViento2022(date: date) ?? "Error")
}
if let date = formatter.date(from: "2024/12/30 04:32:12") {
    print(aDEViento2022(date: date) ?? "Error")
}

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

import Foundation
import _Concurrency
import PlaygroundSupport

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"

func scrapADEVientoPrizeFor(day: Int) async -> String {
    let url = URL(string: "https://adviento.dev")
    return await withUnsafeContinuation { continuation in
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { data, response, error in
            guard let data = data else { return }
            guard let htmlText = String(data: data, encoding: .utf8) else { return }
            let days = htmlText.split(separator: ")</span></span></h4>")
            days.indices.forEach { index in
                if((index < days.count-1) && days[index].contains("(\(day)/24")) {
                    var prize = days[index+1].split(separator: "</div>")[0].split(separator: "\">")[1]
                    if(days[index+1].starts(with: "<h4")) {
                        prize = days[index+1].split(separator: "title=\"")[1].split(separator: "\">")[0]
                    }
                    continuation.resume(returning: String(prize.replacingOccurrences(of: "<b>", with: "").replacingOccurrences(of: "</b>", with: "").replacingOccurrences(of: "&quot;", with: "\"")))
                }
            }
            continuation.resume(returning: "unknown")
        }
        task.resume()
    }
}

func formatDateFrom(timeInterval: TimeInterval) -> String {
    var calendar = Calendar.current
    calendar.locale = Locale(identifier: "es")
    let formatter = DateComponentsFormatter()
    formatter.calendar = calendar
    formatter.maximumUnitCount = 1
    formatter.unitsStyle = .full
    formatter.zeroFormattingBehavior = .dropAll
    formatter.allowedUnits = [.day, .hour, .minute, .second]
    return formatter.string(from: timeInterval)!
}

func showADEVientoInfoFor(date: Date) {
    let calendarStartDate = dateFormatter.date(from: "2022/12/01 00:00:00")!
    let calendarEndDate = dateFormatter.date(from: "2022/12/24 23:59:59")!
    
    if(date.timeIntervalSince(calendarStartDate) < 0) {
        print("El Calendario de aDEViento 2022 inicia en \(formatDateFrom(timeInterval: abs(date.timeIntervalSince(calendarStartDate))))")
    } else if(date.timeIntervalSince(calendarEndDate) > 0) {
        print("El Calendario de aDEViento 2022 finalizó hace \(formatDateFrom(timeInterval: date.timeIntervalSince(calendarEndDate)))")
    } else {
        let dateDay = Calendar.current.dateComponents([.day], from: date)
        Task {
            let prize = await scrapADEVientoPrizeFor(day: dateDay.day!)
            if(prize != "unknown") {
                let todayDay = Calendar.current.dateComponents([.day], from: .now)
                if(dateDay.day! == todayDay.day!) {
                    let endDay = dateFormatter.date(from: "2022/12/\(dateDay.day!) 23:59:59")!
                    print("Quedan \(formatDateFrom(timeInterval: endDay.timeIntervalSince(.now))) para participar en el sorteo de: \(prize)")
                } else {
                    print("El premio fue: \(prize)")
                }
            } else {
                let startDay = dateFormatter.date(from: "2022/12/\(dateDay.day!) 00:00:00")!
                print("En \(formatDateFrom(timeInterval: startDay.timeIntervalSince(.now))) se conocerá el premio y comenzará el sorteo.")
            }
        }
    }
}

showADEVientoInfoFor(date: dateFormatter.date(from: "2022/11/30 23:00:00")!)
showADEVientoInfoFor(date: dateFormatter.date(from: "2022/12/26 01:00:00")!)
//showADEVientoInfoFor(date: dateFormatter.date(from: "2022/12/01 04:00:00")!)
//showADEVientoInfoFor(date: dateFormatter.date(from: "2022/12/02 08:00:00")!)
//showADEVientoInfoFor(date: dateFormatter.date(from: "2022/12/03 12:00:00")!)
//showADEVientoInfoFor(date: dateFormatter.date(from: "2022/12/04 16:00:00")!)
showADEVientoInfoFor(date: .now)
//showADEVientoInfoFor(date: dateFormatter.date(from: "2022/12/07 20:00:00")!)


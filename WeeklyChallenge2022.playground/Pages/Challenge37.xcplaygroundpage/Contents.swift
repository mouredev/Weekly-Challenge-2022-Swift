import Foundation

/*
 * Reto #37
 * LOS LANZAMIENTOS DE "THE LEGEND OF ZELDA"
 * Fecha publicación enunciado: 14/09/22
 * Fecha publicación resolución: 19/09/22
 * Dificultad: MEDIA
 *
 * Enunciado: ¡Han anunciado un nuevo "The Legend of Zelda"! Se llamará "Tears of the Kingdom"
 * y se lanzará el 12 de mayo de 2023.
 * Pero, ¿recuerdas cuánto tiempo ha pasado entre los distintos "The Legend of Zelda" de la historia?
 * Crea un programa que calcule cuántos años y días hay entre 2 juegos de Zelda que tú selecciones.
 * - Debes buscar cada uno de los títulos y su día de lanzamiento (si no encuentras el día exacto
 *   puedes usar el mes, o incluso inventártelo)
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal"
 *   para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en
 *   https://retosdeprogramacion.com/semanales2022.
 *
 */

enum Zeldas: String {
    case TheLegendOfZelda_OcarinaOfTime = "11/12/1998"
    case Zelda_MajoraSMask = "17/11/2000"
    case TheLegendOfZelda_ALinkToThePast = "23/03/2007"
    
}

func daysBetween(start: String, end: String) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "mm/dd/YYYY"
    dateFormatter.locale = Locale(identifier: "es_ES")
    dateFormatter.dateStyle = .short
    
    var result = Calendar.current.dateComponents([.day,.year], from: dateFormatter.date(from: start) ?? Date(), to: dateFormatter.date(from: end) ?? Date())
    print("Han pasado \(result.year!) años y \(result.day!) días entre estos dos juegos de Zelda")
}

daysBetween(start: Zeldas.TheLegendOfZelda_OcarinaOfTime.rawValue, end: Zeldas.TheLegendOfZelda_ALinkToThePast.rawValue)

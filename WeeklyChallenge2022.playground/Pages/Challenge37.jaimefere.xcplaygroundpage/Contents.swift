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

enum ZeldaEdition {
    case TheLegendOfZelda
    case TheAdventureOfLink
    case ALinkToThePast
    case LinksAwakenings
    case OcarinaOfTime
    case MejorasMask
    case OracleOfSeasons
    case OracleOfAges
    case ALinkToThePastAndFourSwords
    case TheWindWaker
    case FourSwordsAdventures
    case TheMinishCap
    case TwilightPrincess
    case PhantomHourglass
    case SpiritTracks
    case SkywordSword
    case ALinkBetweenWords
    case TriForceHeroes
    case BreathOfTheWild
    case TearsOfTheKingdom
    
    var releaseDate: String {
        switch self {
        case .TheLegendOfZelda: return "21/02/1986"
        case .TheAdventureOfLink: return "14/01/1987"
        case .ALinkToThePast: return "21/11/1991"
        case .LinksAwakenings: return "06/06/1993"
        case .OcarinaOfTime: return "21/11/1998"
        case .MejorasMask: return "27/04/2000"
        case .OracleOfSeasons: return "27/02/2001"
        case .OracleOfAges: return "27/02/2001"
        case .ALinkToThePastAndFourSwords: return "03/12/2002"
        case .TheWindWaker: return "03/12/2002"
        case .FourSwordsAdventures: return "18/03/2004"
        case .TheMinishCap: return "04/11/2004"
        case .TwilightPrincess: return "19/11/2006"
        case .PhantomHourglass: return "23/06/2007"
        case .SpiritTracks: return "07/12/2009"
        case .SkywordSword: return "18/11/2011"
        case .ALinkBetweenWords: return "22/11/2013"
        case .TriForceHeroes: return "22/11/2015"
        case .BreathOfTheWild: return "03/03/2017"
        case .TearsOfTheKingdom: return "12/05/2023"
        }
    }
    
    var name: String {
        switch self {
        case .TheLegendOfZelda: return "The Legend of Zelda"
        case .TheAdventureOfLink: return "The Adventure of Link"
        case .ALinkToThePast: return "A Link to the Past"
        case .LinksAwakenings: return "Link's Awakening"
        case .OcarinaOfTime: return "Ocarina of Time"
        case .MejorasMask: return "Majora's Mask"
        case .OracleOfSeasons: return "Oracle of Seasons"
        case .OracleOfAges: return "Oracle of Ages"
        case .ALinkToThePastAndFourSwords: return "A Link to the Past & Four Swords"
        case .TheWindWaker: return "The Wind Waker"
        case .FourSwordsAdventures: return "Four Swords Adventures"
        case .TheMinishCap: return "The Minish Cap"
        case .TwilightPrincess: return "Twilight Princess"
        case .PhantomHourglass: return "Phantom Hourglass"
        case .SpiritTracks: return "Spirit Tracks"
        case .SkywordSword: return "Skyward Sword"
        case .ALinkBetweenWords: return "A Link Between Worlds"
        case .TriForceHeroes: return "Tri Force Heroes"
        case .BreathOfTheWild: return "Breath of the Wild"
        case .TearsOfTheKingdom: return "Tears of the Kingdom"
        }
    }
}

// From Challenge 15
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

private func timeBetweenZeldaEditions(anEdition: ZeldaEdition, otherEdition: ZeldaEdition) -> String {
    let days = daysInterval(dateText1: anEdition.releaseDate, dateText2: otherEdition.releaseDate)
    let years = Int(ceil(Double(days) / 365.0))
    return "\(years) años y \(days % 365) días de diferencia entre el lanzamiento de '\(anEdition.name)' y '\(otherEdition.name)'"
}

print(timeBetweenZeldaEditions(anEdition: ZeldaEdition.TheLegendOfZelda, otherEdition: ZeldaEdition.TearsOfTheKingdom))

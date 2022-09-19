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

enum ZeldaGame: String {

    case theLegendOfZelda = "The Legend of Zelda"
    case theAdventureOfLink = "Zelda II: The Adventure of Link"
    case aLinkToThePast = "The Legend of Zelda: A Link to the Past"
    case linksAwakening = "The Legend of Zelda: Link's Awakening"
    case ocarinaOfTime = "The Legend of Zelda: Ocarina of Time"
    case majorasMask = "Zelda: Majora's Mask"
    case oracleOfSeasons = "The Legend of Zelda: Oracle of Seasons"
    case oracleOfAges = "The Legend of Zelda: Oracle of Ages"
    case fourSwords = "The Legend of Zelda: Four Swords"
    case theWindWaker = "The Legend of Zelda: The Wind Waker"
    case fourSwordsAdventures = "The Legend of Zelda: Four Swords Adventures"
    case theMinishCup = "The Legend of Zelda: The Minish Cap"
    case twilightPricess = "The Legend of Zelda: Twilight Princess"
    case phanthomHourglass = "The Legend of Zelda: Phantom Hourglass"
    case spiritTracks = "The Legend of Zelda: Spirit Tracks"
    case skywardSword = "The Legend of Zelda: Skyward Sword"
    case aLinkBetweenWorlds = "The Legend of Zelda: A Link Between Worlds"
    case triForceHeoes = "The Legend of Zelda: Tri Force Heroes"
    case breathOfTheWild = "The Legend of Zelda:  Breath of the Wild"
    case tearsOfTheKingdom = "The Legend of Zelda: Tears of the Kingdom"

    private var releaseDate: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        switch self {
        case .theLegendOfZelda:
            return dateFormatter.date(from: "21/02/1986")
        case .theAdventureOfLink:
            return dateFormatter.date(from: "14/01/1987")
        case .aLinkToThePast:
            return dateFormatter.date(from: "21/11/1991")
        case .linksAwakening:
            return dateFormatter.date(from: "06/06/1993")
        case .ocarinaOfTime:
            return dateFormatter.date(from: "21/11/1998")
        case .majorasMask:
            return dateFormatter.date(from: "27/04/2000")
        case .oracleOfSeasons, .oracleOfAges:
            return dateFormatter.date(from: "27/02/2001")
        case .fourSwords:
            return dateFormatter.date(from: "03/12/2002")
        case .theWindWaker:
            return dateFormatter.date(from: "13/12/2002")
        case .fourSwordsAdventures:
            return dateFormatter.date(from: "18/03/2004")
        case .theMinishCup:
            return dateFormatter.date(from: "04/11/2004")
        case .twilightPricess:
            return dateFormatter.date(from: "19/11/2006")
        case .phanthomHourglass:
            return dateFormatter.date(from: "23/06/2007")
        case .spiritTracks:
            return dateFormatter.date(from: "07/12/2009")
        case .skywardSword:
            return dateFormatter.date(from: "18/11/2011")
        case .aLinkBetweenWorlds:
            return dateFormatter.date(from: "23/11/2013")
        case .triForceHeoes:
            return dateFormatter.date(from: "11/10/2015")
        case .breathOfTheWild:
            return dateFormatter.date(from: "03/03/2017")
        case .tearsOfTheKingdom:
            return dateFormatter.date(from: "12/05/2023")
        }
    }

    func timeBetweenRelease(game: ZeldaGame) -> String {

        if self == game {
            return "Se está intentando comparar el mismo juego"
        }
        
        if let currentReleaseDate = self.releaseDate, let newReleaseDate = game.releaseDate {

            let startDate = currentReleaseDate < newReleaseDate ? currentReleaseDate : newReleaseDate
            let endDate = newReleaseDate > currentReleaseDate ? newReleaseDate : currentReleaseDate

            var startCalendar = Calendar.current.dateComponents([.year, .month, .day], from: startDate)
            let startReleaseYear = startCalendar.year ?? 0
            
            let endCalendar = Calendar.current.dateComponents([.year, .month, .day], from: endDate)
            let endReleaseYear = endCalendar.year ?? 0

            var years = endReleaseYear - startReleaseYear

            startCalendar.year = endReleaseYear
            
            // Nos encontramos con un día y un mes en la fecha inicial posterior a la final

            var startDateMillis = (Calendar.current.date(from: startCalendar)?.timeIntervalSince1970 ?? 0) * 1000
            let endDateMillis  = (Calendar.current.date(from: endCalendar)?.timeIntervalSince1970 ?? 0) * 1000
            
            if startDateMillis > endDateMillis {
                startCalendar.year = endReleaseYear - 1
                years -= 1
                startDateMillis = (Calendar.current.date(from: startCalendar)?.timeIntervalSince1970 ?? 0) * 1000
            }

            let startMillis = startDateMillis < endDateMillis ? startDateMillis : endDateMillis
            let endMillis = endDateMillis > startDateMillis ? endDateMillis : startDateMillis

            let days =  Int((endMillis - startMillis) / (60 * 60 * 24 * 1000))
            
            return "Entre la fecha de lanzamiento de \(self.rawValue) y \(game.rawValue) hay \(years) años y \(days) días"
        }

        return "No se ha podido calcular el tiempo entre fechas de lanzamiento"
    }

}

print(ZeldaGame.theLegendOfZelda.timeBetweenRelease(game: .tearsOfTheKingdom))
print(ZeldaGame.tearsOfTheKingdom.timeBetweenRelease(game: .theLegendOfZelda))
print(ZeldaGame.theLegendOfZelda.timeBetweenRelease(game: .theAdventureOfLink))
print(ZeldaGame.theAdventureOfLink.timeBetweenRelease(game: .theLegendOfZelda))
print(ZeldaGame.theLegendOfZelda.timeBetweenRelease(game: .theLegendOfZelda))
print(ZeldaGame.oracleOfSeasons.timeBetweenRelease(game: .oracleOfAges))

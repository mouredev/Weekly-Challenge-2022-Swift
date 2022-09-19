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

enum Zeldas {
    //https://en.wikipedia.org/wiki/List_of_The_Legend_of_Zelda_media
    
    case TheLegendOfZelda
    case TheAventureOfLink
    case ALinkToThePast
    case LinksAwakening
    case OcarinaOfTime
    case MajorasMask
    case OracleOfSeasons
    case OracleOfAges
    case ALinkToThePast_FourSword
    case TheWindMaker
    case FourSwordAdventures
    case TheMinishCap
    case TwilightPrincess
    case PhantomHourglass
    case SpiritTracks
    case SkywardSword
    case ALinkBetweenWorlds
    case TriForceHeroes
    case BreathOfTheWild
    case TearsOfTheKingdom
    
    var name: String {
        switch self {
        case .TheLegendOfZelda:
            return "The Legend of Zelda"
        case .TheAventureOfLink:
            return "Zelda II: The Adventure of Link"
        case .ALinkToThePast:
            return "The Legend of Zelda: A Link to the Past"
        case .LinksAwakening:
            return "The Legend of Zelda: Link's Awakening"
        case .OcarinaOfTime:
            return "The Legend of Zelda: Ocarina of Time"
        case .MajorasMask:
            return "Zelda: Majora's Mask"
        case .OracleOfSeasons:
            return "The Legend of Zelda: Oracle of Seasons"
        case .OracleOfAges:
            return "The Legend of Zelda: Oracle of Ages"
        case .ALinkToThePast_FourSword:
            return "The Legend of Zelda: A Link to the Past & Four Swords"
        case .TheWindMaker:
            return "The Legend of Zelda: The Wind Waker"
        case .FourSwordAdventures:
            return "The Legend of Zelda: Four Swords Adventures"
        case .TheMinishCap:
            return "The Legend of Zelda: The Minish Cap"
        case .TwilightPrincess:
            return "The Legend of Zelda: Twilight Princess"
        case .PhantomHourglass:
            return "The Legend of Zelda: Phantom Hourglass"
        case .SpiritTracks:
            return "The Legend of Zelda: Spirit Tracks"
        case .SkywardSword:
            return "The Legend of Zelda: Skyward Sword"
        case .ALinkBetweenWorlds:
            return "The Legend of Zelda: A Link Between Worlds"
        case .TriForceHeroes:
            return "The Legend of Zelda: Tri Force Heroes"
        case .BreathOfTheWild:
            return "The Legend of Zelda: Breath of the Wild"
        case .TearsOfTheKingdom:
            return "The Legend of Zelda: Tears of the Kingdom"
        }
    }
    
    var release: String {
        switch self {
        case .TheLegendOfZelda:
            return "15/11/1987"
        case .TheAventureOfLink:
            return "26/09/1988"
        case .ALinkToThePast:
            return "24/09/1992"
        case .LinksAwakening:
            return "24/09/1993"
        case .OcarinaOfTime:
            return "11/12/1998"
        case .MajorasMask:
            return "17/11/2000"
        case .OracleOfSeasons:
            return "05/10/2001"
        case .OracleOfAges:
            return "05/10/2001"
        case .ALinkToThePast_FourSword:
            return "28/03/2003"
        case .TheWindMaker:
            return "02/05/2003"
        case .FourSwordAdventures:
            return "07/04/2005"
        case .TheMinishCap:
            return "07/04/2005"
        case .TwilightPrincess:
            return "08/12/2006"
        case .PhantomHourglass:
            return "19/11/2007"
        case .SpiritTracks:
            return "11/12/2009"
        case .SkywardSword:
            return "18/11/2011"
        case .ALinkBetweenWorlds:
            return "22/11/2013"
        case .TriForceHeroes:
            return "23/11/2015"
        case .BreathOfTheWild:
            return "03/03/2017"
        case .TearsOfTheKingdom:
            return "12/05/2023"
        }
    }
}

func daysBetween(startGame: Zeldas, endGame: Zeldas) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "mm/dd/YYYY"
    dateFormatter.locale = Locale(identifier: "es_ES")
    dateFormatter.dateStyle = .short
    
    var result = Calendar.current.dateComponents(
        [.day,.year],
        from: dateFormatter.date(from: startGame.release) ?? Date(),
        to: dateFormatter.date(from: endGame.release) ?? Date()
    )
    
    print("Han pasado \(result.year!.magnitude) años y \(result.day!.magnitude) días entre los juegos \(startGame.name) y \(endGame.name)")
}

daysBetween(startGame: Zeldas.OcarinaOfTime, endGame: Zeldas.ALinkToThePast)

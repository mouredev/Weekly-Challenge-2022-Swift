import Foundation

/*
 * Reto #33
 * CICLO SEXAGENARIO CHINO
 * Fecha publicación enunciado: 15/08/22
 * Fecha publicación resolución: 22/08/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea un función, que dado un año, indique el elemento y animal correspondiente
 * en el ciclo sexagenario del zodíaco chino.
 * - Información: https://www.travelchinaguide.com/intro/astrology/60year-cycle.htm
 * - El ciclo sexagenario se corresponde con la combinación de los elementos madera,
 *   fuego, tierra, metal, agua y los animales rata, buey, tigre, conejo, dragón, serpiente,
 *   caballo, oveja, mono, gallo, perro, cerdo (en este orden).
 * - Cada elemento se repite dos años seguidos.
 * - El último ciclo sexagenario comenzó en 1984 (Madera Rata).
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en https://retosdeprogramacion.com/semanales2022.
 *
 */

enum Animal: Int, CaseIterable {
    case rat = 0
    case ox = 1
    case tiger = 2
    case rabbit = 3
    case dragon = 4
    case snake = 5
    case horse = 6
    case sheep = 7
    case monkey = 8
    case roaster = 9
    case dog = 10
    case pig = 11
}

enum Element: Int, CaseIterable {
    case wood = 0
    case fire = 2
    case earth = 4
    case metal = 6
    case water = 8
}

func getAnimalBy(sexagenarianCycleIndex: Int) -> Animal {
    return Animal.allCases.first{ $0.rawValue == (sexagenarianCycleIndex % Animal.allCases.count) }!
}

func getElementBy(sexagenarianCycleIndex: Int) -> Element {
    return Element.allCases.first{ $0.rawValue == (sexagenarianCycleIndex % (Element.allCases.count * 2)) || $0.rawValue + 1 == (sexagenarianCycleIndex % (Element.allCases.count * 2)) }!
}

func getChineseZodiacSymbolsBy(year: Int) -> String {
    if(year < 604) {
        return "El zodiaco chino comenzó más tarde, en el año 604 d.c."
    }
    let sexagenarianCycleIndex = year - 604
    return "Para el año \(year) el animal es \(getAnimalBy(sexagenarianCycleIndex: sexagenarianCycleIndex)) y el elemento es \(getElementBy(sexagenarianCycleIndex: sexagenarianCycleIndex))"
}

print(getChineseZodiacSymbolsBy(year: 1924))
print(getChineseZodiacSymbolsBy(year: 1940))
print(getChineseZodiacSymbolsBy(year: 1969))
print(getChineseZodiacSymbolsBy(year: 1983))

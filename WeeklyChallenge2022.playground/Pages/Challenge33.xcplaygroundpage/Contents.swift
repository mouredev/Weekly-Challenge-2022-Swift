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

private func chineseZodiac(year: Int) -> String {

    let elements = ["madera", "fuego", "tierra", "metal", "agua"]
    let animals = ["rata", "buey", "tigre", "conejo", "dragón", "serpiente", "caballo", "oveja", "mono", "gallo", "perro", "cerdo"]

    if year < 604 {
        return "El ciclo sexagenario comenzó en el año 604."
    }

    let sexagenaryYear = (year - 4) % 60
    let element = elements[(sexagenaryYear % 10) / 2]
    let animal = animals[sexagenaryYear % 12]

    return "\(year): \(element) \(animal)"
}

print(chineseZodiac(year: 1924))
print(chineseZodiac(year: 1946))
print(chineseZodiac(year: 1984))
print(chineseZodiac(year:604))
print(chineseZodiac(year:603))
print(chineseZodiac(year: 1987))
print(chineseZodiac(year: 2022))

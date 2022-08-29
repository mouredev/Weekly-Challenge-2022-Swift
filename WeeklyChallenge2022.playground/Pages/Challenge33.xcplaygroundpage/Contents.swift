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

let zodiaco=["rata 🐀", "buey 🐂", "tigre 🐅", "conejo 🐇", "dragón 🐉", "serpiente 🐍","caballo 🐎", "oveja 🐑", "mono 🐒", "gallo 🐓", "perro 🦮", "cerdo 🐖"]
let elemento=["madera 🪵", "fuego 🔥", "tierra 🪨", "metal ㊎", "agua 💧" ]

func cicloSexagenario (year: Int)->Bool {
    if year < 604 {
    print ("El ciclo sexagenario se adoptó oficialmente en el año 604, introduce un año mayor.❌ ")
    return false
    }else{
        let newYear = ((year-4) % 60)
        let newZodiaco = ((newYear) % 12)
        let newElemento = (((newYear) % 10)/2)
        print ("En el ciclo sexagenario chino, para el año \(year), corresponde el Signo \(zodiaco[newZodiaco]) y el elemento \(elemento[newElemento])")
    }
    return true
}
cicloSexagenario(year: 1980)
cicloSexagenario(year: 1924)
cicloSexagenario(year: 2024)
cicloSexagenario(year: 1000)
cicloSexagenario(year: 500)

//Solucionado

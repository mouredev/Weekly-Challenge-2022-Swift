import Foundation

/*
 * Reto #36
 * LOS ANILLOS DE PODER
 * Fecha publicación enunciado: 06/09/22
 * Fecha publicación resolución: 14/09/22
 * Dificultad: MEDIA
 *
 * Enunciado: ¡La Tierra Media está en guerra! En ella lucharán razas leales a Sauron
 * contra otras bondadosas que no quieren que el mal reine sobre sus tierras.
 * Cada raza tiene asociado un "valor" entre 1 y 5:
 * - Razas bondadosas: Pelosos (1), Sureños buenos (2), Enanos (3), Númenóreanos (4), Elfos (5)
 * - Razas malvadas: Sureños malos (2), Orcos (2), Goblins (2), Huargos (3), Trolls (5)
 * Crea un programa que calcule el resultado de la batalla entre los 2 tipos de ejércitos:
 * - El resultado puede ser que gane el bien, el mal, o exista un empate. Dependiendo de la
 *   suma del valor del ejército y el número de integrantes.
 * - Cada ejército puede estar compuesto por un número de integrantes variable de cada raza.
 * - Tienes total libertad para modelar los datos del ejercicio.
 * Ej: 1 Peloso pierde contra 1 Orco, 2 Pelosos empatan contra 1 Orco, 3 Pelosos ganan a 1 Orco.
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal"
 *   para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en
 *   https://retosdeprogramacion.com/semanales2022.
 *
 */

enum KindArmy {
    
    case harfoot, southener, dwarf, numenorean, elf
    
    var bravery: Int {
        switch self {
        case .harfoot:
            return 1
        case .southener:
            return 2
        case .dwarf:
            return 3
        case .numenorean:
            return 4
        case .elf:
            return 5
        }
    }
}

enum EvilArmy {

    case southener, orc, goblin, warg, troll

    var bravery: Int {
        switch self {
        case .southener, .orc, .goblin:
            return 2
        case .warg:
            return 3
        case .troll:
            return 5
        }
    }
}

func battleForTheMiddleEarth(kindArmy: [(KindArmy, Int)], evilArmy: [(EvilArmy, Int)]) {

    var kindArmyPoints = 0
    var evilArmyPoints = 0

    kindArmy.forEach { army, size in
        kindArmyPoints += army.bravery * size
    }
    
    evilArmy.forEach { army, size in
        evilArmyPoints += army.bravery * size
    }

    if kindArmyPoints > evilArmyPoints {
        print("Gana el bien")
    } else if evilArmyPoints > kindArmyPoints {
        print("Gana el mal")
    } else {
        print("Empate")
    }

}
    
battleForTheMiddleEarth(
    kindArmy: [(.elf, 1)],
    evilArmy: [(.troll, 1)])

battleForTheMiddleEarth(
    kindArmy: [(.elf, 1), (.harfoot, 1)],
    evilArmy: [(.troll, 1)])

battleForTheMiddleEarth(
    kindArmy: [(.elf, 1), (.harfoot, 1)],
    evilArmy: [(.troll, 1), (.orc, 1)])

battleForTheMiddleEarth(
    kindArmy: [(.elf, 56), (.harfoot, 80), (.dwarf, 5)],
    evilArmy: [(.troll, 17), (.orc, 51), (.warg, 10), (.southener, 2)])

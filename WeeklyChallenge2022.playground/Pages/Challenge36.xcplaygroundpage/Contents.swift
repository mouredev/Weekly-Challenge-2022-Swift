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

enum BattleResult {
    case draw, evil, good
}

enum GoodRace: Int {
    case Pelosos = 1
    case SureñosBuenos = 2
    case Enanos = 3
    case Numenoreanos = 4
    case Elfos = 5
    
    func strength() -> Int {
        return self.rawValue
    }
}

enum EvilRace {
    case SureñosMalos, Orcos, Goblins, Huargos, Trolls
    
    func strength() -> Int {
        switch(self) {
        case .SureñosMalos, .Orcos, .Goblins: return 2
        case .Huargos: return 3
        case .Trolls: return 5
        }
    }
}

func battle(goodArmy: [GoodRace : Int], evilArmy: [EvilRace : Int]) -> BattleResult {
    let goodStrength = goodArmy.map({ $0.key.strength() * $0.value }).reduce(0, +)
    let evilStrength = evilArmy.map({ $0.key.strength() * $0.value }).reduce(0, +)
    return goodStrength == evilStrength ? .draw : (goodStrength > evilStrength ? .good : .evil)
}

print(battle(goodArmy: [.Pelosos: 1], evilArmy: [.Orcos:1]))
print(battle(goodArmy: [.Pelosos: 2], evilArmy: [.Orcos:1]))
print(battle(goodArmy: [.Pelosos: 3], evilArmy: [.Orcos:1]))

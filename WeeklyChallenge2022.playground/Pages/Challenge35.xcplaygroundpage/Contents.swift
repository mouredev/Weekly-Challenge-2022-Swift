import Foundation

/*
 * Reto #35
 * BATALLA POKÉMON
 * Fecha publicación enunciado: 29/08/22
 * Fecha publicación resolución: 06/09/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea un programa que calcule el daño de un ataque durante una batalla Pokémon.
 * - La fórmula será la siguiente: daño = 50 * (ataque / defensa) * efectividad
 * - Efectividad: x2 (súper efectivo), x1 (neutral), x0.5 (no es muy efectivo)
 * - Sólo hay 4 tipos de Pokémon: Agua, Fuego, Planta y Eléctrico (buscar su efectividad)
 * - El programa recibe los siguientes parámetros:
 *  - Tipo del Pokémon atacante.
 *  - Tipo del Pokémon defensor.
 *  - Ataque: Entre 1 y 100.
 *  - Defensa: Entre 1 y 100.
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal"
 *   para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en
 *   https://retosdeprogramacion.com/semanales2022.
 *
 */

// RESULTS

for i in 1...10 {
    let randomAttacker = PokemonType.allCases.randomElement()!
    let randomAttackPoints = Int.random(in: Constants.kMinBattlePoints...Constants.kMaxBattlePoints)
    
    let randomDefender = PokemonType.allCases.randomElement()!
    let randomDefensePoints = Int.random(in: Constants.kMinBattlePoints...Constants.kMaxBattlePoints)
    
    let battleDamage = calculateDamageInBattle(withAttacker: randomAttacker, attackPoints: randomAttackPoints,
                                               defender: randomDefender, defensePoints: randomDefensePoints)
    
    let formattedBattleDamage = Double(Int(battleDamage * 100)) / 100.0
    
    print("\(i). [\(randomAttacker) (\(randomAttackPoints)) vs. \(randomDefender) (\(randomDefensePoints))] - \(formattedBattleDamage)")
}

// CALCULATIONS

func calculateDamageInBattle(withAttacker attacker: PokemonType, attackPoints: Int, defender: PokemonType, defensePoints: Int) -> Double {
    let battle = Battle(attacker: attacker, defender: defender)
    let effectivity = battle.attackerEffectivity
    
    guard let effectivity = effectivity else {
        print("ERROR: Couldn't find the effectivity for the attack.")
        return 0.0
    }
    
    let totalDamage = 50 * (Double(attackPoints) / Double(defensePoints)) * effectivity
    return totalDamage
}

// DATA

struct Constants {
    // Attack / defense points
    static let kMinBattlePoints = 1
    static let kMaxBattlePoints = 100
    
    // Effectivity coefficients
    static let kSuperEffectivityAmount = 2.0
    static let kNeutralEffectivityAmount = 1.0
    static let kFewEffectivityAmount = 0.5
}

// Pokemon Types
enum PokemonType: String, CaseIterable, Hashable {
    case water = "Water", fire = "Fire", plant = "Plant", electric = "Electric"
}

// Pokemon Effectivity Types and Values
enum Effectivity {
    case superEffective, neutral, notTooEffective
    
    var effectivityAmount: Double {
        switch self {
        case .superEffective: return Constants.kSuperEffectivityAmount
        case .neutral: return Constants.kNeutralEffectivityAmount
        case .notTooEffective: return Constants.kFewEffectivityAmount
        }
    }
}

// Pokemon Battle (attacker and defender)
struct Battle: Equatable, Hashable {
    static func ==(lhs: Battle, rhs: Battle) -> Bool {
        lhs.attacker == rhs.attacker && lhs.defender == rhs.defender
    }
    
    let attacker: PokemonType
    let defender: PokemonType
    
    var attackerEffectivity: Double? {
        Self.effectivityDictionary[self]?.effectivityAmount
    }
    
    static let effectivityDictionary: [Battle: Effectivity] = [
        Battle(attacker: .water, defender: .water): .notTooEffective,
        Battle(attacker: .water, defender: .fire): .superEffective,
        Battle(attacker: .water, defender: .plant): .notTooEffective,
        Battle(attacker: .water, defender: .electric): .neutral,
        
        Battle(attacker: .fire, defender: .water): .notTooEffective,
        Battle(attacker: .fire, defender: .fire): .notTooEffective,
        Battle(attacker: .fire, defender: .plant): .superEffective,
        Battle(attacker: .fire, defender: .electric): .neutral,
        
        Battle(attacker: .plant, defender: .water): .superEffective,
        Battle(attacker: .plant, defender: .fire): .notTooEffective,
        Battle(attacker: .plant, defender: .plant): .notTooEffective,
        Battle(attacker: .plant, defender: .electric): .neutral,
        
        Battle(attacker: .electric, defender: .water): .superEffective,
        Battle(attacker: .electric, defender: .fire): .neutral,
        Battle(attacker: .electric, defender: .plant): .notTooEffective,
        Battle(attacker: .electric, defender: .electric): .notTooEffective,
    ]
}

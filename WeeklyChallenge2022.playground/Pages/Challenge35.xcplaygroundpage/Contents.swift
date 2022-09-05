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

enum PokemonType {
    case electric
    case fire
    case plant
    case water
    
    func getEffectivity(opponent: PokemonType) -> Double {
        switch(self) {
        case .electric: switch(opponent) {
            case .electric: return 0.5
            case .fire: return 1.0
            case .plant: return 0.5
            case .water: return 2.0
            }
        case .fire: switch(opponent) {
            case .electric: return 1.0
            case .fire: return 0.5
            case .plant: return 2.0
            case .water: return 0.5
            }
        case .plant: switch(opponent) {
            case .electric: return 1.0
            case .fire: return 0.5
            case .plant: return 0.5
            case .water: return 2.0
            }
        case .water: switch(opponent) {
            case .electric: return 1.0
            case .fire: return 2.0
            case .plant: return 0.5
            case .water: return 0.5
            }
        }
    }
}

func getAttackDamage(attacker: PokemonType, defender: PokemonType, attack: Int, defence: Int) -> String {
    if(attack < 1 || attack > 100) {
        return "El ataque no tiene un valor correcto"
    } else if(defence < 1 || defence > 100) {
        return "La defensa no tiene un valor correcto"
    } else {
        return "El daño de la pelea es \(50.0 * (Double(attack) / Double(defence)) * attacker.getEffectivity(opponent: defender))"
    }
}

print(getAttackDamage(attacker: PokemonType.fire, defender: PokemonType.plant, attack: 30, defence: 60))

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

enum PokemonType: String {
    case water = "Agua"
    case fire = "Fuego"
    case grass = "Planta"
    case electric = "Eléctrico"
}

struct PokemonChart {
    let effective: PokemonType
    let notEffective: PokemonType
}

func battle(attacker: PokemonType, defender: PokemonType, attack: Int, defense: Int) -> Double? {

    if attack <= 0 || attack > 100 || defense <= 0 || defense > 100 {
        print("El ataque o la defensa contiene un valor incorrecto")
        return nil
    }

    let typeChart: [PokemonType:PokemonChart] = [
        .water:PokemonChart(effective: .fire, notEffective: .grass),
        .fire:PokemonChart(effective: .grass, notEffective: .water),
        .grass:PokemonChart(effective: .water, notEffective: .fire),
        .electric:PokemonChart(effective: .water, notEffective: .grass)]


    var effectivity = 1.0
    if attacker == defender || typeChart[attacker]!.notEffective  == defender {
        effectivity = 0.5
        print("No es muy efectivo")
    } else if typeChart[attacker]!.effective  == defender {
        effectivity = 2.0
        print("Es súper efectivo")
    } else {
        print("Es neutro")
    }

    return 50 * Double(attack) / Double(defense) * effectivity
}

print(battle(attacker: .water, defender: .fire, attack: 50, defense: 30) ?? "Error")
print(battle(attacker: .water, defender: .fire, attack: 101, defense: -10) ?? "Error")
print(battle(attacker: .fire, defender: .water, attack: 50, defense: 30) ?? "Error")
print(battle(attacker: .fire, defender: .fire, attack: 50, defense: 30) ?? "Error")
print(battle(attacker: .grass, defender: .electric, attack: 30, defense: 50) ?? "Error")

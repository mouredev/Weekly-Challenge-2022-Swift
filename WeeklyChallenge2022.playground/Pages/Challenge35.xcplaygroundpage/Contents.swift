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


enum TipoPokemon {
    case agua
    case fuego
    case planta
    case electrico
}

struct PokemonRanking {
    let efectivo: TipoPokemon
    let noEfectivo: TipoPokemon
}

func batalla(atacante: TipoPokemon, defensor: TipoPokemon, ataque: Int,  defensa: Int) -> Double? {
    
    if ataque <= 0 || ataque > 100 || defensa <= 0 || defensa > 100 {
        print("El ataque o la defensa contiene un valor incorrecto")
        return nil
    }
    
    let ranking: [TipoPokemon : PokemonRanking] = [
        TipoPokemon.agua : PokemonRanking(efectivo: .fuego, noEfectivo: .planta),
        TipoPokemon.fuego : PokemonRanking(efectivo: .planta, noEfectivo: .agua),
        TipoPokemon.planta : PokemonRanking(efectivo: .agua, noEfectivo: .fuego),
        TipoPokemon.electrico : PokemonRanking(efectivo: .agua, noEfectivo: .planta),
    ]
    
    var efectividad = 1.0
    if atacante == defensor || ranking[atacante]?.noEfectivo == defensor {
        efectividad = 0.5
        print("No es muy efectivo")
    } else if ranking[atacante]?.efectivo == defensor {
        efectividad = 2.0
        print("Es super efectivo")
    } else {
        print("Es neutro")
    }
    
    return 50 * Double(ataque) / Double(defensa) * efectividad
    
}

print((batalla(atacante: .agua, defensor: .fuego, ataque: 50, defensa: 30)) ?? "Error")
print((batalla(atacante: .fuego, defensor: .agua, ataque: 50, defensa: 30)) ?? "Error")
print((batalla(atacante: .planta, defensor: .electrico, ataque: 50, defensa: 30)) ?? "Error")
print((batalla(atacante: .electrico, defensor: .planta, ataque: 50, defensa: 30)) ?? "Error")

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
    Fuego = "Fuego",
    Agua = "Agua",
    Electicidad = "Electicidad",
    Planta = "Planta",
}
type Efectividad = {
    [key in PokemonType]: number;
};

type map = {
    [key in PokemonType]: Efectividad;
};


const TABLADEEFECTIVIDAD: map = {
    [PokemonType.Fuego]: {
        [PokemonType.Fuego]: 0.5,
        [PokemonType.Agua]: 0.5,
        [PokemonType.Electicidad]: 1,
        [PokemonType.Planta]: 2
    },
    [PokemonType.Agua]: {
        [PokemonType.Fuego]: 2,
        [PokemonType.Agua]: 0.5,
        [PokemonType.Electicidad]: 0.5,
        [PokemonType.Planta]: 0.5
    },
    [PokemonType.Electicidad]: {
        [PokemonType.Fuego]: 1,
        [PokemonType.Agua]: 2,
        [PokemonType.Electicidad]: 0.5,
        [PokemonType.Planta]: 1
    },
    [PokemonType.Planta]: {
        [PokemonType.Fuego]: 0.5,
        [PokemonType.Agua]: 2,
        [PokemonType.Electicidad]: 1,
        [PokemonType.Planta]: 0.5
    },
}

function Batalla(atacante: PokemonType, defensor: PokemonType, daño: number, defenza: number): number {
    if ((daño > 100 || daño < 1) || (defenza > 100 || defenza < 1)) {
        throw new DOMException("El daño y la defenza debe de estar entre 1 y 100");
    }
    let dañoTotal: number;
    dañoTotal = 50 * (daño / defenza) * TABLADEEFECTIVIDAD[atacante][defensor];
    return dañoTotal;
}

console.log(Batalla(PokemonType.Agua, PokemonType.Fuego, 20, 50));
console.log(Batalla(PokemonType.Agua, PokemonType.Agua, 1, 50));
console.log(Batalla(PokemonType.Planta, PokemonType.Electicidad, 1, 25));

try {
    console.log(Batalla(PokemonType.Agua, PokemonType.Fuego, 0, 50));
    console.log(Batalla(PokemonType.Agua, PokemonType.Fuego, 20, 0));
} catch (error) {
    console.log(error)
}

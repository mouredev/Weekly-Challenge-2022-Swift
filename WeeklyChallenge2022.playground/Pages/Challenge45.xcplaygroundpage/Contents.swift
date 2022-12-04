import Foundation

/*
 * Reto #45
 * CONTENEDOR DE AGUA
 * Fecha publicación enunciado: 07/10/22
 * Fecha publicación resolución: 14/11/22
 * Dificultad: MEDIA
 *
 * Enunciado: Dado un array de números enteros positivos, donde cada uno representa unidades
 * de bloques apilados, debemos calcular cuantas unidades de agua quedarán atrapadas entre ellos.
 *
 * - Ejemplo: Dado el array [4, 0, 3, 6, 1, 3].
 *
 *        ⏹
 *        ⏹
 *   ⏹💧💧⏹
 *   ⏹💧⏹⏹💧⏹
 *   ⏹💧⏹⏹💧⏹
 *   ⏹💧⏹⏹⏹⏹
 *
 *   Representando bloque con ⏹︎ y agua con 💧, quedarán atrapadas 7 unidades de agua.
 *   Suponemos que existe un suelo impermeable en la parte inferior que retiene el agua.
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal"
 *   para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en
 *   https://retosdeprogramacion.com/semanales2022.
 *
 */

func calculateWaterUnits(container: [Int]) -> Int {

    var units = 0
    var wall = 0
    var nextWall = 0
    
    container.enumerated().forEach { (index, blocks) in

        if (blocks < 0) {
            return
        }

        if index != container.count - 1 && (index == 0 || nextWall == blocks) {

            wall = index == 0 ? blocks : nextWall

            nextWall = 0
            for nextBlocksIndex in index + 1 ..< container.count {
                if container[nextBlocksIndex] >= nextWall && wall >= nextWall {
                    nextWall = container[nextBlocksIndex]
                }
            }
        } else {
            let referenceWall = nextWall > wall ? wall : nextWall
            let currentBlocks = referenceWall - blocks
            units += currentBlocks >= 0 ? currentBlocks : 0
        }
    }

    return units
}

print(calculateWaterUnits(container: [4, 0, 3, 6]))
print(calculateWaterUnits(container: [4, 0, 3, 6, 1, 3]))
print(calculateWaterUnits(container: [5, 4, 3, 2, 1, 0]))
print(calculateWaterUnits(container: [0, 1, 2, 3, 4, 5]))
print(calculateWaterUnits(container: [4, 0, 3, 6, 1, 3, 0, 1, 6]))

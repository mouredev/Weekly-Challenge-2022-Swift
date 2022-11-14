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

func getWaterUnits(input: [Int], draw: Bool = true) -> Int {
    var result = 0
    let numRows = input.max() ?? 0
    (0..<numRows).forEach { row in
        var line = ""
        var previousBlockColumn = -1
        (0..<input.count).forEach { column in
            if(numRows - row <= input[column]) {
                (previousBlockColumn+1..<column).forEach { _ in
                    if(previousBlockColumn == -1) {
                        line.append("➖")
                    } else {
                        line.append("💧")
                        result += 1
                    }
                }
                line.append("⏹")
                previousBlockColumn = column
            }
        }
        (line.count..<input.count).forEach { _ in
            line.append("➖")
        }
        if(draw) {
            print(line)
        }
    }
    return result
}

print(getWaterUnits(input: []))
print(getWaterUnits(input: [1, 2, 3, 3, 2, 1]))
print(getWaterUnits(input: [4, 3, 1, 1, 3, 4]))
print(getWaterUnits(input: [4, 0, 3, 6, 1, 3]))

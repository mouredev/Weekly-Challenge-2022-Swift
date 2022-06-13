import Foundation

/*
 * Reto #23
 * MÁXIMO COMÚN DIVISOR Y MÍNIMO COMÚN MÚLTIPLO
 * Fecha publicación enunciado: 07/06/22
 * Fecha publicación resolución: 13/06/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea dos funciones, una que calcule el máximo común divisor (MCD) y otra que calcule el mínimo común múltiplo (mcm) de dos números enteros.
 * - No se pueden utilizar operaciones del lenguaje que lo resuelvan directamente.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

func mcm(_ number1: Int, _ number2: Int) -> Int {
    var max = number1 > number2 ? number1 : number2
    var min = number1 < number2 ? number1 : number2
    let incrementMax = max
    let incrementMin = min
    
    while(max != min) {
        if (max < min) { max += incrementMax }
        else { min += incrementMin }
    }
    
    return min
}

func mcd(_ number1: Int, _ number2: Int) -> Int {
    let min = number1 < number2 ? number1 : number2
    var mcd = 1
    
    for i in (1...min).reversed() {
        if ((number1%i == 0) && (number2%i == 0)) {
            mcd = i
            break
        }
    }
    
    return mcd
}

print(mcm(5, 8))
print(mcd(1203, 345))

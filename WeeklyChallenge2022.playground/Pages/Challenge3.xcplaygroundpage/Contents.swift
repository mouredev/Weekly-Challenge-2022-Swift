import Foundation
import Darwin

/*
 * Reto #3
 * ¿ES UN NÚMERO PRIMO?
 * Fecha publicación enunciado: 17/01/22
 * Fecha publicación resolución: 24/01/22
 * Dificultad: MEDIA
 *
 * Enunciado: Escribe un programa que se encargue de comprobar si un número es o no primo.
 * Hecho esto, imprime los números primos entre 1 y 100.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda la acomunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

var numeroPrimos: [Int] = []
var num = 2
for i in 2 ... 100 {
    if ((i == 2) || (i == 3) || (i == 5) || (i == 7))
    {
        numeroPrimos.append(i)
    }
    else if (((i % 2) != 0)) && (((i % 3) != 0)) && (((i % 5) != 0)) && (((i % 7) != 0))
    {
        numeroPrimos.append(i)
    }
    if (i > 100){
        break
    }
}
print(numeroPrimos)

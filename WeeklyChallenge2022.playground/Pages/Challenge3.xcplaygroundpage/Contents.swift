import Foundation

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
import Foundation

//ALGORITMO BASADO EN LA CRIBA DE ERATÓSTENES

var numPrimos: [Int] = []
var num = 2

while (num < 100)
{
    if (((num % 2) != 0) || (num == 2))  && (((num % 3) != 0) || (num == 3)) && (((num % 5) != 0) || (num == 5)) && (((num % 7) != 0) || (num == 7))
     {
         numPrimos.append(num)
     }
    num += 1
}
print(numPrimos)

import Foundation

/*
 * Reto #1
 * ¿ES UN ANAGRAMA?
 * Fecha publicación enunciado: 03/01/22
 * Fecha publicación resolución: 10/01/22
 * Dificultad: MEDIA
 *
 * Enunciado: Escribe una función que reciba dos palabras (String) y retorne verdadero o falso (Bool) según sean o no anagramas.
 * Un Anagrama consiste en formar una palabra reordenando TODAS las letras de otra palabra inicial.
 * NO hace falta comprobar que ambas palabras existan.
 * Dos palabras exactamente iguales no son anagrama.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🗓reto-semanal" para preguntas, dudas o prestar ayuda la acomunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

print("Introduce la primera palabra")
var palabra1 = readLine()!
var p1 = palabra1
print("Introduce la segunda palabra")
var palabra2 = readLine()!
var p2 = palabra2

print((palabra1.count == palabra2.count) ?
     ((palabra1 != palabra2) ?
     (String(Array(palabra1.uppercased()).sorted()) == String(Array(palabra2.uppercased()).sorted()) ?
      "LA PALABRA " + p2 + " ES UN ANAGRAMA DE " + p1
     : "LA PALABRA " + p2 + " NO ES UN ANAGRAMA DE " + p1 + " PORQUE NO CONTIENE LOS MISMOS CARACTERES")
     : "LA PALABRA " + p2 + " NO ES UN ANAGRAMA DE " + p1 + " YA QUE SON LA MISMA PALABRA")
     : "LA PALABRA " + p2 + " NO ES UN ANAGRAMA DE " + p1 + " YA QUE SON DE DIFERENTE TAMAÑO")

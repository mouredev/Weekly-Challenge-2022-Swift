import Foundation

/*
 * Reto #0
 * EL FAMOSO "FIZZ BUZZ"
 * Fecha publicación enunciado: 27/12/21
 * Fecha publicación resolución: 03/01/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Escribe un programa en Swift que muestre por consola (con un print) los números de 1 a 100 (ambos incluidos y con un salto de línea entre cada impresión), sustituyendo los siguientes:
 * - Múltiplos de 3 por la palabra "fizz".
 * - Múltiplos de 5 por la palabra "buzz".
 * - Múltiplos de 3 y de 5 a la vez por la palabra "fizzbuzz".
 *
 * Resuelto: Sí
 " Iteracciones: 1
 * Explicación: El código utiliza un bucle for para recorrer los números del 1 al 100. Para cada número, se comprueba si es múltiplo de 3 y de 5, de 3 o de 5, y se imprime el número sustituido por la palabra correspondiente, o bien se imprime el número sin modificar si no es múltiplo de ninguno de los dos números.
 *
 */

for number in 1...100 {
    if number % 3 == 0 && number % 5 == 0 {
        // El número es múltiplo de 3 y de 5
        print("fizzbuzz")
    } else if number % 3 == 0 {
        // El número es múltiplo de 3
        print("fizz")
    } else if number % 5 == 0 {
        // El número es múltiplo de 5
        print("buzz")
    } else {
        // El número no es múltiplo ni de 3 ni de 5
        print(number)
    }
}

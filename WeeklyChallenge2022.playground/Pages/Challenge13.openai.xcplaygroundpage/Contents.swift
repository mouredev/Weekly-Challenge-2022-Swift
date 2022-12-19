import Foundation

/*
 * Reto #13
 * FACTORIAL RECURSIVO
 * Fecha publicación enunciado: 28/03/22
 * Fecha publicación resolución: 04/04/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Escribe una función en Swift que calcule y retorne el factorial de un número dado de forma recursiva.
 *
 * Resuelto: Sí
 * Iteracciones: 2
 * Explicación: La función recibe un entero n y retorna su factorial. Si el número dado es 0, el factorial es 1. Si el número es mayor que 0, se llama recursivamente a la función pasando como argumento n - 1 y se retorna el resultado de multiplicar n por el factorial de n - 1.
 * Conversación:
 * - Evita que falle si se le pasa un número entero negativo como parámetro
 *
 */

func factorial(n: Int) -> Int {
    if n < 0 {
        // Si n es un número entero negativo, se retorna -1 para indicar que no se puede calcular el factorial
        return -1
    } else if n == 0 {
        return 1
    } else {
        return n * factorial(n: n - 1)
    }
}

// Brais cases
print(factorial(n: 0) == -1 ? "No tiene factorial" : factorial(n: 0))   // 1
print(factorial(n: 7) == -1 ? "No tiene factorial" : factorial(n: 7))   // 5040
print(factorial(n: 1) == -1 ? "No tiene factorial" : factorial(n: 1))   // 1
print(factorial(n: -1) == -1 ? "No tiene factorial" : factorial(n: -1)) // No tiene factorial

// Jaime case
let number = 5
print("\(number)! = \(factorial(n: number))")   // 120

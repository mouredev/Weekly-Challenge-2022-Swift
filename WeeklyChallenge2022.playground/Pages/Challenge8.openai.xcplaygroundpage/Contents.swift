import Foundation

/*
 * Reto #8
 * DECIMAL A BINARIO
 * Fecha publicación enunciado: 18/02/22
 * Fecha publicación resolución: 02/03/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea un programa en Swift que se encargue de transformar un número decimal a binario sin utilizar funciones propias del lenguaje que lo hagan directamente.
 *
 * Resuelto: Sí
 " Iteracciones: 3
 * Explicación: Para transformar un número decimal a binario en Swift, puedes utilizar un algoritmo de división sucesiva.
 En este ejemplo, la función decimalToBinary toma un número entero y lo divide repetidamente entre 2, agregando el residuo de cada división al resultado. Una vez que el número se ha dividido hasta llegar a 0, se devuelve el resultado como una cadena de caracteres.
 * Conversación:
 * - El código intenta cambiar el valor del parámetro number que es inmutable
 * - Para el caso del número 0 devuelve un resultado vacío, en lugar de 0
 *
 */

// Declara una función que recibe un número entero y lo convierte a binario
func decimalToBinary(_ number: Int) -> String {
  // Crea una variable local para almacenar el número
  var localNumber = number

  // Crea una variable para almacenar el resultado
  var binary = ""

  // Si el número es 0, devuelve 0
  if number == 0 {
    return "0"
  }
    
  // Repite hasta que el número sea 0
  while localNumber != 0 {
    // Agrega el residuo de la división del número entre 2 al resultado
    binary = String(localNumber % 2) + binary

    // Divide el número entre 2
    localNumber /= 2
  }

  // Devuelve el resultado
  return binary
}

// Prueba la función convirtiendo algunos números decimales a binarios
print(decimalToBinary(0))    // 0
print(decimalToBinary(1))    // 1
print(decimalToBinary(2))    // 10
print(decimalToBinary(3))    // 11
print(decimalToBinary(4))    // 100
print(decimalToBinary(5))    // 101

// Brais cases
print(decimalToBinary(387)) //110000011

// Jaime cases
print(decimalToBinary(1024))//10000000000
print(decimalToBinary(432)) //110110000
print(decimalToBinary(79))  //1001111
print(decimalToBinary(25))  //11001

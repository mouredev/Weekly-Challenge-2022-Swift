import Foundation

/*
 * Reto #2
 * LA SUCESIÓN DE FIBONACCI
 * Fecha publicación enunciado: 10/01/22
 * Fecha publicación resolución: 17/01/22
 * Dificultad: DIFÍCIL
 *
 * Enunciado: Escribe un programa en Swift que imprima los 50 primeros números de la sucesión de Fibonacci empezando en 0.
 *
 * Resuelto: Sí
 " Iteracciones: 2
 * Explicación: La sucesión de Fibonacci se define recursivamente. El primer número es 0 y el segundo es 1. A partir de ahí, cada número es la suma de los dos números anteriores. Por lo tanto, el tercer número es 0 + 1 = 1, el cuarto es 1 + 1 = 2, el quinto es 1 + 2 = 3, y así sucesivamente.
   El código anterior utiliza una función fibonacci que implementa esta definición recursiva. Luego, usa un bucle for para imprimir los 50 primeros números de la sucesión.
 * Conversación:
 * - Funciona pero tarda bastante, ¿cómo sería de una forma más eficiente?
 * - Ahora es mucho más rápido pero devuelve 51 valores
 * Nota: explica el motivo de la mejora en eficiencia entre una versión y otra.
 *
 */

var memo: [Int: Int] = [:]

func fibonacci(_ n: Int) -> Int {
  if n == 0 {
    return 0
  } else if n == 1 {
    return 1
  } else if let value = memo[n] {
    return value
  } else {
    let value = fibonacci(n - 1) + fibonacci(n - 2)
    memo[n] = value
    return value
  }
}

for i in 0...49 {
  print(fibonacci(i))
}

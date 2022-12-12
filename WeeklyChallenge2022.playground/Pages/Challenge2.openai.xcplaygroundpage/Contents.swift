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
 * Resuelto: Sí, pero poco eficiente en la primera versión. La segunda es inmediata.
 * Explicación:
 * · La sucesión de Fibonacci se define recursivamente. El primer número es 0 y el segundo es 1. A partir de ahí, cada número es la suma de los dos números anteriores. Por lo tanto, el tercer número es 0 + 1 = 1, el cuarto es 1 + 1 = 2, el quinto es 1 + 2 = 3, y así sucesivamente.
 * · El código anterior utiliza una función fibonacci que implementa esta definición recursiva. Luego, usa un bucle for para imprimir los 50 primeros números de la sucesión.
 * Conversación:
 * - Funciona pero tarda bastante, ¿cómo sería de una forma más eficiente?
 * + La implementación anterior tiene una complejidad computacional exponencial, lo que significa que el tiempo que tarda en ejecutarse aumenta muy rápidamente a medida que se aumenta el valor de n. Esto se debe a que, para cada número en la sucesión, la función fibonacci se llama a sí misma dos veces.
 * + Una forma de hacer que el código sea más eficiente es utilizar una técnica llamada memorización, que consiste en almacenar los valores calculados previamente en una tabla (o un diccionario) para que no tengamos que volver a calcularlos. De esta manera, podemos ahorrar muchas llamadas recursivas y reducir significativamente el tiempo de ejecución.
 * + En este código, la función fibonacci verifica primero si el valor de n se encuentra en la tabla memo. Si es así, devuelve el valor almacenado en la tabla en lugar de calcularlo de nuevo. Si no se encuentra en la tabla, se calcula el valor de la manera habitual y se almacena en la tabla para futuros usos.
 * - Ahora es mucho más rápido pero devuelve 51 valores
 * + Sí, tienes razón. El código que te he proporcionado anteriormente imprime 51 números en lugar de 50, ya que el bucle for cuenta desde 0 hasta 50, incluyendo ambos extremos.
 * + Para solucionar este problema, basta con modificar el bucle para que cuente hasta 49 en lugar de 50.
 * + De esta manera, la función solo tiene que calcular cada número de la sucesión una vez, lo que reduce significativamente el tiempo de ejecución.
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

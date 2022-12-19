import Foundation

/*
 * Reto #4
 * ÁREA DE UN POLÍGONO
 * Fecha publicación enunciado: 24/01/22
 * Fecha publicación resolución: 31/01/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea UNA ÚNICA FUNCIÓN en Swift (importante que sólo sea una) que sea capaz de calcular y retornar el área de un polígono.
 * - La función recibirá por parámetro sólo UN polígono a la vez.
 * - Los polígonos soportados serán Triángulo, Cuadrado y Rectángulo.
 * - Imprime el cálculo del área de un polígono de cada tipo.
 *
 * Resuelto: Sí.
 " Iteracciones: 2
 * Explicación: En este ejemplo, la función area recibe como parámetros una cadena que indica el tipo de polígono (triángulo, cuadrado o rectángulo) y dos números enteros que representan los lados del polígono. La función calcula y retorna el área del polígono, utilizando la fórmula correspondiente según el tipo de polígono que se le haya pasado.
 * Conversación:
 * - Los polígonos Cuadrado y Rectángulo tienen la misma fórmula, ¿podrían estar en el mismo case del switch?
 *
 */

func area(poligono: String, lado1: Int, lado2: Int) -> Int {
  switch poligono {
    case "triangulo":
      return (lado1 * lado2) / 2
    case "cuadrado":
      return lado1 * lado1
    case "rectangulo":
      return lado1 * lado2
    default:
      return 0
  }
}

print(area(poligono: "triangulo", lado1: 5, lado2: 10)) // Imprime 25
print(area(poligono: "cuadrado", lado1: 5, lado2: 0)) // Imprime 25
print(area(poligono: "rectangulo", lado1: 5, lado2: 10)) // Imprime 50

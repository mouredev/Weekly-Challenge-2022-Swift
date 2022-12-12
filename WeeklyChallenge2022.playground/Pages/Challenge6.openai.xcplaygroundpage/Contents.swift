import Foundation

/*
 * Reto #6
 * INVIRTIENDO CADENAS
 * Fecha publicación enunciado: 07/02/22
 * Fecha publicación resolución: 14/02/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea un programa que invierta el orden de una cadena de texto sin usar funciones propias del lenguaje que lo hagan de forma automática.
 * - Si le pasamos "Hola mundo" nos retornaría "odnum aloH"
 *
 * Resuelto: Sí. Pero hay que aclararle que no utilice funciones del sistema.
 * Explicación:
 * · Para crear un programa en Swift que invierta el orden de una cadena de texto sin usar funciones propias del lenguaje que lo hagan de forma automática, podemos utilizar un ciclo for y la propiedad .reversed() de las secuencias de caracteres de Swift.
 * Conversación:
 * - Pero al utilizar la función reversed() no cumplimos con el enunciado.
 * + Tienes razón, si utilizamos la función reversed() del lenguaje Swift no cumplimos con el enunciado, ya que no estamos implementando la lógica para invertir la cadena de forma manual.
 * + En lugar de usar reversed(), podemos utilizar un ciclo for que recorra la cadena de forma inversa utilizando el índice de los caracteres. De esta forma, podemos ir agregando cada caracter a una nueva variable, que al final del ciclo contendrá la cadena original pero invertida.
 * - ¿Y cómo sería la implementación de la función invertirCadena de forma recursiva?
 * + La implementación de la función invertirCadena de forma recursiva podría ser similar a la que te mostré en la respuesta anterior, pero en lugar de usar un ciclo for, utilizaríamos la recursividad para ir agregando cada caracter a la cadena invertida.
 * + La idea es que en cada llamada recursiva, se extraiga el último caracter de la cadena y se concatene al principio de la cadena invertida, hasta que no queden caracteres en la cadena original.
 *
 */

// Creamos una función que toma como parámetro una cadena de texto y la retorna invertida
func invertirCadena(cadena: String) -> String {
  // Creamos una variable que almacenará la cadena invertida
  var cadenaInvertida = ""

  // Recorremos la cadena original desde el último caracter hasta el primero
  for i in stride(from: cadena.count - 1, through: 0, by: -1) {
    // Agregamos cada caracter a la cadena invertida
    cadenaInvertida.append(cadena[cadena.index(cadena.startIndex, offsetBy: i)])
  }

  // Retornamos la cadena invertida
  return cadenaInvertida
}

// Creamos una variable que contiene la cadena que queremos invertir
let cadenaOriginal = "Hola mundo"

// Invertimos la cadena y almacenamos el resultado en otra variable
var cadenaInvertida = invertirCadena(cadena: cadenaOriginal)

// Imprimimos la cadena invertida en la consola
print(cadenaInvertida) // debería imprimir "odnum aloH"

// Creamos una función que toma como parámetro una cadena de texto y la retorna invertida
func invertirCadenaRecurvisamente(cadena: String) -> String {
  // Si la cadena tiene 0 o 1 caracter, retornamos la cadena tal cual
  if cadena.count <= 1 {
    return cadena
  }

  // Extraemos el último caracter de la cadena
  let ultimoCaracter = cadena[cadena.index(before: cadena.endIndex)]

  // Invocamos la función recursivamente, pero quitando el último caracter de la cadena
  let cadenaSinUltimoCaracter = cadena[cadena.startIndex..<cadena.index(before: cadena.endIndex)]
  let cadenaInvertida = invertirCadenaRecurvisamente(cadena: String(cadenaSinUltimoCaracter))

  // Agregamos el último caracter al principio de la cadena invertida y retornamos el resultado
  return String(ultimoCaracter) + cadenaInvertida
}

// Invertimos la cadena y almacenamos el resultado en otra variable
cadenaInvertida = invertirCadenaRecurvisamente(cadena: cadenaOriginal)

// Imprimimos la cadena invertida en la consola
print(cadenaInvertida) // debería imprimir "odnum aloH"

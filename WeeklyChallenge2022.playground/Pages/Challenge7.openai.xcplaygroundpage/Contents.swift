import Foundation

/*
 * Reto #7
 * CONTANDO PALABRAS
 * Fecha publicación enunciado: 14/02/22
 * Fecha publicación resolución: 21/02/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea un programa en Swift que cuente cuantas veces se repite cada palabra y que muestre el recuento final de todas ellas.
 * - Los signos de puntuación no forman parte de la palabra.
 * - Una palabra es la misma aunque aparezca en mayúsculas y minúsculas.
 * - No se pueden utilizar funciones propias del lenguaje que lo resuelvan automáticamente.
 *
 * Resuelto: Sí
 * Explicación:
 * · Este programa toma una cadena de texto ingresada por el usuario, divide la cadena en un array de palabras, luego recorre el array y cuenta cuántas veces aparece cada palabra en el texto. Finalmente, muestra el recuento de cada palabra.
 * Conversación:
 * -
 *
 */

let texto = "Hola, mi nombre es brais. Mi nombre completo es Brais Moure (MoureDev)."
//let texto = "Hola Brais, yo no me llamo brais."

// Creamos un diccionario vacío para almacenar las palabras y sus contadores
var contadores = [String: Int]()

// Dividimos la cadena de texto en un array de palabras
let palabras = texto.components(separatedBy: .whitespacesAndNewlines)

// Recorremos el array de palabras y actualizamos el contador en el diccionario
// para cada palabra
for palabra in palabras {
  // Quitamos los signos de puntuación de la palabra
  let sinPuntuacion = palabra.trimmingCharacters(in: .punctuationCharacters)

  // Convertimos la palabra a minúsculas para que no se distingan mayúsculas
  // y minúsculas
  let palabraLimpia = sinPuntuacion.lowercased()

  // Verificamos si la palabra ya está en el diccionario
  if let contador = contadores[palabraLimpia] {
    // Si ya existe, incrementamos su contador
    contadores[palabraLimpia] = contador + 1
  } else {
    // Si no existe, la agregamos al diccionario con contador 1
    contadores[palabraLimpia] = 1
  }
}

// Recorremos el diccionario y mostramos el recuento de cada palabra
for (palabra, contador) in contadores {
  print("La palabra '\(palabra)' se repite \(contador) veces")
}

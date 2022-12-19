import Foundation

/*
 * Reto #12
 * ¿ES UN PALÍNDROMO?
 * Fecha publicación enunciado: 21/03/22
 * Fecha publicación resolución: 28/03/22
 * Dificultad: MEDIA
 *
 * Enunciado: Escribe una función en Swift que reciba un texto y retorne verdadero o falso (Boolean) según sean o no palíndromos.
 * Un Palíndromo es una palabra o expresión que es igual si se lee de izquierda a derecha que de derecha a izquierda.
 * NO se tienen en cuenta los espacios, signos de puntuación y tildes.
 * Ejemplo: Ana lleva al oso la avellana.
 *
 * Resuelto: Sí
 * Iteracciones: 1
 * Explicación:
 *
 */

func esPalindromo(_ texto: String) -> Bool {
  // Convertimos el texto a minúsculas y eliminamos los espacios, signos de puntuación y tildes
  let sinEspacios = texto.lowercased().replacingOccurrences(of: " ", with: "")
  let sinSignos = sinEspacios.components(separatedBy: CharacterSet.punctuationCharacters)
                            .joined()
  let sinTildes = sinSignos.folding(options: .diacriticInsensitive, locale: .current)

  // Invertimos el texto
  let invertido = String(sinTildes.reversed())

  // Devolvemos true si el texto original es igual al texto invertido
  return sinTildes == invertido
}

print(esPalindromo("Ana lleva al oso la avellana.")) // Imprime "true"

// Brais cases
print(esPalindromo("Adivina ya te opina, ya ni miles origina, ya ni cetro me domina, ya ni monarcas, a repaso ni mulato carreta, acaso nicotina, ya ni cita vecino, anima cocina, pedazo gallina, cedazo terso nos retoza de canilla goza, de pánico camina, ónice vaticina, ya ni tocino saca, a terracota luminosa pera, sacra nómina y ánimo de mortecina, ya ni giros elimina, ya ni poeta, ya ni vida")) // Imprime "true"
print(esPalindromo("¿Qué os ha parecido el reto?"))   // Imprime "false"

// Jaime cases
print(esPalindromo("Allí ves Sevilla"))   // Imprime "true"

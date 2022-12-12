import Foundation

/*
 * Reto #9
 * CÓDIGO MORSE
 * Fecha publicación enunciado: 02/03/22
 * Fecha publicación resolución: 07/03/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea un programa en Swift que sea capaz de transformar texto natural a código morse y viceversa.
 * — Debe detectar automáticamente de qué tipo se trata y realizar la conversión.
 * — En morse se soporta raya "—", punto ".", un espacio " " entre letras o símbolos y dos espacios entre palabras "  ".
 * — El alfabeto morse soportado será el mostrado en https://es.wikipedia.org/wiki/Código_morse.
 *
 * Resuelto: Sí. En 2 iteracciones.
 * Explicación:
 * · Para crear este programa en Swift, podemos utilizar el diccionario de código morse para convertir un texto a morse y viceversa. Primero, definimos el diccionario como una estructura de datos de tipo [String: String]
 * · Luego, podemos crear una función que tome una cadena de texto como entrada y devuelva la cadena convertida a morse o a texto según sea necesario.
 * · Para convertir de morse a texto, podemos usar una función similar, pero en lugar de iterar sobre los caracteres de la cadena de texto, iteramos sobre las palabras en la cadena de morse.
 * · Para detectar automáticamente si la cadena de entrada es texto o morse, podemos utilizar una expresión regular para verificar si la cadena contiene sólo puntos y rayas. Si la cadena contiene sólo puntos y rayas, entonces es morse, de lo contrario es texto.
 * Conversación:
 * — En el alfabeto faltan equivalencias para la letra CH, para paréntesis, para símbolos de puntuación, de exclamación y de interrogación. Complétalo añadiendo todos los símbolos que se te ocurran
 * + Para añadir las equivalencias de los símbolos que faltan, simplemente debemos agregarlas al diccionario que creamos al principio del código. Con esto debería ser suficiente para que la función convertToMorse() pueda realizar correctamente la conversión tanto de texto a código morse como viceversa.
 *
 */

// Creamos un diccionario que contenga las letras del alfabeto y los símbolos que mencionas, junto con su equivalente en código morse
let morseAlphabet: [String: String] = [
    "A": "·—",
    "B": "—···",
    "C": "—·—·",
    "D": "—··",
    "E": "·",
    "F": "··—·",
    "G": "——·",
    "H": "····",
    "I": "··",
    "J": "·———",
    "K": "—·—",
    "L": "·—··",
    "M": "——",
    "N": "—·",
    "O": "———",
    "P": "·——·",
    "Q": "——·—",
    "R": "·—·",
    "S": "···",
    "T": "—",
    "U": "··—",
    "V": "···—",
    "W": "·——",
    "X": "—··—",
    "Y": "—·——",
    "Z": "——··",
    "1": "·————",
    "2": "··———",
    "3": "···——",
    "4": "····—",
    "5": "·····",
    "6": "—····",
    "7": "——···",
    "8": "———··",
    "9": "————·",
    "0": "—————",
    "CH": "————",
    "(": "—·——·",
    ")": "—·——·—",
    ":": "———···",
    ",": "——··——",
    "=": "—···—",
    "?": "··——··",
    "'": "·————·",
    "/": "—··—·",
    "!": "—·—·——",
    ".": "·—·—·—",
    "—": "—····—",
    "+": "·—·—·",
    "@": "·——·—·"
]

func convertToMorse(text: String) -> String {
  var morse = ""
  // Iteramos sobre cada caracter de la cadena de texto
  for char in text {
    // Convertimos el caracter a mayúsculas para que la búsqueda en el diccionario funcione correctamente
    let upperChar = String(char).uppercased()
    // Si el caracter está en el diccionario, lo agregamos a la cadena de morse
    if let code = morseAlphabet[upperChar] {
      morse += code + " "
    }
  }
  // Devolvemos la cadena de morse sin el último espacio
  return String(morse.dropLast())
}

func convertToText(morse: String) -> String {
  var text = ""
  // Separamos la cadena de morse en palabras utilizando el espacio como separador
  let words = morse.components(separatedBy: "  ")
  // Iteramos sobre cada palabra
  for word in words {
    // Separamos la palabra en caracteres utilizando el espacio como separador
    let chars = word.components(separatedBy: " ")
    // Iteramos sobre cada caracter
    for char in chars {
      // Buscamos el código morse en el diccionario
      if let letter = morseAlphabet.first(where: { $0.value == char })?.key {
        // Si lo encontramos, lo agregamos a la cadena de texto
        text += letter
      }
    }
    // Agregamos un espacio después de cada palabra
    text += " "
  }
  // Devolvemos la cadena de texto sin el último espacio
  return String(text.dropLast())
}

func convert(input: String) -> String {
  // Verificamos si la cadena contiene sólo puntos y rayas
  let morseRegex = try! NSRegularExpression(pattern: "^[\\·\\—\\s]+$")
  let isMorse = morseRegex.firstMatch(in: input, range: NSRange(input.startIndex..., in: input)) != nil

  if isMorse {
    // Si es morse, convertimos a texto
    return convertToText(morse: input)
  } else {
    // Si es texto, convertimos a morse
    return convertToMorse(text: input)
  }
}

print(convert(input: "SOS"))            // => "... --- ..."
print(convert(input: "··· ——— ···"))    // => "SOS"

//Brais cases
print(convert(input: "Chocapic. Es una marca de cereales?"))    // => "———— ——— —·—· ·— ·——· ·· —·—· ·—·—·—  · ···  ··— —· ·—  —— ·— ·—· —·—· ·—  —·· ·  —·—· · ·—· · ·— ·—·· · ··· ··——··"
print(convert(input: "———— ——— —·—· ·— ·——· ·· —·—· ·—·—·—  · ···  ··— —· ·—  —— ·— ·—· —·—· ·—  —·· ·  —·—· · ·—· · ·— ·—·· · ··· ··——··")) // => "Chocapic. Es una marca de cereales?"


//Jaime cases
print(convert(input: "De texto a Morse"))                               // => "—·· ·  — · —··— — ———  ·—  —— ——— ·—· ··· ·"
print(convert(input: "—·· ·  —— ——— ·—· ··· ·  ·—  — · —··— — ———"))    // => "DE MORSE A TEXTO"







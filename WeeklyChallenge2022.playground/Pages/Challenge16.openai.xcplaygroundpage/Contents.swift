import Foundation

/*
 * Reto #16
 * EN MAYÚSCULA
 * Fecha publicación enunciado: 18/04/22
 * Fecha publicación resolución: 25/04/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea una función en Swift que reciba un String de cualquier tipo y se encargue de
 * poner en mayúscula la primera letra de cada palabra.
 * - No se pueden utilizar operaciones del lenguaje que lo resuelvan directamente.
 *
 * Resuelto: Sí
 * Iteracciones: 2
 * Explicación: La función primero divide el String de entrada en un arreglo de palabras, utilizando el método split(separator:). Luego, utiliza el método map para transformar cada palabra en una versión capitalizada, convirtiendo a mayúsculas la primera letra de cada palabra. Finalmente, se une el arreglo de palabras capitalizadas en un único String y se devuelve como resultado.
 *
 */

func capitalizeWords(input: String) -> String {
    let words = input.split(separator: " ")
    let capitalizedWords = words.map { word in
        var capitalizedWord = word
        capitalizedWord.replaceSubrange(capitalizedWord.startIndex...capitalizedWord.startIndex, with: String(capitalizedWord[capitalizedWord.startIndex]).uppercased())
        return capitalizedWord
    }
    return capitalizedWords.joined(separator: " ")
}

let input = "hello world"
let output = capitalizeWords(input: input)
print(output)  // Imprime "Hello World"

// Brais cases
print(capitalizeWords(input: "¿hola qué tal estás?"))
print(capitalizeWords(input: "¿hola      qué tal estás?"))
print(capitalizeWords(input: "El niño ñoño"))

// Jaime cases
print(capitalizeWords(input: ""))
print(capitalizeWords(input: "palabra"))
print(capitalizeWords(input: "varias palabras"))
print(capitalizeWords(input: "varias palabras, con puntuación."))
print(capitalizeWords(input: "varias palabras, con puntuación y MAYÚSCULAS."))
print(capitalizeWords(input: "varias palabras, con puntuación y MAYÚSCULAS\nen varias líneas."))
print(capitalizeWords(input: "¡última hora! ¿hay novedades?"))

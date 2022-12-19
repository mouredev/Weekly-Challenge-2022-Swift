import Foundation

/*
 * Reto #16
 * EN MAYÚSCULA
 * Fecha publicación enunciado: 18/04/22
 * Fecha publicación resolución: 25/04/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea una función que reciba un String de cualquier tipo y se encargue de
 * poner en mayúscula la primera letra de cada palabra.
 * - No se pueden utilizar operaciones del lenguaje que lo resuelvan directamente.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

func capitalizeWords(text: String) -> String {
    let wordSeparators = text.filter{ !$0.isLetter }
    var result = ""
    for charIndex in 0..<text.count {
        let currentChar = text[text.index(text.startIndex, offsetBy: charIndex)]
        if(charIndex == 0) {
            result += currentChar.uppercased()
        } else {
            let previousChar = text[text.index(text.startIndex, offsetBy: charIndex-1)]
            result += wordSeparators.contains(String(previousChar)) ? currentChar.uppercased() : String(currentChar)
        }
    }
    return result
}


print(capitalizeWords(text: ""))
print(capitalizeWords(text: "palabra"))
print(capitalizeWords(text: "varias palabras"))
print(capitalizeWords(text: "varias palabras, con puntuación."))
print(capitalizeWords(text: "varias palabras, con puntuación y MAYÚSCULAS."))
print(capitalizeWords(text: "varias palabras, con puntuación y MAYÚSCULAS\nen varias líneas."))
print(capitalizeWords(text: "¡última hora! ¿hay novedades?"))

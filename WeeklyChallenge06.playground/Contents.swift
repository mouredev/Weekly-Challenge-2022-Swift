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
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */


func reverseWord(word: String)->String{
    
    let wordArray = Array(word)
    var result : [String] = []
    
    for index in (0...word.count-1).reversed(){
        result.append(String(wordArray[index]))
    }
    
    return result.joined()
}


// Sin un bucle, mediante una función recursiva
func recursiveReverse(text: String, index: Int = 0, reversedText: String = "") -> String {
    let textCount = text.count - 1
    var newReversedText = reversedText
    let textArray = Array(text)
    newReversedText += "\(textArray[textCount - index])"
    if index < textCount {
        let newIndex = index + 1
        newReversedText = recursiveReverse(text: text, index:newIndex, reversedText: newReversedText)
    }
    return newReversedText
}

reverseWord(word: "hola mundo")


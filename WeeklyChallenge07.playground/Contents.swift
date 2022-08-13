import Foundation

/*
 * Reto #7
 * CONTANDO PALABRAS
 * Fecha publicación enunciado: 14/02/22
 * Fecha publicación resolución: 21/02/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea un programa que cuente cuantas veces se repite cada palabra y que muestre el recuento final de todas ellas.
 * - Los signos de puntuación no forman parte de la palabra.
 * - Una palabra es la misma aunque aparezca en mayúsculas y minúsculas.
 * - No se pueden utilizar funciones propias del lenguaje que lo resuelvan automáticamente.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

func wordCount(phrase: String)-> [String:Int] {
    
    let phraseLower = phrase.lowercased()
    var myPhrase : NSMutableString = NSMutableString(string: phraseLower)
    
    let regex = try! NSRegularExpression(pattern: "[^a-z0-9]", options: [])
        regex.replaceMatches(in: myPhrase, options: [], range: NSMakeRange(0, myPhrase.length), withTemplate: " ")
    
    let wordsArray = phrase.split(separator: " ")
    
    var words : [String:Int] = [:]
    
    for index in 0...wordsArray.count-1 {


        let wordKey = String(wordsArray[index])

        if words[wordKey] != nil {
            words[wordKey]! += 1
        }else{
            words[wordKey] = 1
        }
    }
    
    return words
}

wordCount(phrase: "Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada")


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

func countWords(text: String) {

    let mutableString = NSMutableString(string: text.lowercased())
    
    let regex = try! NSRegularExpression(pattern: "[^a-z0-9]", options: [])
    regex.replaceMatches(in: mutableString, options: [], range: NSMakeRange(0, mutableString.length), withTemplate: " ")
    
    var words: [String:Int] = [:]
    
    String(mutableString).split(separator: " ").forEach { word in
        let key = String(word)
        if words[key] != nil {
            words[key]! += 1
        } else {
            words[key] = 1
        }
    }
    
    words.forEach { key, value in
        print("\(key) se ha repetido \(value) \(value == 1 ? "vez" : "veces")")
    }
}

countWords(text: "Hola, mi nombre es brais. Mi nombre completo es Brais Moure (MoureDev).")


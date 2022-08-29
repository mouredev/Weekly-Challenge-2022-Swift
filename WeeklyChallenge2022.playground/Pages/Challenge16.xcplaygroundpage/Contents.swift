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

func capitalize(text: String) -> String {
    
    var capitalizedText = text

    let clearText = NSMutableString(string: text)
    let regex = try! NSRegularExpression(pattern: "[^A-zÀ-ú]", options: [])
    regex.replaceMatches(in: clearText, options: [], range: NSMakeRange(0, clearText.length), withTemplate: " ")
   
    clearText.components(separatedBy: " ").forEach { word in
                
        let firstChar = word.prefix(1).description.uppercased()
        let otherChars = word.dropFirst()
        
        capitalizedText = capitalizedText.replacingOccurrences(of: word, with: "\(firstChar)\(otherChars)")
    }
    
    return capitalizedText
}

print(capitalize(text: "¿hola qué tal estás?"))
print(capitalize(text: "¿hola      qué tal estás?"))
print(capitalize(text: "El niño ñoño"))

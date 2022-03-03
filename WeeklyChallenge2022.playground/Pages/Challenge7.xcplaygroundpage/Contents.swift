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

print(counter(text: "Hola mundo"))
print(counter(text: textTest()))

func counter(text: String) -> String {
    let textAux = text.trimmingCharacters(in: .punctuationCharacters)
        .lowercased()
        .split(separator: " ")
    
    var worldDictionary : [String: Int] = [String: Int]()

    for world in textAux {
        if worldDictionary[String(world)] != nil {
            worldDictionary[String(world)] = worldDictionary[String(world)]! + 1
        }else{
            worldDictionary[String(world)] = 1
        }
    }
    
    return "\(worldDictionary)"
}

func textTest() -> String {
    return "Swift es un lenguaje de programación multiparadigma creado por Apple enfocado en el desarrollo de aplicaciones para iOS y macOS. Fue presentado en la WWDC 20147​ y está diseñado para integrarse con los Frameworks Cocoa y Cocoa Touch; puede usar cualquier biblioteca programada en Objective-C y llamar a funciones de C. También es posible desarrollar código en Swift compatible con Objective-C bajo ciertas condiciones. Swift tiene la intención de ser un lenguaje seguro, de desarrollo rápido y conciso. Usa el compilador LLVM incluido en Xcode 6. Fue presentado como un lenguaje propietario, pero en el año 2015, con la versión 2.2, pasó a ser de código abierto8​ con la Licencia Apache 2.0."
}

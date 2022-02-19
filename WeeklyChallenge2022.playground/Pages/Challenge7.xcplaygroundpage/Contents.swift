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
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda la acomunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */
func contarPalabras(frase: String) -> () {

    var palabras = frase.split(whereSeparator: { (carater) in
        
        !carater.isLetter || carater == "-"
    })
    
    var diccionario = [String: Int]()
    
    for palabra in palabras {
        
        if diccionario[palabra.description.lowercased().folding(options: .diacriticInsensitive, locale: Locale.current)] == nil {
            diccionario[palabra.description.lowercased().folding(options: .diacriticInsensitive, locale: Locale.current)] = 1
        }else{
            
            diccionario[palabra.description.lowercased().folding(options: .diacriticInsensitive, locale: Locale.current)] = diccionario[palabra.description.lowercased().folding(options: .diacriticInsensitive, locale: Locale.current)]! + 1
        }
        
    }
    
    return print(diccionario)
}

contarPalabras(frase: "Dicho esto, no siempre es así, por lo que es fundamental releer un texto una vez escrito para comprobar que tiene coherencia y cohesión, que se transmite realmente lo deseado y asegurarse que el lector de ese texto puede comprenderlo. Para ello siempre será importante que tengáis en mente cuál es el argumento de vuestro texto, que podáis incluir palabras ricas pero comprensibles y accesibles al lector (teniendo en cuenta hacia quién va dirigido).")


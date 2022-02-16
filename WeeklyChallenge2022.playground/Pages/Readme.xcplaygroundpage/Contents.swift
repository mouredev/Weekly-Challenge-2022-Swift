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


let texto = "El gato! gato esta encerrado con un perro que corre mas que el gato con otro perro mas grande que no esta encerrado"
let separators = CharacterSet(charactersIn: "!,;- ")


func cuentaPalabras(texto:String, separadores:CharacterSet) -> [String:Int] {
    let texto_divido = texto.lowercased().components(separatedBy: separators).filter { !$0.isEmpty}
    var recuentoPalabras:[String:Int] = [:]
    for palabra in texto_divido {
        if let rc_word = recuentoPalabras[palabra]  {
            recuentoPalabras[palabra] = rc_word + 1
        } else {
            recuentoPalabras[palabra] = 1
        }
    }
    return recuentoPalabras
    
}


func cuentaPalabrasMap(texto:String, separadores:CharacterSet) -> [String:Int] {
let texto_divido = texto.lowercased().components(separatedBy: separators).filter { !$0.isEmpty}
var recuentoPalabras:[String:Int] = [:]
texto_divido.map { palabra in
    if let rc_word = recuentoPalabras[palabra]  {
        recuentoPalabras[palabra] = rc_word + 1
    } else {
        recuentoPalabras[palabra] = 1
    }
 
}
return recuentoPalabras
}
print(cuentaPalabras(texto: texto, separadores: separators))
print(cuentaPalabrasMap(texto: texto, separadores: separators))






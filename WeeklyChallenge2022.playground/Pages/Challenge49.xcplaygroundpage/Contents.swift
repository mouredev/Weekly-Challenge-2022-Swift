import Foundation

/*
 * Reto #49
 * EL DETECTOR DE HANDLES
 * Fecha publicación enunciado: 05/12/22
 * Fecha publicación resolución: 12/12/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea una función que sea capaz de detectar y retornar todos los handles de un texto usando solamente Expresiones Regulares.
 * Debes crear una expresión regular para cada caso:
 * - Handle usuario: Los que comienzan por "@"
 * - Handle hashtag: Los que comienzan por "#"
 * - Handle web: Los que comienzan por "www.", "http://", "https://" y finalizan con un dominio (.com, .es...)
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal"
 *   para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en
 *   https://retosdeprogramacion.com/semanales2022.
 *
 */

func handlesDetector(text: String) -> [String:[String]] {

    var handles = [String:[String]]()

    do {
        
        handles["user"] = try text.matches(of: Regex("@(\\w{2,15})")).map({ match in
            text[match.range.lowerBound..<match.range.upperBound].description
        })
        
        handles["hashtag"] = try text.matches(of: Regex("#[^ !@$^#&,.?():%<>{}\\[\\]|\"]+")).map({ match in
            text[match.range.lowerBound..<match.range.upperBound].description
        })
        
        handles["url"] = try text.matches(of: Regex("((https?://(www\\.)?)|www\\.)[\\w#+\\=]{2,256}\\.[a-zA-Z]{2,7}[\\w\\/?=&.+-]*")).map({ match in
            text[match.range.lowerBound..<match.range.upperBound].description
        })
        
    } catch {
        // No hacemos nada en caso de error
    }

    return handles
}

print(handlesDetector(text: "En esta actividad de @mouredev, resolvemos #retos de #programacion desde https://retosdeprogramacion.com/semanales2022, que @braismoure aloja en www.github.com"))

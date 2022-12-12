import Foundation

/*
 * Reto #49
 * EL DETECTOR DE HANDLES
 * Fecha publicación enunciado: 05/11/22
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

func detectHandles(from text: String) -> [String] {
    let userHandleRegex = try! NSRegularExpression(pattern: "@[a-zA-Z0-9_]+")
    let hashtagHandleRegex = try! NSRegularExpression(pattern: "#[a-zA-Z0-9_]+")
    let webHandleRegex = try! NSRegularExpression(pattern: "(www\\.[a-zA-Z0-9_]+|https?://[a-zA-Z0-9_]+)(\\.[a-zA-Z]+)+")

    var handles = [String]()

    // Busca handles de usuario
    let userHandleMatches = userHandleRegex.matches(in: text, range: NSRange(text.startIndex..., in: text))
    for match in userHandleMatches {
        let handle = String(text[Range(match.range, in: text)!])
        handles.append(handle)
    }

    // Busca handles de hashtags
    let hashtagHandleMatches = hashtagHandleRegex.matches(in: text, range: NSRange(text.startIndex..., in: text))
    for match in hashtagHandleMatches {
        let handle = String(text[Range(match.range, in: text)!])
        handles.append(handle)
    }

    // Busca handles de web
    let webHandleMatches = webHandleRegex.matches(in: text, range: NSRange(text.startIndex..., in: text))
    for match in webHandleMatches {
        let handle = String(text[Range(match.range, in: text)!])
        handles.append(handle)
    }

    return handles
}

print(detectHandles(from: "Sorteo #aDEViento2022 - Sábado 10 de diciembre (10/24) - (x2) Libros 'Inteligencia matemática/Apocalipsis matemático' de Eduardo Sáenz de Cabezón - Ganadores/as sorteo: @DanMaG175, @fUIHq39Ym40q4Ul - Más sobre estos libros en https://amzn.to/3F9x16w"))


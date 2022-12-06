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

func detectUsers(from text: String) -> [String] {
    var usersList: [String] = []
    let regex = try? NSRegularExpression(pattern: "(@[a-zA-Z]+[a-zA-Z0-9_]*)", options: [])
    if let matches = regex?.matches(in: text, options: [], range: NSMakeRange(0, text.count)) {
        for match in matches {
            usersList.append(NSString(string: text).substring(with: NSRange(location:match.range.location, length: match.range.length)))
        }
    }
    return usersList
}

func detectHashtags(from text: String) -> [String] {
    var hashtagList: [String] = []
    let regex = try? NSRegularExpression(pattern: "(#[a-zA-Z]+[a-zA-Z0-9_]*)", options: [])
    if let matches = regex?.matches(in: text, options: [], range: NSMakeRange(0, text.count)) {
        for match in matches {
            hashtagList.append(NSString(string: text).substring(with: NSRange(location:match.range.location, length: match.range.length)))
        }
    }
    return hashtagList
}

func detectWebs(from text: String) -> [String] {
    var websList: [String] = []
    let regex = try? NSRegularExpression(pattern: #"((https|http)?:\/\/)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)"#, options: [])
    if let matches = regex?.matches(in: text, options: [], range: NSMakeRange(0, text.count)) {
        for match in matches {
            websList.append(NSString(string: text).substring(with: NSRange(location:match.range.location, length: match.range.length)))
        }
    }
    return websList
}

func detectHandlers(from text: String) {
    print("\n----------------------------------------------------------------------------------------------------------------------------")
    print("text: \(text)\n")
    let users: [String] = detectUsers(from: text)
    if users.count > 0 {
        print("Users found:")
        for user in users {
            print("\t\(user)")
        }
    } else {
        print("No users found!")
    }
    print("")
    let hashtags: [String] = detectHashtags(from: text)
    if hashtags.count > 0 {
        print("Hashtags found:")
        for hashtag in hashtags {
            print("\t\(hashtag)")
        }
    } else {
        print("No hashtags found!")
    }
    print("")
    let webs: [String] = detectWebs(from: text)
    if webs.count > 0 {
        print("Webs found:")
        for web in webs {
            print("\t\(web)")
        }
    } else {
        print("No webs found!")
    }
}

detectHandlers(from: "@Juan_Elias dice: Este es el #primer texto de #prueba para detectar una web como https://www.google.com/")
detectHandlers(from: "@d4v1d dice: Los #hashtags deben empezar con el simbolo # y el siguiente caracter debe tener una letra, #2 no es un hashtag valido")
detectHandlers(from: "@Maria123 dice: Los nombres de usuario pueden tener numeros, pero deben empezar con un una letra #maria#rules #source www.maria.rules.com.mx")
detectHandlers(from: "http://github.com/")

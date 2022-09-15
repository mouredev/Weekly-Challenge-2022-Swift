import Foundation

/*
 * Reto #36
 * LOS ANILLOS DE PODER
 * Fecha publicación enunciado: 06/09/22
 * Fecha publicación resolución: 14/09/22
 * Dificultad: MEDIA
 *
 * Enunciado: ¡La Tierra Media está en guerra! En ella lucharán razas leales a Sauron
 * contra otras bondadosas que no quieren que el mal reine sobre sus tierras.
 * Cada raza tiene asociado un "valor" entre 1 y 5:
 * - Razas bondadosas: Pelosos (1), Sureños buenos (2), Enanos (3), Númenóreanos (4), Elfos (5)
 * - Razas malvadas: Sureños malos (2), Orcos (2), Goblins (2), Huargos (3), Trolls (5)
 * Crea un programa que calcule el resultado de la batalla entre los 2 tipos de ejércitos:
 * - El resultado puede ser que gane el bien, el mal, o exista un empate. Dependiendo de la
 *   suma del valor del ejército y el número de integrantes.
 * - Cada ejército puede estar compuesto por un número de integrantes variable de cada raza.
 * - Tienes total libertad para modelar los datos del ejercicio.
 * Ej: 1 Peloso pierde contra 1 Orco, 2 Pelosos empatan contra 1 Orco, 3 Pelosos ganan a 1 Orco.
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal"
 *   para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en
 *   https://retosdeprogramacion.com/semanales2022.
 *
 */

enum Bondadosas: Int {
    case Pelosos
    case SureñosBuenos
    case Enanos
    case Numenoreanos
    case Elfos
    var puntos: Int {
        switch self {
        case .Pelosos: return 1
        case .SureñosBuenos: return 2
        case .Enanos: return 3
        case .Numenoreanos: return 4
        case .Elfos: return 5
        }
    }
}

enum Malvadas {
    case SureñosMalos
    case Orcos
    case Goblins
    case Huargos
    case Trolls
    var puntos: Int {
        switch self {
        case .SureñosMalos: return 2
        case .Orcos: return 2
        case .Goblins: return 2
        case .Huargos: return 3
        case .Trolls: return 5
        }
    }
}


func batalla(buenos: [Bondadosas:Int], malos: [Malvadas:Int]){
    
    var puntosBuenos = 0
    var puntosMalos = 0
    
    for (tipo, soldados) in buenos {
        puntosBuenos += tipo.puntos * soldados
    }
    
    for (tipo, soldados) in malos {
        puntosMalos += tipo.puntos * soldados
    }
    
    print("Puntos buenos-> \(puntosBuenos) - Puntos malos-> \(puntosMalos)")
    if puntosBuenos > puntosMalos {
        print("Ganan los buenos")
    } else if puntosBuenos < puntosMalos {
        print("Ganan los malos")
    } else {
        print("Empatan")
    }
}

batalla(buenos:[Bondadosas.Elfos:2, Bondadosas.Enanos:25], malos:[Malvadas.Orcos:2, Malvadas.SureñosMalos:55])

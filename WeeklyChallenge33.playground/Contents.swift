import Foundation

/*
 * Reto #33
 * CICLO SEXAGENARIO CHINO
 * Fecha publicación enunciado: 15/08/22
 * Fecha publicación resolución: 22/08/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea un función, que dado un año, indique el elemento y animal correspondiente
 * en el ciclo sexagenario del zodíaco chino.
 * - Información: https://www.travelchinaguide.com/intro/astrology/60year-cycle.htm
 * - El ciclo sexagenario se corresponde con la combinación de los elementos madera,
 *   fuego, tierra, metal, agua y los animales rata, buey, tigre, conejo, dragón, serpiente,
 *   caballo, oveja, mono, gallo, perro, cerdo (en este orden).
 * - Cada elemento se repite dos años seguidos.
 * - El último ciclo sexagenario comenzó en 1984 (Madera Rata).
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en https://retosdeprogramacion.com/semanales2022.
 *
 */

enum ZodiacSign {
    case rat
    case ox
    case tiger
    case rabbit
    case dragon
    case snake
    case horse
    case sheep
    case monkey
    case rooster
    case dog
    case pig
    
    var description: String {
        switch self {
        case .rat:
            return "Rat"
        case .ox:
            return "Ox"
        case .tiger:
            return "Tiger"
        case .rabbit:
            return "Rabbit"
        case .dragon:
            return "Dragon"
        case .snake:
            return "Snake"
        case .horse:
            return "Horse"
        case .sheep:
            return "Sheep"
        case .monkey:
            return "Monkey"
        case .rooster:
            return "Rooster"
        case .dog:
            return "Dog"
        case .pig:
            return "Pig"
        }
    }
}

enum WuXing {
    case wood
    case fire
    case earth
    case metal
    case water
    
    var description: String {
        switch self {
        case .wood:
            return "Wood"
        case .fire:
            return "Fire"
        case .earth:
            return "Earth"
        case .metal:
            return "Metal"
        case .water:
            return "Water"
        }
    }
}

struct SexagenaryCycle {
    var zodiacSign: ZodiacSign
    var wuXing: WuXing
}



func sexagenaryCycle(year: Int) -> String {
    
    var steam  : Array = [ZodiacSign.rat, ZodiacSign.ox, ZodiacSign.tiger, ZodiacSign.rabbit, ZodiacSign.dragon, ZodiacSign.snake, ZodiacSign.horse, ZodiacSign.sheep, ZodiacSign.monkey, ZodiacSign.rooster, ZodiacSign.dog, ZodiacSign.pig]

    var branch : Array = [WuXing.wood, WuXing.fire, WuXing.earth, WuXing.metal, WuXing.water]
    
    var result : SexagenaryCycle = SexagenaryCycle(zodiacSign: ZodiacSign.rat, wuXing: WuXing.wood)
    
    // Primero determinar posición en el ciclo:
    // Ejemplo 1967:
    // 1980 - 3 = 1977
    // 1977 / 60 = 32
    // abs (1977 ( 60 * 32)) = 57
    
    var position = year - 3
    let remainder: Int  = position / 60
    position = abs(position - ( 60 * remainder))
    
    for i in 1...position {
        
        result.zodiacSign = steam.first!
        result.wuXing = branch.first!
        
        let zs : ZodiacSign = steam.first!
        steam.removeFirst()
        steam.append(zs)
        
        if i % 2 == 0 && i != 1 {
            let wx : WuXing = branch.first!
            branch.removeFirst()
            branch.append(wx)
        }

    }
    
    // Usar dos arrays, ir avanzando animales dropeando el primero e insertando al final. Avanzar elementos cuando el número sea par mod 2 ==0

    return "El signo sexagenario de \(year) es: \(result.zodiacSign.description) | \(result.wuXing.description)"
}


print(sexagenaryCycle(year: 1980))
print(sexagenaryCycle(year: 1963))
print(sexagenaryCycle(year: 1986))
print(sexagenaryCycle(year: 1954))
print(sexagenaryCycle(year: 1934))
print(sexagenaryCycle(year: 1945))
print(sexagenaryCycle(year: 2018))
print(sexagenaryCycle(year: 2021))

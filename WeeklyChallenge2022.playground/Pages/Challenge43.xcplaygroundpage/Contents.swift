import Foundation

/*
 * Reto #43
 * TRUCO O TRATO
 * Fecha publicación enunciado: 24/10/22
 * Fecha publicación resolución: 02/11/22
 * Dificultad: MEDIA
 *
 * Enunciado: Este es un reto especial por Halloween.
 * Deberemos crear un programa al que le indiquemos si queremos realizar "Truco o Trato" y
 * un listado (array) de personas con las siguientes propiedades:
 * - Nombre de la niña o niño
 * - Edad
 * - Altura en centímetros
 *
 * Si las personas han pedido truco, el programa retornará sustos (aleatorios)
 * siguiendo estos criterios:
 * - Un susto por cada 2 letras del nombre por persona
 * - Dos sustos por cada edad que sea un número par
 * - Tres sustos por cada 100 cm de altura entre todas las personas
 * - Sustos: 🎃 👻 💀 🕷 🕸 🦇
 *
 * Si las personas han pedido trato, el programa retornará dulces (aleatorios)
 * siguiendo estos criterios:
 * - Un dulce por cada letra de nombre
 * - Un dulce por cada 3 años cumplidos hasta un máximo de 10 años por persona
 * - Dos dulces por cada 50 cm de altura hasta un máximo de 150 cm por persona
 * - Dulces: 🍰 🍬 🍡 🍭 🍪 🍫 🧁 🍩
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal"
 *   para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en
 *   https://retosdeprogramacion.com/semanales2022.
 *
 */

enum Halloween {
    case trick, treat
}

struct Person {
    let name: String
    let age: Int
    let height: Int
}

func trickOrTreat(halloween: Halloween, people: [Person]) -> String {

    let scares = ["🎃", "👻", "💀", "🕷", "🕸", "🦇"]
    let candies = ["🍰", "🍬", "🍡", "🍭", "🍪", "🍫", "🧁", "🍩"]

    var result = ""
    var height = 0
    
    people.forEach { person in

        switch halloween {
        case .trick:
            
            // Name
            (1...(person.name.replacingOccurrences(of: " ", with: "").count / 2)).forEach { _ in
                result += scares.randomElement() ?? ""
            }

            // Age
            if person.age % 2 == 0 {
                result += scares.randomElement() ?? ""
                result += scares.randomElement() ?? ""
            }

            // Height
            height += person.height
            while height >= 100 {
                result += scares.randomElement() ?? ""
                result += scares.randomElement() ?? ""
                result += scares.randomElement() ?? ""
                height -= 100
            }
            
        case .treat:
            
            // Name
            (1...(person.name.replacingOccurrences(of: " ", with: "").count)).forEach { _ in
                result += candies.randomElement() ?? ""
            }

            // Age
            if person.age <= 10 {
                (1...(person.age / 3)).forEach { _ in
                    result += candies.randomElement() ?? ""
                }
            }

            // Height
            if person.height <= 150 {
                (1...(person.height / 50)).forEach { _ in
                    result += candies.randomElement() ?? ""
                    result += candies.randomElement() ?? ""
                }
            }
        }
    }

    return result
}

print(trickOrTreat(halloween: .trick, people: [
    Person(name: "Brais", age: 35, height: 177),
    Person(name: "Sara", age: 9, height: 122),
    Person(name: "Pedro", age: 5, height: 80),
    Person(name: "Roswell", age: 3, height: 54)]))

print(trickOrTreat(halloween: .treat, people: [
    Person(name: "Brais", age: 35, height: 177),
    Person(name: "Sara", age: 9, height: 122),
    Person(name: "Pedro", age: 5, height: 80),
    Person(name: "Roswell", age: 3, height: 54)]))

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

enum HalloweenAction {
    case trick
    case treat
}

private struct Child {
    let name: String
    let age, height: Int    
}

private func showScares(counter: Int) -> String {
    let scares = ["🎃", "👻", "💀", "🕷", "🕸", "🦇"]
    var result = ""
    (0..<counter).forEach { _ in
        result += scares[Int.random(in: 0..<scares.count)]
    }
    return result
}

private func showSweets(counter: Int) -> String {
    let sweets = ["🍰", "🍬", "🍡", "🍭", "🍪", "🍫", "🧁", "🍩"]
    var result = ""
    (0..<counter).forEach { _ in
        result += sweets[Int.random(in: 0..<sweets.count)]
    }
    return result
}

private func trickOrTreat(children: Array<Child>, halloweenAction: HalloweenAction) {
    var result = ""
    if(halloweenAction == HalloweenAction.trick) {
        var totalHeight = 0
        children.forEach { child in
            result += showScares(counter: child.name.count / 2)         // 11
            if(child.age % 2 == 0){ result += showScares(counter: 2) }  // 4
            totalHeight += child.height
        }
        result += showScares(counter: (totalHeight / 100) * 3)          // 15
    } else {
        children.forEach { child in
            result += showSweets(counter: child.name.count)                // 23
            result += showSweets(counter: min(child.age, 10) / 3)          // 11
            result += showSweets(counter: min(child.height, 150) / 50 * 2) // 18
        }
    }
    print(result)
}

trickOrTreat(children: [Child(name: "Juan", age: 9, height: 140),
                        Child(name: "Arturo", age: 11, height: 121),
                        Child(name: "Rodrigo", age: 8, height: 162),
                        Child(name: "Javier", age: 12, height: 136)], halloweenAction: HalloweenAction.trick)
trickOrTreat(children: [Child(name: "Juan", age: 9, height: 140),
                        Child(name: "Arturo", age: 11, height: 121),
                        Child(name: "Rodrigo", age: 8, height: 162),
                        Child(name: "Javier", age: 12, height: 136)], halloweenAction: HalloweenAction.treat)

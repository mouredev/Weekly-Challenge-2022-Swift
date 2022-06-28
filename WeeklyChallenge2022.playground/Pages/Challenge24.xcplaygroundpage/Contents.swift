import Foundation

/*
 * Reto #24
 * ITERATION MASTER
 * Fecha publicación enunciado: 13/06/22
 * Fecha publicación resolución: 20/06/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Quiero contar del 1 al 100 de uno en uno (imprimiendo cada uno). ¿De cuántas maneras eres capaz de hacerlo? Crea el código para cada una de ellas.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

// 1

print("**** 1 ****")

for index in (1...100) {
    print(index)
}

// 2

print("**** 2 ****")

(1...100).forEach { index in
    print(index)
}

// 3

print("**** 3 ****")

var whileIndex = 1

while whileIndex <= 100 {
    print(whileIndex)
    whileIndex += 1
}

// 4

print("**** 4 ****")

whileIndex = 1

repeat {
    print(whileIndex)
    whileIndex += 1
} while whileIndex <= 100

// 5

print("**** 5 ****")

func print100(index: Int) {
    if index <= 100 {
        print(index)
        print100(index: index + 1)
    }
}

print100(index: 1)

// 6

print("**** 6 ****")

print((1...100).filter { _ -> Bool in
    return true
})

// 7

print("**** 7 ****")

print((1...100).map { $0 })

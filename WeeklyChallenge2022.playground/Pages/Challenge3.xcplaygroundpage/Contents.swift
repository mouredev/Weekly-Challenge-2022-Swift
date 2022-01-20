import Foundation

/*
 * Reto #3
 * ¿ES UN NÚMERO PRIMO?
 * Fecha publicación enunciado: 17/01/22
 * Fecha publicación resolución: 24/01/22
 * Dificultad: MEDIA
 *
 * Enunciado: Escribe un programa que se encargue de comprobar si un número es o no primo.
 * Hecho esto, imprime los números primos entre 1 y 100.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda la acomunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

extension Int {
    func isPrime() -> Bool {
        let start = 2
        let end = self / 2
        if end >= start {
            for index in start...end {
                if self % index == 0 {
                    return false
                }
            } // 0.19314706325531006
            //return !(start...end).contains { self % $0 == 0 } // 0.34242796897888184
            //return (start...end).first { self % $0 == 0 } == nil // 0.37084102630615234
            //return (start...end).allSatisfy { self % $0 != 0 } // 0.3679659366607666
        }
        return self < start ? false : true
    }
}

let date = Date()
(1...10000).filter{ $0.isPrime() }.forEach { print($0) }
print(Date().timeIntervalSince(date))

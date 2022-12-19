import Foundation
import SwiftUI

/*
 * Reto #20
 * PARANDO EL TIEMPO
 * Fecha publicación enunciado: 16/05/22
 * Fecha publicación resolución: 23/05/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea una función que sume 2 números y retorne su resultado pasados unos segundos.
 * - Recibirá por parámetros los 2 números a sumar y los segundos que debe tardar en finalizar su ejecución.
 * - Si el lenguaje lo soporta, deberá retornar el resultado de forma asíncrona, es decir, sin detener la ejecución del programa principal. Se podría ejecutar varias veces al mismo tiempo.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

func delayedAddition(num1: Int, num2: Int, seconds: Int, completion: @escaping ((Int) -> Void)) async throws {
    DispatchQueue.main.asyncAfter(deadline: .now() + Double(seconds)) {
        completion(num1 + num2)
    }
}

Task {
    try await delayedAddition(num1: 10, num2: 30, seconds: 5) { result in
        print(result)
    }
    try await delayedAddition(num1: 15, num2: 35, seconds: 6) { result in
        print(result)
    }
}

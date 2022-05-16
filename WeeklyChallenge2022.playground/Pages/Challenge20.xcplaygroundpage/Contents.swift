import UIKit

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

func asyncSum(numA: Int, numB: Int, ellapsedTime: Double, completion: @escaping (Result<Int, Error>) -> Void) {
    DispatchQueue.global(qos: .background).async {
        Thread.sleep(until: .now + ellapsedTime)
        completion(.success(numA + numB))
    }
}

func printSum(numA: Int, numB: Int, ellapsedTime: Double) {
    asyncSum(numA: numA, numB: numB, ellapsedTime: ellapsedTime) { result in
        switch result {
        case .failure(let error):
            print("ERROR: \(error.localizedDescription)")
        case .success(let result):
            print("Después de \(ellapsedTime) segundos, \(numA) + \(numB) = \(result)")
        }
    }
}

printSum(numA: 1, numB: 1, ellapsedTime: 10)
printSum(numA: 1, numB: 2, ellapsedTime: 8)
printSum(numA: 2, numB: 2, ellapsedTime: 3)
printSum(numA: 1, numB: 3, ellapsedTime: 5)

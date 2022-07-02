import Foundation

/*
 * Reto #0
 * EL FAMOSO "FIZZ BUZZ"
 * Fecha publicación enunciado: 27/12/21
 * Fecha publicación resolución: 03/01/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Escribe un programa que muestre por consola (con un print) los números de 1 a 100 (ambos incluidos y con un salto de línea entre cada impresión), sustituyendo los siguientes:
 * - Múltiplos de 3 por la palabra "fizz".
 * - Múltiplos de 5 por la palabra "buzz".
 * - Múltiplos de 3 y de 5 a la vez por la palabra "fizzbuzz".
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

// MARK: - SOLUCION CON IF

//for number in 1...100 {
//    if number % 3 == 0 && number % 5 == 0 {
//        print("fizzbuzz")
//    } else if number % 3 == 0 {
//        print("fizz")
//    } else if number % 5 == 0 {
//        print("buzz")
//    } else {
//        print(number)
//    }
//}

// MARK: - SOLUCION CON SWITCH
for number in 1...100 {
    switch number {
    case let fizzbuzz where fizzbuzz % 3 == 0 && fizzbuzz % 5 == 0: print("fizzbuzz")
    case let fizz where fizz % 3 == 0: print("fizz")
    case let buzz where buzz % 5 == 0: print("buzz")
    default: print(number)
    }
}


// MARK: - SOLUCION CON OPERADOR TERNARIO (MOURE)
//for index in 1...100 {
//    let divisibleByThree = index % 3 == 0
//    let divisibleByFive = index % 5 == 0
//    print("\((divisibleByThree && divisibleByFive) ? "fizzbuzz" : (divisibleByThree ? "fizz" : (divisibleByFive ? "buzz" : index.description)))")
//}

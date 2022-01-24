/*
 * Tienes toda la información ensencial en:
 * https://github.com/mouredev/Weekly-Challenge-2022-Swift/blob/main/README.md
 *
 * Cada nuevo reto se añadirá en un fichero del playground
 *
 * Recuerda que puedes ejecutar código Swift de una forma muy simple
 * pulsando el botón de "play ►" en el lateral.
 */
import Foundation

func isPrime(number : Int) -> Bool {
    let raiz = Int(sqrt(Double(number)))
    
    if number < 2 {
        return false
    }
    
    if number == 2 {
        return true
    }
    
    for i in 2...raiz where number % i == 0 {
        return false
    }
    return true
}

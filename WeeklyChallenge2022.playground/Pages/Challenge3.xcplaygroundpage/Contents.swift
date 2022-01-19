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

func isPrime(number: Int) -> Bool {
    
    var rangeArray = [Int]()
    var multiplierArray = [Int]()
    var counter = 0
    
    for n in 1...number {
        
        rangeArray.append(n)
    }
    
    for r in rangeArray {
        
        multiplierArray.append(number % r)
    }
    
    for m in multiplierArray {
        
        if m == 0 {
            
            counter += 1
            
            if counter > 2 {
                
                print("No es Primo")
                return false
            }
        }
    }
    print("Si Es Primo")
    return true
}

isPrime(number: 13)

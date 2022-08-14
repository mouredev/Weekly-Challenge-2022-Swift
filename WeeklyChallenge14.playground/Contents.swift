import Foundation

/*
 * Reto #14
 * ¿ES UN NÚMERO DE ARMSTRONG?
 * Fecha publicación enunciado: 04/04/22
 * Fecha publicación resolución: 11/04/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Escribe una función que calcule si un número dado es un número de Armstrong (o también llamado narcisista).
 * Si no conoces qué es un número de Armstrong, debes buscar información al respecto.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */


// En matemática recreativa un número narcisista​​ es aquel que es igual a la suma de sus
// dígitos elevados a la potencia de su número de cifras. Su nombre alude a lo
// mucho que parecen "quererse a sí mismos".


func esNarcisista(numero: Int) -> Bool {
    
    if numero < 0 {
        return false
    }
    
    let numeroArray : [Int] = String(numero).compactMap{ $0.wholeNumberValue }
    var result : Int = 0
    
    numeroArray.forEach { digit in
        result += Int(pow(Double(digit), Double(numeroArray.count)))
    }
    
    return numero == result
}

esNarcisista(numero: 370)
esNarcisista(numero: 345)

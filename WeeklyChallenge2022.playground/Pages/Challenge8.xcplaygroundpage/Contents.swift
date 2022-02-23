import Foundation

/*
 * Reto #8
 * DECIMAL A BINARIO
 * Fecha publicación enunciado: 18/02/22
 * Fecha publicación resolución: 02/03/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea un programa se encargue de transformar un número decimal a binario sin utilizar funciones propias del lenguaje que lo hagan directamente.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda la acomunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

func resto(numero:Int, numBinario: inout String, divisor:Int = 2) {
    if ( numero ) > 1 {
        numBinario.append(String(numero % divisor))
        resto(numero: numero / divisor, numBinario: &numBinario)
    }else {
        numBinario.append("1")
    }
    
}


var binario:String = ""
resto(numero: 12548,numBinario: &binario)
print(String(binario.reversed()))



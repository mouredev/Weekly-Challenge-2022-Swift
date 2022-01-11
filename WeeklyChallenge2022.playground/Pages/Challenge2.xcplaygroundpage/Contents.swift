import Foundation

/*
 * Reto #2
 * LA SUCESIÓN DE FIBONACCI
 * Fecha publicación enunciado: 10/01/22
 * Fecha publicación resolución: 17/01/22
 * Dificultad: DIFÍCIL
 *
 * Enunciado: Escribe un programa que imprima los 50 primeros números de la sucesión de Fibonacci empezando en 0.
 * La serie Fibonacci se compone por una sucesión de números en la que el siguiente siempre es la suma de los dos anteriores.
 * 0, 1, 1, 2, 3, 5, 8, 13...
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda la acomunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

//Diccionario para guardar los resultados calculados.
var fibonacciReg:[Int:Double] = [:]


//funcion que recibe el numero al que queremos calcular la secuencia de fibonacci.
func fibonacciRegBucle(pos: Int)->Double{
    
    //si la posicion ya se ha guardado antes, devuelve el valor.
    if let resultadoGuardado = fibonacciReg[pos]{
        return resultadoGuardado
    }
    
    //si no se habia calculado y guardado anteriormente comprueba si es menor de 2 para guardar el 1 y el 0
    //empieza a calcular por la posicion recibida en pos.
    let resultadoObtenido = pos < 2 ? Double(pos) : fibonacciRegBucle(pos: pos - 1) + fibonacciRegBucle(pos: pos - 2)
    print(resultadoObtenido)
    fibonacciReg[pos] = resultadoObtenido
    
    return resultadoObtenido
}

fibonacciRegBucle(pos: 50)
//dump(fibonacciReg.sorted(by: { $0.key < $1.key}))



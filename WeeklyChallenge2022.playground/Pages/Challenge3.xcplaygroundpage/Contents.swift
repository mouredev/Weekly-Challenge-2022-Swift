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

//un numero es primo si solo si da division exacta al dividirlo por 1 y por si mismo.
//culaquier numero dividido por un numero superior no va a dar una division exacta.

func esPrimo(numero: Int)->Bool{
    var numeroDivisionesExactas = 0
    //bucle que recorre todos los numero desde el 1 hasta el numero pasado como argumento.
    for i in 1...numero{
        //obtiene el resto de la division entre el numero pasado como argumento y todos los numeros que hay entre 1 y el mismo.
        if numero % i == 0{
            numeroDivisionesExactas += 1
        }
    }
    
    //si el numero es primo solo puede dar como 0 como resto 2 veces. Si da mas, no es primo.
    return numeroDivisionesExactas > 2 ? false : true;
    
}

//imprime los numeros primos que hay entre 1 y 100.
for t in 1...100{
    if esPrimo(numero: t){
        print(t)
    }
}


//solucion mouredev
func isPrime(number: Int) -> Bool {
    
    if number < 2 {
        return false
    }
    
    for i in 2 ..< number {
        if number % i == 0 {
            return false
        }
    }
    
    return true
}

(1...100).forEach { number in
    if isPrime(number: number) {
        print(number)
    }
}



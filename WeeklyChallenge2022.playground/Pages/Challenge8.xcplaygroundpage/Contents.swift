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

var decimal = 102323

print(convert_manual(decimal: decimal))
print(convert_auto(decimal: decimal))
print(convert_manual_recursivo(decimal: decimal, binary: 0, count: 1))

func convert_manual(decimal: Int) -> Int {
    var decimalAux = decimal
    var binary = 0
    var count = 1

    while (decimalAux != 0) {
        binary += ((decimalAux % 2) * count)
        decimalAux /= 2
        count *= 10
    }
    return binary
}

func convert_manual_recursivo(decimal: Int, binary: Int, count: Int) -> String {
    if (decimal != 0){
        return convert_manual_recursivo(decimal: decimal / 2, binary: binary + ((decimal % 2) * count), count: count * 10)
    } else {
        return String(binary)
    }
}

func convert_auto(decimal: Int) -> String {
    return String(decimal, radix: 2)
}


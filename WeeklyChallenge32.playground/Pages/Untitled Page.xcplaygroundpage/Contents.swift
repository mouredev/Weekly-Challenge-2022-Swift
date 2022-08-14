import Foundation

/*
 * Reto #32
 * EL SEGUNDO
 * Fecha publicación enunciado: 08/08/22
 * Fecha publicación resolución: 15/08/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Dado un listado de números, encuentra el SEGUNDO más grande.
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en https://retosdeprogramacion.com/semanales2022.
 *
 */

func segundoMayor(listado: [Double])->Double {
    let listadoOrdenado = listado.sorted(by: >)
    return listadoOrdenado[1]
    
}


let numeros = [34,56,123.41,789.834,1243.12,675.756,12243.545]

segundoMayor(listado: numeros)

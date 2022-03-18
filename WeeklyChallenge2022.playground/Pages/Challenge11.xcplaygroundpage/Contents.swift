import Foundation

/*
 * Reto #11
 * ELIMINANDO CARACTERES
 * Fecha publicación enunciado: 14/03/22
 * Fecha publicación resolución: 21/03/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea una función que reciba dos cadenas como parámetro (str1, str2) e imprima otras dos cadenas como salida (out1, out2).
 * - out1 contendrá todos los caracteres presentes en la str1 pero NO estén presentes en str2.
 * - out2 contendrá todos los caracteres presentes en la str2 pero NO estén presentes en str1.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

 /*
 SOLUCION
 - funcion filter devuelve aquellos que no esten en el otro array, indexOf devuelve -1 si no encuentra elemento
 - funcion "join" une los elementos de array y devuelve una cadena
 */

function output(str1: string, str2:string) : string[] {

    //convertir a minuscula y luego convertir cadena en array con split
    let a1 = str1.trim().toLowerCase().split("")
    let a2 = str2.trim().toLowerCase().split("")

    return  [a1.filter(value =>  a2.indexOf(value)<0).join(""),
            a2.filter(value => a1.indexOf(value) <0).join("")]
}


console.log(output("hola","romaaa"))
//out : ["hl","rm"]
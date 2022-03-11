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

function intToBinary(integer)
{
    let result = '';
    
    if(!integer) return '0'; 

    while(integer > 0){
        if(integer == 1){
            result = result.toString() + "1"; 
        }else{
            result = integer % 2 == 0 ? result.toString() + '0' : result.toString() + '1';
        }

        integer = Math.floor(integer / 2); 
    }; 

    return result.split("").reverse().join("");
}
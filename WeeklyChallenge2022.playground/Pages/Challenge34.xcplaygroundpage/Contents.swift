import Foundation

/*
 * Reto #34
 * LOS NÚMEROS PERDIDOS
 * Fecha publicación enunciado: 22/08/22
 * Fecha publicación resolución: 29/08/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Dado un array de enteros ordenado y sin repetidos, crea una función que calcule y retorne todos los que faltan entre el mayor y el menor.
 * - Lanza un error si el array de entrada no es correcto.
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en https://retosdeprogramacion.com/semanales2022.
 *
 */

/* Enunciado: Dado un array de enteros ordenado y sin repetidos, crea una función que calcule y retorne todos los que faltan entre el mayor y el menor.
* - Lanza un error si el array de entrada no es correcto.*/


let missing = NumbersMissing([1,2,10,3,]);

console.log(missing);

function NumbersMissing(numbers: Array<number>) : Array<number> | string {
    if  (!IsOrdered(numbers) || !IsUnique(numbers)){
        return  "Error";
    }
    let missingNumbers : Array<number>=[];
    for (let index = 1; index < numbers.length; index++) {
         if(numbers[index - 1] + 1!= numbers[index]){
            missingNumbers.push(numbers[index - 1] + 1);
            numbers.splice(index, 0,numbers[index - 1] + 1);
         }
    }

    return missingNumbers;
}

function IsOrdered(numbers: Array<number>) : boolean {

    for (let index = 1; index < numbers.length; index++) {
        
        if(numbers[index] < numbers[index - 1]) return false;
    }
    return true;
}

function IsUnique(numbers: Array<number>) : boolean {
    let aux : Array<Number> = [];

    for (let index = 0; index < numbers.length; index++) {
        if(aux.find((n) =>  n === numbers[index]) != null){
            return false;
        }
        aux.push(numbers[index]);    
    }
    return true;
}

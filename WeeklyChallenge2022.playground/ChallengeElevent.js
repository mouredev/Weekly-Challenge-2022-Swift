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

function diffCharactersBetweenStrings(stringOne, stringTwo)
{   
    if(!stringOne || !stringTwo) return null; 

    stringOne = stringOne.replace(/[^a-zA-Z0-9]/g, '');
    stringTwo = stringTwo.replace(/[^a-zA-Z0-9]/g, '');
    let outOne = "";
    let outTwo = stringTwo;

    for(let i = 0; i < stringOne.length; i++){

        let charOne = stringOne.charAt(i);
        let exist = false;  

        for(let k = 0; k < stringTwo.length; k++){
            let charTwo =  stringTwo.charAt(k); 

            if(charOne == charTwo){
                exist = true; 
                outTwo = outTwo.replace(new RegExp(charOne, 'g'), ""); 
            };
        }

        if(!exist){
            outOne = outOne.concat(charOne);
        }
    };    

    return { outOne, outTwo};
}

let busquedaUno = diffCharactersBetweenStrings("comida", "naranja"); 
let busquedaDos = diffCharactersBetweenStrings("tengoAltaHambreBrah", "yotambienApa"); 

console.log(busquedaUno)
console.log(busquedaDos)
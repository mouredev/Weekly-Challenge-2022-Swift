/*
 * Reto #10
 * EXPRESIONES EQUILIBRADAS
 * Fecha publicación enunciado: 07/03/22
 * Fecha publicación resolución: 14/03/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea un programa que comprueba si los paréntesis, llaves y corchetes de una expresión están equilibrados.
 * - Equilibrado significa que estos delimitadores se abren y cieran en orden y de forma correcta.
 * - Paréntesis, llaves y corchetes son igual de prioritarios. No hay uno más importante que otro.
 * - Expresión balanceada: { [ a * ( c + d ) ] - 5 }
 * - Expresión no balanceada: { a * ( c + d ) ] - 5 }
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

//Intente usar la menor cantidad de funciones del lenguaje
function check(string)
{
    let isPair = false;
    let stack = [];
    let signos = string.replace(/[^\[\(\{\]\)\}]/g,""); 
    const pairs = { "(" : ")", "[" : "]", "{": "}", "}" : "{" , ")" : "(", "]" : "[" }; 

    for(let i = 0; i < signos.length; i++)
    {
        let currentCharacter = signos.charAt(i); 
        let nextCharacter = signos.charAt(i + 1); 

        if(pairs[currentCharacter] == nextCharacter){
            isPair = true;
            i++;
        }   
        else if(pairs[currentCharacter] == stack[stack.length - 1]){
            stack.pop(); 
            isPair = true;
        }
        else {
            stack.push(currentCharacter);
            if(stack[stack.length - 1] == "}" || stack[stack.length - 1] == "]" || stack[stack.length - 1] == ")" ){
                isPair = false; 
                break; 
            }
       }
       
    }

    isPair = stack.length != 0 ? false : isPair; 

    return isPair;
}

console.log(check("{ [ a * ( c + d ) ] - 5 }"))
console.log(check("{{{{{{([])()}[}}}}}"))
console.log(check("()"))

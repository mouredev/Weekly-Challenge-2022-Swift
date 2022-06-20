/*
 * Reto #16
 * EN MAYÚSCULA
 * Fecha publicación enunciado: 18/04/22
 * Fecha publicación resolución: 25/04/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea una función que reciba un String de cualquier tipo y se encargue de
 * poner en mayúscula la primera letra de cada palabra.
 * - No se pueden utilizar operaciones del lenguaje que lo resuelvan directamente.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 * print(capitalize(text: "¿hola qué tal estás?"))
 * print(capitalize(text: "¿hola      qué tal estás?"))
 * print(capitalize(text: "El niño ñoño"))
 */


const ejemplos = ["¿hola qué tal estás?",
    "¿hola      qué tal estás?",
    "El niño ñoño",
    "aauri",
    "hola      mundo, comenzamos aaa    picar!"];


const removeBlanks = (arr) => {
    for (var i = arr.length - 1; i >= 0; i--) {
        if (arr[i] === '') {
            arr.splice(i, 1);
        }
    }
}


function capitalizeSentence(sentence) {

    const splitted = sentence.split(" ");                                           //Partimos el string en Array
    removeBlanks(splitted);                                                         //Quitamos los espacios en blanco inecesarios


    for (let i = 0; i < splitted.length; i++) {                                     //Para cada palabra...

        let element = splitted[i];
        let elementSize = element.length;

        for (let index = 0; index < elementSize; index++) {                         //Para cada letra de la palabra...
            if (element[index].match(/^[ñA-Za-z _]*[ñA-Za-z][ñA-Za-z _]*$/)) {      //Tiene letras del abecedario???? (para evitar signos de puntuación)
                let coincidencia = element[index];
                let upper = coincidencia.toUpperCase();                             //La hacemos mayuscula
                splitted[i] = element.replace(coincidencia, upper);
                break;                                                              //Romper la iteración de cada letra (solo en la primera letra, si encuentra simbolos sigue a la primera que encuentra...)
            }
        }
    }

    return splitted.join(" ");                                                      //Return solución en string
}

ejemplos.forEach(item => console.log(capitalizeSentence(item)));
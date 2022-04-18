

/*
 * Reto #7
 * CONTANDO PALABRAS
 * Fecha publicación enunciado: 14/02/22
 * Fecha publicación resolución: 21/02/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea un programa que cuente cuantas veces se repite cada palabra y que muestre el recuento final de todas ellas.
 * - Los signos de puntuación no forman parte de la palabra.
 * - Una palabra es la misma aunque aparezca en mayúsculas y minúsculas.
 * - No se pueden utilizar funciones propias del lenguaje que lo resuelvan automáticamente.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

function countWords (text) {

    let palabras = [];
    let signos = [".", ",", ":", "¿", "?", "(", ")"]

    // Eliminar signos
    for (let i = 0; i < text.length; i++) {
        if (signos.includes(text[i])) {
            text2 = text.replace(text[i], "");
            text = text2;
        }
    }

    let arrText = text.toLowerCase().split(" ");
    console.log(arrText)
    let total = ""
    let repeticion = 0;

// Extraer las palabras
    for (let i = 0; i < arrText.length; i++) {
        if (!palabras.includes(arrText[i])) {
            palabras.push(arrText[i])
        }
        else {
            let posicion = palabras.indexOf(arrText[i]);           
            repeticion++;
        }        
}


console.log(repeticion)
console.log(palabras.indexOf("hola"))
// Contar las palabras cuantas veces se repiten
console.log(palabras)
}

let text = "Hola. que hola hola"
let text2 = "Hola, mi nombre es brais. Mi nombre completo es Brais Moure (MoureDev)."

countWords(text)



/*
 * Reto #4
 * ÁREA DE UN POLÍGONO
 * Fecha publicación enunciado: 24/01/22
 * Fecha publicación resolución: 31/01/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea UNA ÚNICA FUNCIÓN (importante que sólo sea una) que sea capaz de calcular y retornar el área de un polígono.
 * - La función recibirá por parámetro sólo UN polígono a la vez.
 * - Los polígonos soportados serán Triángulo, Cuadrado y Rectángulo.
 * - Imprime el cálculo del área de un polígono de cada tipo.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda la acomunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

const triangulo = {
    base: 10,
    alt: 5
}
const cuadrado = {
    lado: 4
}
const rectangulo = {
    ladoPeq: 5,
    ladoGra: 7
}

function calcArea (poligono) {
    
    if (poligono == triangulo) {
        let area = (triangulo.base * triangulo.alt) / 2
        return "El área del triangulo es " + area;
    }
    else if(poligono == cuadrado) {
        let area = cuadrado.lado * cuadrado.lado;
        return "El área del cuadrado es " + area;
    }
    else if (poligono == rectangulo) {
        let area = rectangulo.ladoPeq * rectangulo.ladoGra;
        return "El área del rectangulo es " + area;
    }
    else {
        return "Valor incorrecto, introduzca un poligono válido (triangulo, cuadrado, rectangulo)" 
    }
}


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
const cuadro = {
    lado: 5,
    calcularArea(){
        return this.lado ** 2; 
    }
}

const rectangulo = {
    alto: 5,
    largo: 10,
    calcularArea(){
        return this.lado ** 2; 
    }
}

const triangulo = {
    base : 13,
    altura : 10,
    calcularArea(){
        return (base * altura) / 2
    }
}

const calcularArea = (poligono)=> {
    if(poligono && typeof poligono == 'Object' && poligono.hasOwnProperty("calcularArea")){
        console.log(calcularArea());
    }
    throw Error("el valor ingresado no es un poligono valido"); 
}; 


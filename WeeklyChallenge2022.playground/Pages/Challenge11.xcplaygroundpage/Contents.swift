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

fn main() {
    get_unique_characters("hola", "lados")
}

fn get_unique_characters(str1: &str, str2: &str) {

    let n_str1: String = str1
        .chars()
        .filter(|c| {
            let value = str2.find(*c);
            value.is_none()
        })
        .collect();

    let n_str2: String = str2
    .chars()
    .filter(|c| {
        let value = str1.find(*c);
        value.is_none()
    })
    .collect();

    println!("{} {}", n_str1, n_str2);
}

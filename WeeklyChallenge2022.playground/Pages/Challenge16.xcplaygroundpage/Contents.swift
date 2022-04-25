import Foundation

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
 */

fn main() {
    let text = "
 Enunciado: Crea una función que reciba un String de cualquier tipo y se encargue de
 poner en mayúscula la primera letra de cada palabra.
 - No se pueden utilizar operaciones del lenguaje que lo resuelvan directamente.
 Información adicional:
 - Usa el canal de nuestro discord (https://mouredev.com/discord) \"🔁reto-semanal\" para preguntas, dudas o prestar ayuda a la comunidad.
 - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.otra cosa.[mas cosa]
";

    println!("{}", get_first_word_uppercase(text))
}

fn get_first_word_uppercase(text: &str) -> String {
    let mut new_text = to_first_word_uppercase(text, " ");

    let input = new_text.as_str();
    new_text = to_first_word_uppercase(input, ",");

    let input = new_text.as_str();
    new_text = to_first_word_uppercase(input, ".");

    // tal vez ...
    let input = new_text.as_str();
    new_text = to_first_word_uppercase(input, "/");

    new_text
}

fn to_first_word_uppercase(text: &str, sep: &str) -> String {
    let words: Vec<&str> = text.split(sep).collect();

    let words: Vec<String> = words.iter().map(|word| {
        let mut has_upper: bool = false;

        let upper_word: String = word.chars().map(|c| {
            if c.is_alphabetic() && !has_upper {
                has_upper = true;
                let char_upper: Vec<_> = c.to_uppercase().collect();
                return char_upper[0];
            }

            c
        }).collect();

        upper_word
    }).collect();

    let res: String = words.join(sep);
    res
}

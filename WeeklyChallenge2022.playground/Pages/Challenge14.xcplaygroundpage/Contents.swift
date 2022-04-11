import Foundation

/*
 * Reto #14
 * ¿ES UN NÚMERO DE ARMSTRONG?
 * Fecha publicación enunciado: 04/04/22
 * Fecha publicación resolución: 11/04/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Escribe una función que calcule si un número dado es un número de Armstrong (o también llamado narcisista).
 * Si no conoces qué es un número de Armstrong, debes buscar información al respecto.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

fn main() {
    println!("{}", is_armstrong_number(371));
    println!("{}", is_armstrong_number(8208));
    println!("{}", is_armstrong_number(4210818));
    println!("{}", is_armstrong_number(2015));
}

fn is_armstrong_number(number: u32) -> bool {
    let num_str = number.to_string();
    let num_len = num_str.len() as u32;

    let sum = num_str.chars()
        .map(|c| c.to_digit(10).unwrap())
        .map(|d| d.pow(num_len))
        .sum();

    number == sum
}

/* fn is_armstrong_number(number: u64) -> bool {
    let mut raised = 0;
    let power = number.to_string().len() as u32;

    let mut number_in = number;

    while number_in != 0 {
        let remaining = number_in % 10;
        raised += remaining.pow(power);
        number_in /= 10;
    }

    raised == number
} */

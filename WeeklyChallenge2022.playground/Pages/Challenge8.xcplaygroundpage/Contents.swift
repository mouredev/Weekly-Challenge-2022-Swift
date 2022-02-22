import Foundation

/*
 * Reto #8
 * DECIMAL A BINARIO
 * Fecha publicación enunciado: 18/02/22
 * Fecha publicación resolución: 02/03/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea un programa se encargue de transformar un número decimal a binario sin utilizar funciones propias del lenguaje que lo hagan directamente.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda la acomunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */
fn parse_binary(mut decimal_number: u32) -> String {
    let mut binary_number = String::from("");

    while decimal_number > 0 {
        let digit = decimal_number % 2;
        decimal_number = decimal_number / 2;
        binary_number = format!("{}{}", digit, binary_number);
    }

    binary_number
}

#[test]
fn test_parse_binary() {
    let decimal_number: u32 = 15;
    let res = parse_binary(decimal_number);
    let binary_ok = format!("{:b}", decimal_number);
    assert_eq!(res, binary_ok);

    let decimal_number: u32 = 145;
    let res = parse_binary(decimal_number);
    let binary_ok = format!("{:b}", decimal_number);
    assert_eq!(res, binary_ok);

    let decimal_number: u32 = 512;
    let res = parse_binary(decimal_number);
    let binary_ok = format!("{:b}", decimal_number);
    assert_eq!(res, binary_ok);

    let decimal_number: u32 = 1024;
    let res = parse_binary(decimal_number);
    let binary_ok = format!("{:b}", decimal_number);
    assert_eq!(res, binary_ok);

    let decimal_number: u32 = 500000;
    let res = parse_binary(decimal_number);
    let binary_ok = format!("{:b}", decimal_number);
    assert_eq!(res, binary_ok);
}

fn parse_binary_pretty(mut decimal_number: u32) -> String {
    let mut binary_number = String::from("");

    while decimal_number > 0 {
        let digit = decimal_number % 2;
        decimal_number = decimal_number / 2;
        binary_number = format!("{}{}", digit, binary_number);
    }

    let size = binary_number.len();
    let num_zero = size % 8;
    if num_zero > 0 {
        let is_odd = (num_zero % 2) > 0;

        let num_zero = 8 - num_zero;

        for _i in 0..num_zero {
            binary_number.insert(0, '0');
        }

        if is_odd {
            for _i in 0..8 {
                binary_number.insert(0, '0');
            }
        }
    }

    let size = binary_number.len();
    let num_space = size / 8;
    if num_space > 1 {
        let mut j = 0;
        for i in 1..num_space {
            binary_number.insert((i * 8) + j, ' ');
            j += 1;
        }
    }

    binary_number
}

import Foundation

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
#[test]
fn test_balanced() {
    let expression = "{ [ a * ( c + d ) ] - 5 }";
    let is_balanced = is_balanced_expression(expression);
    assert_eq!(is_balanced, true);

    let expression = "{ a * ( c + d ) ] - 5 }";
    let is_balanced = is_balanced_expression(expression);
    assert_eq!(is_balanced, false);
}

fn is_balanced_expression(expression: &str) -> bool {
    const PARENTHESIS_OPEN: char = '(';
    const BRACE_OPEN: char = '{';
    const BRACKET_OPEN: char = '[';
    const PARENTHESIS_CLOSE: char = ')';
    const BRACE_CLOSE: char = '}';
    const BRACKET_CLOSE: char = ']';

    let mut stack: Vec<char> = vec![];

    let balanced = expression.chars().find(|c| {
        let is_open = c.eq(&PARENTHESIS_OPEN) || c.eq(&BRACE_OPEN) || c.eq(&BRACKET_OPEN);
        if is_open {
            stack.push(*c);

            return false
        }

        let err = match c {
            &PARENTHESIS_CLOSE => {
                let pop = stack.pop();
                if let Some(character) = pop {
                    if character.eq(&PARENTHESIS_OPEN) {
                        return false;
                    }
                }

                return true;
            }
            &BRACE_CLOSE => {
                let pop = stack.pop();
                if let Some(character) = pop {
                    if character.eq(&BRACE_OPEN) {
                        return false;
                    }
                }

                return true;
            }
            &BRACKET_CLOSE => {
                let pop = stack.pop();
                if let Some(character) = pop {
                    if character.eq(&BRACKET_OPEN) {
                        return false;
                    }
                }

                return true;
            }
            _ => false,
        };

        err 
    });

    balanced.is_none() && stack.len() == 0
}

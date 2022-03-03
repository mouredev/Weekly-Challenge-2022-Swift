import Foundation

/*
 * Reto #9
 * CÓDIGO MORSE
 * Fecha publicación enunciado: 02/03/22
 * Fecha publicación resolución: 07/03/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea un programa que sea capaz de transformar texto natural a código morse y viceversa.
 * - Debe detectar automáticamente de qué tipo se trata y realizar la conversión.
 * - En morse se soporta raya "—", punto ".", un espacio " " entre letras o símbolos y dos espacios entre palabras "  ".
 * - El alfabeto morse soportado será el mostrado en https://es.wikipedia.org/wiki/Código_morse.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */
use std::collections::HashMap;

struct Morse<'a> {
    dictionary: HashMap<char, &'a str>,
}

impl<'a> Morse<'a> {
    fn new() -> Self {
        let mut morse = Morse {
            dictionary: HashMap::new(),
        };

        morse.dictionary.insert('a', ".-");
        morse.dictionary.insert('b', "-...");
        morse.dictionary.insert('c', "-.-.");
        morse.dictionary.insert('d', "-..");
        morse.dictionary.insert('e', ".");
        morse.dictionary.insert('f', "..-.");
        morse.dictionary.insert('g', "--.");
        morse.dictionary.insert('h', "....");
        morse.dictionary.insert('i', "..");
        morse.dictionary.insert('j', ".---");
        morse.dictionary.insert('k', "-.-");
        morse.dictionary.insert('l', ".-..");
        morse.dictionary.insert('m', "--");
        morse.dictionary.insert('n', "-.");
        morse.dictionary.insert('o', "---");
        morse.dictionary.insert('p', ".--.");
        morse.dictionary.insert('q', "--.-");
        morse.dictionary.insert('r', ".-.");
        morse.dictionary.insert('s', "...");
        morse.dictionary.insert('t', "-");
        morse.dictionary.insert('u', "..-");
        morse.dictionary.insert('v', "...-");
        morse.dictionary.insert('w', ".--");
        morse.dictionary.insert('x', "-..-");
        morse.dictionary.insert('y', "-.--");
        morse.dictionary.insert('z', "--..");
        morse.dictionary.insert('1', ".----");
        morse.dictionary.insert('2', "..---");
        morse.dictionary.insert('3', "...--");
        morse.dictionary.insert('4', "....-");
        morse.dictionary.insert('5', ".....");
        morse.dictionary.insert('6', "-....");
        morse.dictionary.insert('7', "--...");
        morse.dictionary.insert('8', "---..");
        morse.dictionary.insert('9', "----.");
        morse.dictionary.insert('0', "-----");
        morse.dictionary.insert('.', ".-.-.-");
        morse.dictionary.insert(',', "--..--");
        morse.dictionary.insert('?', "..--..");
        morse.dictionary.insert('\'', ".-..-.");
        morse.dictionary.insert('/', "-..-.");
        morse.dictionary.insert(' ', "");

        morse
    }

    fn to_code(&self, msg: &str) -> String {
        let mut codes: Vec<&str> = Vec::new();
        let msg = msg.to_lowercase().to_string();

        msg.chars().for_each(|c| {
            let value = self.dictionary.get(&c);
            if let Some(m) = value {
                codes.push(m);
            }
        });

        codes.join(" ").to_string()
    }

    fn to_symbol(&self, msg: &str) -> String {
        let mut msg_symbol: Vec<String> = Vec::new();
        let values: Vec<(&char, &&str)> = self.dictionary.iter().collect();

        let words = msg.split("  ");
        for word in words {
            if !word.eq("") {
                let mut characters: Vec<char> = Vec::new();
                let codes = word.split(" ");
                for code in codes {
                    if !code.eq("") {
                        let value = values.iter().find(|(_, s)| code.eq(**s));
                        if let Some(v) = value {
                            characters.push(*v.0);
                        }
                    }
                }

                if characters.len() > 0 {
                    let word: String = characters.iter().collect();
                    msg_symbol.push(word);
                }

            } else {
                let empty = String::from(word);
                msg_symbol.push(empty);
            }
        }

        msg_symbol.join(" ").to_string()
    }
}

fn main() {
}

#[test]
fn test_morse() {
    let input_msg = "my name is jamsmendez";
    let input_morse = "-- -.--  -. .- -- .  .. ...  .--- .- -- ... -- . -. -.. . --..";

    let morse = Morse::new();

    let msg_morse = morse.to_code(input_msg);
    let msg_symbol = morse.to_symbol(input_morse);

    assert_eq!(input_morse, msg_morse);
    assert_eq!(input_msg, msg_symbol);

    let input_msg = "solucion del reto 09";
    let input_morse = "... --- .-.. ..- -.-. .. --- -.  -.. . .-..  .-. . - ---  ----- ----.";

    let msg_morse = morse.to_code(input_msg);
    let msg_symbol = morse.to_symbol(input_morse);

    assert_eq!(input_morse, msg_morse);
    assert_eq!(input_msg, msg_symbol);
}

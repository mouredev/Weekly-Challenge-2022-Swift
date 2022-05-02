import Foundation

/*
 * Reto #17
 * LA CARRERA DE OBSTÁCULOS
 * Fecha publicación enunciado: 25/04/22
 * Fecha publicación resolución: 02/05/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea una función que evalúe si un/a atleta ha superado correctamente una
 * carrera de obstáculos.
 * - La función recibirá dos parámetros:
 *      - Un array que sólo puede contener String con las palabras "run" o "jump"
 *      - Un String que represente la pista y sólo puede contener "_" (suelo) o "|" (valla)
 * - La función imprimirá cómo ha finalizado la carrera:
 *      - Si el/a atleta hace "run" en "_" (suelo) y "jump" en "|" (valla) será correcto y no
 *        variará el símbolo de esa parte de la pista.
 *      - Si hace "jump" en "_" (suelo), se variará la pista por "x".
 *      - Si hace "run" en "|" (valla), se variará la pista por "/".
 * - La función retornará un Boolean que indique si ha superado la carrera.
 * Para ello tiene que realizar la opción correcta en cada tramo de la pista.
 * 
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

const JUM: &str = "jum";
const RUN: &str = "run";
const GROUND: char = '_';
const FENCE: char = '|';
const SLASH: char = '/';
const X: char = 'x';

fn is_race_overcame(actions: &[&str], track: &str) -> bool {
    let track_elements: Vec<char> = track
        .chars()
        .collect();

    let actions_size = actions.len();
    let track_size = track_elements.len();

    let mut is_ok = actions_size == track_size;

    let new_track: String = track_elements
        .iter()
        .enumerate()
        .map(|(i, c)| {
            let mut action: &str = "";
            if i < actions_size {
                action = actions[i];
            }

            let character: char = match *c {
                GROUND => {
                    if action != RUN {
                        is_ok = false;

                        return X;
                    }

                    return *c;
                }
                FENCE => {
                    if action != JUM {
                        is_ok = false;

                        return SLASH;
                    }

                    return *c;
                }
                _ => *c,
            };

            character
        })
        .collect();

    println!("{:?}", new_track);

    is_ok
}

fn main() {
    let track: &str = "__|_";
    let actions: [&str; 4] = ["run", "run", "jum", "run"];
    let res = is_race_overcame(&actions, track);

    println!("{}", res);

    let track: &str = "__|_";
    let actions: [&str; 4] = ["jum", "run", "run", "run"];
    let res = is_race_overcame(&actions, track);

    println!("{}", res);

    let track: &str = "___";
    let actions: [&str; 4] = ["jum", "run", "run", "run"];
    let res = is_race_overcame(&actions, track);

    println!("{}", res);
}

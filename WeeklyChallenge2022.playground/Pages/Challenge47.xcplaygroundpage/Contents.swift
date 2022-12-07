//import Foundation

/*
 * Reto #47
 * VOCAL MÁS COMÚN
 * Fecha publicación enunciado: 21/11/22
 * Fecha publicación resolución: 28/11/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea un función que reciba un texto y retorne la vocal que más veces se repita.
 * - Ten cuidado con algunos casos especiales.
 * - Si no hay vocales podrá devolver vacío. 
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal"
 *   para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en
 *   https://retosdeprogramacion.com/semanales2022.
 *
 */
#![allow(dead_code)]

type Charcountpair = (char,u32);
fn most_repeated_vowel(text: &str) -> char {
    let mut count: [Charcountpair;5] = [('a',0), ('e', 0), ('i',0), ('o', 0), ('u', 0)];
    for char in text.chars() {
        if is_a_repeated(char) {
            count[0].1 += 1;
        }
        else if is_e_repeated(char) {
            count[1].1 += 1;
        }
        else if is_i_repeated(char) {
            count[2].1 += 1;
        }
        else if is_o_repeated(char) {
            count[3].1 +=1;
        }
        else if is_u_repeated(char) {
            count[4].1 += 1;
        }
    }

    let mut it = count.iter();
    let mut temp = it.next().unwrap();

    for n in it {
        temp = greater_number(&n, &temp);
    }
    temp.0
}


fn greater_number<'a>(a: &'a Charcountpair, b: &'a Charcountpair) -> &'a Charcountpair {
    if a.1 >= b.1 {
        return a;
    }
    return b;
}

fn is_a_repeated(s: char) -> bool {
    s == 'a' || s == 'A' //|| s == 'á' || s == 'à' || s == 'Á' || s == 'À' || s == 'Â' || s == 'â' || s == 'ä' || s == 'Ä'
}


fn is_e_repeated(s: char) -> bool {
    s == 'e' || s == 'E' //|| s == 'è' || s == 'é' || s == 'ê' || s == 'ë'  || s == 'É' || s == 'Ê' || s == 'È' || s == 'Ë'
}

fn is_i_repeated(s: char) -> bool {
    s == 'i'  || s == 'I' //|| s == 'ì' || s == 'í' || s == 'î' || s == 'ï' || s == 'Í' || s == 'Ì' || s == 'Î' || s == 'Ï'
}

fn is_o_repeated(s: char) -> bool {
    s == 'o' || s == 'O' //|| s == 'ó' || s == 'ô' || s == 'ò' || s == 'ö'  || s == 'Ó' || s == 'Ò' || s == 'Ö' || s == 'Ô' 
}
fn is_u_repeated(s: char) -> bool {
    s == 'u' || s == 'U' //|| s == 'ú' || s == 'ù' || s == 'û' || s == 'ü'  || s == 'Ü' || s == 'Ú' || s == 'Û' || s == 'Ù'
}
fn main() -> () {
    ()
}

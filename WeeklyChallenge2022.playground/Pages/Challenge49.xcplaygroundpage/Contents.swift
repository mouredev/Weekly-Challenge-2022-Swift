//import Foundation

/*
 * Reto #49
 * EL DETECTOR DE HANDLES
 * Fecha publicación enunciado: 05/11/22
 * Fecha publicación resolución: 12/12/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea una función que sea capaz de detectar y retornar todos los handles de un texto usando solamente Expresiones Regulares.
 * Debes crear una expresión regular para cada caso:
 * - Handle usuario: Los que comienzan por "@"
 * - Handle hashtag: Los que comienzan por "#"
 * - Handle web: Los que comienzan por "www.", "http://", "https://" y finalizan con un dominio (.com, .es...)
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal"
 *   para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en
 *   https://retosdeprogramacion.com/semanales2022.
 *
 */
#[allow(dead_code)]
fn detector_handle_at<'a>(s: &'a String) -> std::vec::Vec::<&'a str> {
    let mut ret = std::vec::Vec::<&'a str>::new();
    let palabras = s.split(' ');
    for palabra in palabras {
        if palabra.starts_with("@") {
            ret.push(palabra);
        }
    }
    ret
 }

#[allow(dead_code)]
fn detector_handle_hashtag<'a>(s: &'a String) -> std::vec::Vec::<&'a str> {

    let mut ret = std::vec::Vec::<&'a str>::new();
    let palabras = s.split(' ');
    for palabra in palabras {
        if palabra.starts_with("#") {
            ret.push(palabra);
        }
    }
    ret
 }
#[allow(dead_code)]
fn detector_handle_web<'a> (s: &'a String) -> std::vec::Vec::<&'a str> {
    
    let mut ret = std::vec::Vec::<&'a str>::new();
    let palabras = s.split(' ');
    for palabra in palabras {
        if (palabra.starts_with("www.") || palabra.starts_with("https://") || palabra.starts_with("http://")) && 
            (palabra.ends_with(".com") || palabra.ends_with(".es") || palabra.ends_with(".net")) {

            ret.push(palabra);
        }
    }
    ret
 }

fn main() -> () {
    return;
}

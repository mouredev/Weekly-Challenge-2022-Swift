import Foundation

/*
 * Reto #12
 * ¿ES UN PALÍNDROMO?
 * Fecha publicación enunciado: 21/03/22
 * Fecha publicación resolución: 28/03/22
 * Dificultad: MEDIA
 *
 * Enunciado: Escribe una función que reciba un texto y retorne verdadero o falso (Boolean) según sean o no palíndromos.
 * Un Palíndromo es una palabra o expresión que es igual si se lee de izquierda a derecha que de derecha a izquierda.
 * NO se tienen en cuenta los espacios, signos de puntuación y tildes.
 * Ejemplo: Ana lleva al oso la avellana.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */
fn main() {
    println!("{}", is_palindrome("Ana lleva al oso la avellana."));
    println!("{}", is_palindrome("Adivina ya te opina, ya ni miles origina, ya ni cetro me domina, ya ni monarcas, a repaso ni mulato carreta, acaso nicotina, ya ni cita vecino, anima cocina, pedazo gallina, cedazo terso nos retoza de canilla goza, de pánico camina, ónice vaticina, ya ni tocino saca, a terracota luminosa pera, sacra nómina y ánimo de mortecina, ya ni giros elimina, ya ni poeta, ya ni vida"));
    println!("{}", is_palindrome("¿Qué os ha parecido el reto?"));
}

fn is_palindrome(text: &str) -> bool {
    let text_lower = text.to_lowercase();
    let text_min = remove_diacritics(text_lower.as_str()); 

    let text_min: String = text_min.chars().filter(|c| c.is_alphanumeric()).collect();
    let text_min_reverse: String = text_min.chars().rev().collect();

    text_min.eq(&text_min_reverse)
}

fn remove_diacritics(string: &str) -> String {
    let chars = string.chars();
    chars.fold("".to_string(), |acc, c| acc + &find_char_match(c))
}

fn find_char_match(c: char) -> String {
    match c {
        'À' | 'Á' | 'Â' | 'Ã' | 'Ä' | 'Å' | 'Æ' => "A".to_string(),
        'Þ' => "B".to_string(),
        'Ç' | 'Č' => "C".to_string(),
        'Ď' | 'Ð' => "D".to_string(),
        'Ě' | 'È' | 'É' | 'Ê' | 'Ë' => "E".to_string(),
        'Ƒ' => "F".to_string(),
        'Ì' | 'Í' | 'Î' | 'Ï' => "I".to_string(),
        'Ň' | 'Ñ' => "N".to_string(),
        'Ò' | 'Ó' | 'Ô' | 'Õ' | 'Ö' | 'Ø' => "O".to_string(),
        'Ř' => "R".to_string(),
        'ß' => "ss".to_string(),
        'Š' => "S".to_string(),
        'Ť' => "T".to_string(),
        'Ů' | 'Ù' | 'Ú' | 'Û' | 'Ü' => "U".to_string(),
        'Ý' => "Y".to_string(),
        'Ž' => "Z".to_string(),

        'à' | 'á' | 'â' | 'ã' | 'ä' | 'å' | 'æ' => "a".to_string(),
        'þ' => "b".to_string(),
        'ç' | 'č' => "c".to_string(),
        'ď' | 'ð' => "d".to_string(),
        'ě' | 'è' | 'é' | 'ê' | 'ë' => "e".to_string(),
        'ƒ' => "f".to_string(),
        'ì' | 'í' | 'î' | 'ï' => "i".to_string(),
        'ñ' | 'ň' => "n".to_string(),
        'ò' | 'ó' | 'ô' | 'õ' | 'ö' | 'ø' => "o".to_string(),
        'ř' => "r".to_string(),
        'š' => "s".to_string(),
        'ť' => "t".to_string(),
        'ů' | 'ù' | 'ú' | 'û' | 'ü' => "u".to_string(),
        'ý' | 'ÿ' => "y".to_string(),
        'ž' => "z".to_string(),
        _ => c.to_string(),
    }
}

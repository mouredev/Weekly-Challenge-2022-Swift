import Foundation

/*
 * Reto #7
 * CONTANDO PALABRAS
 * Fecha publicación enunciado: 14/02/22
 * Fecha publicación resolución: 21/02/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea un programa que cuente cuantas veces se repite cada palabra y que muestre el recuento final de todas ellas.
 * - Los signos de puntuación no forman parte de la palabra.
 * - Una palabra es la misma aunque aparezca en mayúsculas y minúsculas.
 * - No se pueden utilizar funciones propias del lenguaje que lo resuelvan automáticamente.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda la acomunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */
use std::{collections::HashMap};

fn main() {
	let text = "Astronomer Amy Mainzer spent hours chatting with Leonardo DiCaprio for Netflix's 'Don't Look Up', Amy Mainzer chatting with Leonardo DiCaprio.";

	let values = get_counter(text);

	for (word, value) in values.iter() {
		println!("{}: {}", word, value)
	}
}

fn get_counter(text: &str) -> HashMap<String, u32> {
    let mut word_values: HashMap<String, u32> = HashMap::new();
	let lower_text = text.to_lowercase();
	let words: Vec<&str> = lower_text.split(' ').collect();

	for word in words {
		let word_safe: String = word.chars().filter(|c|!c.is_ascii_punctuation()).collect();
		let value = word_values.entry(word_safe).or_insert(0);
		*value += 1;	
	}

	word_values
}
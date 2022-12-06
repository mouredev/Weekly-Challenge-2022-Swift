//import Foundation

/*
 * Reto #48
 * EL CALENDARIO DE ADEVIENTO 2022
 * Fecha publicación enunciado: 28/11/22
 * Fecha publicación resolución: 05/12/22
 * Dificultad: FÁCIL
 *
 * ¿Conoces el calendario de adviento de la comunidad (https://adviento.dev)?
 * 24 días, 24 regalos sorpresa relacionados con desarrollo de software, ciencia y tecnología desde el 1 de diciembre.
 *
 * Enunciado: Crea una función que reciba un objeto de tipo "Date" y retorne lo siguiente:
 * - Si la fecha coincide con el calendario de aDEViento 2022: Retornará el regalo de ese día (a tu elección) y cuánto queda para que finalice el sorteo de ese día.
 * - Si la fecha es anterior: Cuánto queda para que comience el calendario.
 * - Si la fecha es posterior: Cuánto tiempo ha pasado desde que ha finalizado.
 *
 * Notas:
 * - Tenemos en cuenta que cada día del calendario comienza a medianoche 00:00:00 y finaliza a las 23:59:59.
 * - Debemos trabajar con fechas que tengan año, mes, día, horas, minutos y segundos.
 * - 🎁 Cada persona que aporte su solución entrará en un nuevo sorteo del calendario de aDEViento hasta el día de su corrección (sorteo exclusivo para quien entregue su solución).
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal"
 *   para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en
 *   https://retosdeprogramacion.com/semanales2022.
 *
 */

 static PREMIOS: [&'static str; 24] = [
    "PLAY 4", //1
    "Play 5", //2
    "Xbox", //3
    "Xbox360", //4
    "PS vita", //5
    "Teclado", //6
    "Teclado gammer", //7
    "Ratón", //8
    "Ratón gammer",  //9
    "Portatil MSI", //10
    "Nvidia GTX 3060", //11
    "Ferrari", //12
    "Gominolas", //13
    "1 Año de café", //14
    "1 Año de cerveza", //15
    "1 Año de cocacola", //16
    "Monitor MSI", //17
    "Mac book air", //18
    "Altavoz", //19
    "Air pods", //20
    "Samsung s22",  //21
    "Caja sorpresa", //22
    "Flash USB", //23
    "Disquetera 5 1/2"]; //24
mod datetime;
use datetime::Datetime;

fn check_date(date: &Datetime) -> Result<(&'static str, Datetime), Datetime> {
    let f_ini: Datetime = Datetime::new(2022,12,1,0,0,0);
    let f_fin: Datetime = Datetime::new(2022,12,24,23,59,59);

    if date < &f_ini {
        return Err(f_ini - *date);
    }

    else if date > &f_fin {
        return Err(*date - f_fin);
    }
    else {
        let i: usize = date.day.into();
        return Ok((PREMIOS[i], f_fin - *date));
    }
}

fn main() -> () {
    return;
}
//import Foundation

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


fn resultado_carrera(acciones: &Vec::<String>, pista: &mut String) -> Result<bool, String> {

    let chars_pista = pista.chars();
    let z = chars_pista.zip(acciones.iter());

    let mut result: Result<bool, String> = Ok(true);

    let pista_modificada : String= z.map (|(p, a)| {

            let r : Result<bool, String> = result.clone();
            if p == '_' {
                if a ==  "jump" {
                    result = Ok(false);
                    return 'x';          
                }
                else if a == "run" {
                    result = r.and_then(|x| { Ok(x && true)});
                }
                else {
                    result = Err("Accion invalida".to_string());
                }
            }

            else if p == '|' {

                if a == "run" {
                    result = Ok(false);
                    return '/';
                }
                else if a == "jump" {
                    result = r.and_then(|x| {Ok(x && true)});
                }
                else {
                    result = Err("Accion invalida".to_string());
                }
                
            }
            else {
                result = Err("Pista invalida".to_string());
            }
            return p; 
        })
        .collect();

    *pista = pista_modificada.clone();
    result
 }


 fn main() {
 }

 #[test]
 fn test1() {
    let s_run = "run".to_string();
    let s_jump = "jump".to_string();
    let mut pista1 = "___|__|_|_|_|_".to_string();
    let mut pista2 = "_|_|__|_|_|___".to_string();
    let accion : Vec<String> = Vec::from([
        s_run.clone(),
        s_run.clone(),
        s_run.clone(),
        s_jump.clone(),
        s_run.clone(),
        s_run.clone(),
        s_jump.clone(),
        s_run.clone(),
        s_jump.clone(),
        s_run.clone(),
        s_jump.clone(),
        s_run.clone(),
        s_jump.clone(),
        s_run.clone()]);

    let resultado1 = resultado_carrera(&accion, &mut pista1);
    let resultado2 = resultado_carrera(&accion, &mut pista2);

    assert_eq!(resultado1, Ok(true));
    assert_eq!(resultado2, Ok(false));
    assert_eq!(pista2, "_/_|__|_|_|_x_");

 }


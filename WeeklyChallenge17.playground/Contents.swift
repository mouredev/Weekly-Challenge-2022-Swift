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

enum AccionesAtleta: String {
    case run = "_"
    case jump = "|"
}

func resultadoCarrera(carrera:[AccionesAtleta], pista: String) -> Bool {
    
    var resultadoCarrera : String = ""
    
    let pistaArray = Array(pista)
    
    if carrera.count == pistaArray.count {
        for i in 0...carrera.count-1{
            switch carrera[i] {
            case .run:
                resultadoCarrera += pistaArray[i] == "_" ? carrera[i].rawValue : "x"
            case .jump:
                resultadoCarrera += pistaArray[i] == "|" ? carrera[i].rawValue : "/"
            }
        }
    } else {
        return false
    }
    
    return resultadoCarrera == pista
}



print(resultadoCarrera(carrera: [.run, .jump, .run, .jump, .run], pista: "_|_|_"))
print(resultadoCarrera(carrera: [.run, .run, .run, .jump, .run], pista: "_|_|_"))
print(resultadoCarrera(carrera: [.run, .run, .jump, .jump, .run], pista: "_|_|_"))
print(resultadoCarrera(carrera: [.run, .run, .jump, .jump, .run], pista: "_|_|_|_"))
print(resultadoCarrera(carrera: [.run, .jump, .run, .jump], pista: "_|_|_"))
print(resultadoCarrera(carrera: [.run, .jump, .run, .jump, .run, .jump, .run], pista: "_|_|_"))
print(resultadoCarrera(carrera: [.jump, .jump, .jump, .jump, .jump], pista: "|||||"))
print(resultadoCarrera(carrera: [.jump, .jump, .jump, .jump, .jump], pista: "||?||"))



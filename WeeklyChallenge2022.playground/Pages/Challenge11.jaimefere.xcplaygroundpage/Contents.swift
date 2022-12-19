import Foundation

/*
 * Reto #11
 * ELIMINANDO CARACTERES
 * Fecha publicación enunciado: 14/03/22
 * Fecha publicación resolución: 21/03/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea una función que reciba dos cadenas como parámetro (str1, str2) e imprima otras dos cadenas como salida (out1, out2).
 * - out1 contendrá todos los caracteres presentes en la str1 pero NO estén presentes en str2.
 * - out2 contendrá todos los caracteres presentes en la str2 pero NO estén presentes en str1.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */


func printExclusiveChars(str1: String, str2: String) {
    print("out1: \(str1.filter{ !str2.contains($0) })")
    print("out2: \(str2.filter{ !str1.contains($0) })")
    print()
}

printExclusiveChars(str1: "Enunciado: Crea una función que reciba dos cadenas como parámetro (str1, str2) e imprima otras dos cadenas como salida (out1, out2).",
                    str2: "- out1 contendrá todos los caracteres presentes en la str1 pero NO estén presentes en str2.")
printExclusiveChars(str1: "Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.",
                    str2: "Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.")
printExclusiveChars(str1: "- out1 contendrá todos los caracteres presentes en la str1 pero NO estén presentes en str2.",
                    str2: "- out2 contendrá todos los caracteres presentes en la str2 pero NO estén presentes en str1.")

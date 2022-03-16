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

extension String {
    
    func remove(compare: String) -> String {
        var copy = self
        compare.uppercased().forEach {
            if let index = copy.uppercased().firstIndex(of: $0) {
                copy.remove(at: index)
            }
        }
        return copy
    }
}

func removeCharacter(first: String, second: String){
    print(first.remove(compare: second))
    print(second.remove(compare: first))
}

removeCharacter(first: "hola", second: "lados")
removeCharacter(first: "Esto es una prueba con una larga", second: "Mañana estoy en una prueba")
print("hola".remove(compare: "lados").elementsEqual("h"))
print("lados".remove(compare: "hola").elementsEqual("ds"))

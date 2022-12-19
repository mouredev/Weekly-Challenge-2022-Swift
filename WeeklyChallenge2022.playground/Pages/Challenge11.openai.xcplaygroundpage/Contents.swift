import Foundation

/*
 * Reto #11
 * ELIMINANDO CARACTERES
 * Fecha publicación enunciado: 14/03/22
 * Fecha publicación resolución: 21/03/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea una función en Swift que reciba dos cadenas como parámetro (str1, str2) e imprima otras dos cadenas como salida (out1, out2).
 * - out1 contendrá todos los caracteres presentes en la str1 pero NO estén presentes en str2.
 * - out2 contendrá todos los caracteres presentes en la str2 pero NO estén presentes en str1.
 *
 * Resuelto: Sí. En 2 iteracciones.
 * Explicación:
 * · Puedes usar la función filter() en conjunto con la propiedad contains() para crear la función que deseas.
 * Conversación:
 * - La salida con out1 y out2 debe imprimirla por pantalla directamente
 * + En este caso, la función ya no devuelve una tupla con las dos cadenas de salida, sino que simplemente las imprime directamente en pantalla.
 * Nota: falla en el comentario de su caso de prueba
 *
 */

func charactersNotInString(_ str1: String, _ str2: String) {
  let out1 = String(str1.filter { !str2.contains($0) })
  let out2 = String(str2.filter { !str1.contains($0) })
    print(out1)
    print(out2)
}

charactersNotInString("hola", "mundo")  // Imprime "ho" y "mu" en pantalla

// Brais cases
charactersNotInString("brais","moure")   // Esto imprimiría "out1: bais" y "out2: moue"
charactersNotInString("Me gusta Java","Me gusta Kotlin") // Esto imprimiría "out1: Jv" y "out2: Kolin"
charactersNotInString("Usa el canal de nuestro discord (https://mouredev.com/discord) \"🔁reto-semanal\" para preguntas, dudas o prestar ayuda a la comunidad.".lowercased(),
    "Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.".lowercased())  // Esto imprimiría "out1: (:///)"🔁-"" y "out2: fkqqó"

// Jaime cases
charactersNotInString("Enunciado: Crea una función que reciba dos cadenas como parámetro (str1, str2) e imprima otras dos cadenas como salida (out1, out2).",
    "- out1 contendrá todos los caracteres presentes en la str1 pero NO estén presentes en str2.")  // Esto imprimiría "out1: Ei:Cfióqibmm(,)imimmi(,)" y "out2: -NOé"
charactersNotInString("Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.",
    "Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.")   // Esto imprimiría "out1: PFkyPqqm" y "out2: éjTwb"
charactersNotInString("- out1 contendrá todos los caracteres presentes en la str1 pero NO estén presentes en str2.",
    "- out2 contendrá todos los caracteres presentes en la str2 pero NO estén presentes en str1.")  // Esto imprimiría "out1: " y "out2: " (las cadenas vacías)

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

func WordCounter(sentence: String){
    var Dict: [String:Int] = [String:Int]()

    let TempArray: [String] = PhraseSplitter(sentence: PhraseCleaner(sentence: sentence))

    for item in TempArray {
        if (Dict[item] == nil) {
            Dict[item] = 1
        } else {
            Dict[item]! += 1
        }
    }
    
    print("Sentence word count: \(sentence)")
    for(key, value) in Dict{
        print(key, value, separator: "...")
    }
    print()
}

// Limpia la frase de los signos de puntuación y pasa todas las letras a minusculas
func PhraseCleaner(sentence: String) -> String {
    let ForbiddenCharacters: [String] = [".", ",", ";", ":", "\u{0022}", "\u{0027}", "(", ")", "!", "¡", "?", "¿", "...", "-", "_"];
    
    var stringTemp = ""
    
    for char: Character in sentence {
        if(!ForbiddenCharacters.contains(String(char))) {
            stringTemp += String(char)
        }
    }
    
    return stringTemp.lowercased()
}

// Separa el string en palabras
func PhraseSplitter(sentence: String) -> [String] {
    let spacer = " "
    var ArrayTemp: [String] = [String]()
    var stringTemp: String = ""
    
    for char: Character in sentence {
        if (String(char) != spacer){
            stringTemp += String(char)
        } else if(stringTemp != "") {
            ArrayTemp.append(stringTemp)
            stringTemp = ""
        }
    }
    
    if (stringTemp != "") {
        ArrayTemp.append(stringTemp)
        stringTemp = ""
    }
    
    return ArrayTemp
}

let Temp: [String] = [
    "Hello world!",
    "Hola hackermens",
    "pampincho, Pampincho; PAMPINCHO- pamPinCho. Parece que FUNCIONA!",
    "tris, tras, trum, tris, TRUS, TRIS, TRIM",
    "Gracias, MIL GRACIAS: por ver mi solución. GRACIAS COMPAÑEROS"
]

for sentence in Temp {
    WordCounter(sentence: sentence)
}


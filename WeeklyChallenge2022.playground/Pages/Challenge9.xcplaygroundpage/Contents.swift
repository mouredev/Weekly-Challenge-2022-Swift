import Foundation

/*
 * Reto #9
 * CÓDIGO MORSE
 * Fecha publicación enunciado: 02/03/22
 * Fecha publicación resolución: 07/03/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea un programa que sea capaz de transformar texto natural a código morse y viceversa.
 * - Debe detectar automáticamente de qué tipo se trata y realizar la conversión.
 * - En morse se soporta raya "—", punto ".", un espacio " " entre letras o símbolos y dos espacios entre palabras "  ".
 * - El alfabeto morse soportado será el mostrado en https://es.wikipedia.org/wiki/Código_morse.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

var diccionario = [String: String]()

diccionario["a"] = ".-"
diccionario["b"] = "-..."
diccionario["c"] = "-.-."
diccionario["d"] = "-.."
diccionario["e"] = "."
diccionario["f"] = "..-."
diccionario["g"] = "--."
diccionario["h"] = "...."
diccionario["i"] = ".."
diccionario["j"] = ".---"
diccionario["k"] = "-.-"
diccionario["l"] = ".-.."
diccionario["m"] = "--"
diccionario["n"] = "-."
diccionario["o"] = "---"
diccionario["p"] = ".--."
diccionario["q"] = "--.-"
diccionario["r"] = ".-."
diccionario["s"] = "..."
diccionario["t"] = "-"
diccionario["u"] = "..-"
diccionario["v"] = "...-"
diccionario["w"] = ".--"
diccionario["x"] = "-..-"
diccionario["y"] = "-.--"
diccionario["z"] = "--.."
diccionario["1"] = ".----"
diccionario["2"] = "..---"
diccionario["3"] = "...--"
diccionario["4"] = "....-"
diccionario["5"] = "....."
diccionario["6"] = "-...."
diccionario["7"] = "--..."
diccionario["8"] = "---.."
diccionario["9"] = "----."
diccionario["0"] = "-----"
diccionario["."] = ".-.-.-"
diccionario[","] = "--..--"
diccionario["?"] = "..--.."
diccionario["\""] = ".-..-."
diccionario["/"] = "-..-."
diccionario[" "] = "/"


func conversorMorse(frase: String) -> String {
    
    var traduccion = ""
    var palabras = frase.split(separator: " ")
    
    if frase.contains(where: {(char) in
        char.isLetter
    }){
        print("No es codigo morse")
        
        for char in frase {
            for key in diccionario{
                if key.key == char.description.lowercased() {

                    traduccion += " \(key.value)"

                }
            }


        }
        return "\(frase) en morse es: \(traduccion)"
    }else{
        print("es codigo morse")
        for palabra in palabras {
           
            for key in diccionario{
                
                if key.value == palabra.lowercased() {
                    
                    traduccion += key.key
                    
                }
                
            }
            
        }
        return "\(frase) en texto es: \(traduccion)"
        
    }
    
}
print(conversorMorse(frase: "Antonio tiene un coche rojo"))
print(conversorMorse(frase: ".- -. - --- -. .. --- / - .. . -. . / ..- -. / -.-. --- -.-. .... . / .-. --- .--- ---"))

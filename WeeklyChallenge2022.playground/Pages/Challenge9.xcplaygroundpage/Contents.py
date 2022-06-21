""" import Foundation

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
 */ """

#Primera Forma
def por_cada_Caracter(palabra: str):
    diccionario = {"a": ".-", "b": "-...", "c": "-.-.", "d": "-..", "e": ".", "f": "..-.",
                   "g": "--.", "h": "....", "i": "..", "j": "·---", "k": "-.-", "l": ".-..",
                   "m": "--", "n": "-.", "ñ": "--.--", "o": "---", "p": ".__.", "q": "--.-",
                   "r": ".-.", "s": "...", "t": "-", "u": "..-", "v": "...-", "w": ".--",
                   "x": "-..-", "y": "-.--", "z": "--..",

                   "0": "-----", "1": ".----", "2": "..---", "3": "...--", "4": "....-",
                   "5": ".....", "6": "-....", "7": "--...", "8": "---..", "9": "----.",

                   ".": ".-.-.-", ",": "-.-.--", "?": "..--..", "\"": ".-..-."}
    if palabra in diccionario:  # Si existe algun caracter de estos, retorna el valor del diccionario
        return diccionario[palabra]
    else:
        return ""


def transformar_morse(palabra: str):
    cadena = ""
    for i in palabra.lower():
        caracter_a_codificar = por_cada_Caracter(i)
        cadena += caracter_a_codificar + " "
    return cadena


def morse_a_Texto_por_caracter(palabra: str):
    diccionario = {"a": ".-", "b": "-...", "c": "-.-.", "d": "-..", "e": ".", "f": "..-.",
                   "g": "--.", "h": "....", "i": "..", "j": "·---", "k": "-.-", "l": ".-..",
                   "m": "--", "n": "-.", "ñ": "--.--", "o": "---", "p": ".__.", "q": "--.-",
                   "r": ".-.", "s": "...", "t": "-", "u": "..-", "v": "...-", "w": ".--",
                   "x": "-..-", "y": "-.--", "z": "--..",

                   "0": "-----", "1": ".----", "2": "..---", "3": "...--", "4": "....-",
                   "5": ".....", "6": "-....", "7": "--...", "8": "---..", "9": "----.",

                   ".": ".-.-.-", ",": "-.-.--", "?": "..--..", "\"": ".-..-."}
    for i in diccionario:
        if diccionario[i] == palabra:
            return i
    return ""


def transformar_texto(palabra: str):
    cadena = ""
    for i in palabra.split(" "):
        resultado = morse_a_Texto_por_caracter(i)
        cadena += resultado
    return cadena

# print(transformar_morse("Emill"))
# print(transformar_texto("."))

#Segunda Forma
def texto_a_morse_o_morse_a_texto(palabra:str):
    cadena=""
    diccionario = {"a": ".-", "b": "-...", "c": "-.-.", "d": "-..", "e": ".", "f": "..-.",
               "g": "--.", "h": "....", "i": "..", "j": "·---", "k": "-.-", "l": ".-..",
               "m": "--", "n": "-.", "ñ": "--.--", "o": "---", "p": ".__.", "q": "--.-",
               "r": ".-.", "s": "...", "t": "-", "u": "..-", "v": "...-", "w": ".--",
               "x": "-..-", "y": "-.--", "z": "--..",
               "0": "-----", "1": ".----", "2": "..---", "3": "...--", "4": "....-",
               "5": ".....", "6": "-....", "7": "--...", "8": "---..", "9": "----.",
               ".": ".-.-.-", ",": "-.-.--", "?": "..--..", "\"": ".-..-."}
    for i in palabra:
        if i !=" " and i.lower() in diccionario:
            cadena+=diccionario[i.lower()]+" "#Agrego la palabra[i] a cadena
        else:
            cadena+=i #Si no existe en el diccionario se concatena i en cadena
    return cadena
            
print(texto_a_morse_o_morse_a_texto("ñ"))


import os
"""
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
"""

codigo_morse = {
    "a": ".-", "b": "-...", "c": "-.-.", "d": "-..", "e": ".", "f": "..-.", 
    "g": "--.", "h": "....", "i": "..", "j": "·---", "k": "-.-", "l": ".-..", 
    "m": "--", "n": "-.", "ñ": "--.--", "o": "---", "p": ".__.", "q": "--.-",
    "r": ".-.", "s": "...", "t": "-", "u": "..-", "v": "...-", "w": ".--",
    "x": "-..-", "y": "-.--", "z": "--..",
    
    "0": "-----", "1": ".----", "2": "..---", "3": "...--", "4": "....-", 
    "5": ".....", "6": "-....", "7": "--...", "8": "---..", "9": "----.",
    
    ".": ".-.-.-", ",": "-.-.--", "?": "..--..", "\"": ".-..-."
}

flag_00 = True


while True:
    if not flag_00:
        break
    while flag_00:
        titol = " C O N V E R S O R   M O R S E "
        print("="*(58 + len(titol)) + "\n" + "="*(60 - len(titol)) + titol + "="*(60 - len(titol)) + "\n"  + "="*(58 + len(titol)))
        print("\n\n" + " "*35 + "1.- Texto a morse\n" + " "*35 + "2.- Morse a texto\n" + " "*35 + "3.- Salir")
        
        opcion = input("\nEscoge una opción: ")
        
        if not opcion.isdigit():
            print("\nOpción inválida")
        elif int(opcion) < 1 or int(opcion) > 3:
            print("\nOpción inválida")
        else:
            opc = int(opcion)
            break
    
    if opc == 1:
        os.system("cls")
        morse = ""
        texto = input("\nTexto a traducir: ").lower()
        
        for i in texto:
            for j,k in codigo_morse.items():
                if i == j:
                    morse+=k
                    morse+=" "
                    
            if i == " ":
                morse+="/ "
                    
        print("\nTexto traducido: " + morse)
        
        input("\nENTER per continuar")
        os.system("cls")
        flag_00 = True
        
    elif opc == 2:
        os.system("cls")
        texto = ""
        morse = input("\nCódigo morse a traducir: ").split(" ")
        
        for i in morse:
            for j,k in codigo_morse.items():
                if i == k:
                    texto+=j
                    
        print("\nTexto traducido: " + texto)
        
        input("\nENTER per continuar")
        os.system("cls")
        flag_00 = True
        
    else:
        flag_00 = False
        
        
            
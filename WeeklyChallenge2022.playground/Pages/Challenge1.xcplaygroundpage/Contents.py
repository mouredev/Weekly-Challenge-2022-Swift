
"""
/*
 * Reto #1
 * ¿ES UN ANAGRAMA?
 * Fecha publicación enunciado: 03/01/22
 * Fecha publicación resolución: 10/01/22
 * Dificultad: MEDIA
 *
 * Enunciado: Escribe una función que reciba dos palabras (String) y retorne verdadero o falso (Bool) según sean o no anagramas.
 * Un Anagrama consiste en formar una palabra reordenando TODAS las letras de otra palabra inicial.
 * NO hace falta comprobar que ambas palabras existan.
 * Dos palabras exactamente iguales no son anagrama.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda la acomunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */
"""

def anagrama(p1,p2):
    
    p1 = p1.lower().replace("á", "a").replace("à", "a").replace("é", "e").replace("è", "e").replace("í", "i").replace("ì", "i").replace("ó", "o").replace("ò", "o").replace("ú", "u").replace("ù", "u")
    p2 = p2.lower().replace("á", "a").replace("à", "a").replace("é", "e").replace("è", "e").replace("í", "i").replace("ì", "i").replace("ó", "o").replace("ò", "o").replace("ú", "u").replace("ù", "u")
    
    aux1 = []
    aux2 = []
    
    for i in p1:
        aux1.append(i)
        
    for i in p2:
        aux2.append(i)
    
    aux1.sort(),aux2.sort()
    
    if aux1 == aux2:
        return True
    else:
        return False


p1 = input("Primera palabra: ")
p2 = input("Segunda palabra: ")

print(anagrama(p1,p2))
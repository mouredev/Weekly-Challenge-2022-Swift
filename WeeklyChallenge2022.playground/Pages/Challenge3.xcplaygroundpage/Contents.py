""" 

/*
 * Reto #3
 * ¿ES UN NÚMERO PRIMO?
 * Fecha publicación enunciado: 17/01/22
 * Fecha publicación resolución: 24/01/22
 * Dificultad: MEDIA
 *
 * Enunciado: Escribe un programa que se encargue de comprobar si un número es o no primo.
 * Hecho esto, imprime los números primos entre 1 y 100.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */ """


def esPrimo(numero:int):
    contador = 0
    cadena=""
    for i in range(1, numero+1):
        if numero % i == 0:
            contador += 1
    if contador == 2:
        cadena=(f"Es primo {numero}")
    return cadena

for i in range(1,101):
    cadena=esPrimo(i)#Cadena = Solo los números primos, -> return cadena    
    if cadena !="":
        print(cadena)



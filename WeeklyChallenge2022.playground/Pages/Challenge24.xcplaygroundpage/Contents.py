""" import Foundation

/*
 * Reto #24
 * ITERATION MASTER
 * Fecha publicación enunciado: 13/06/22
 * Fecha publicación resolución: 20/06/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Quiero contar del 1 al 100 de uno en uno (imprimiendo cada uno). ¿De cuántas maneras eres capaz de hacerlo? Crea el código para cada una de ellas.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */
"""
# Primera Forma
for i in range(1, 101):
    print(i)
# Segunda Forma
""" for i in range(1,101):
    print(i) """
# Tercera Forma
""" i=0
while i <=100:
    print(i)
    i+=1 """
# Cuarta Forma
""" for i in range(1,101,1):
    print(i) """
# Quinta Forma
""" lista=[]
for i in range(0,101):
    lista.append(i)
for i in range(1,len(lista)):
    print(lista[i]) """
# Sexta Forma
""" rango = list(range(101))
for i in rango:
    print(i) """

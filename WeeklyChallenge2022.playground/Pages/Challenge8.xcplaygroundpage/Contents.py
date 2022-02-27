"""
/*
 * Reto #8
 * DECIMAL A BINARIO
 * Fecha publicación enunciado: 18/02/22
 * Fecha publicación resolución: 02/03/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea un programa se encargue de transformar un número decimal a binario sin utilizar funciones propias del lenguaje que lo hagan directamente.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda la acomunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */
"""
listBin = []

print("-"*10 + " CONVERSOR DECIMAL A BINARIO " + "-"*10 + "\n")

num = int(input("Introduzca un nombre decimal: "))
print(f"Número en decimal: {num} => ", end="")

while num != 0:
    modulo = num % 2 
    c = num // 2
    listBin.append(modulo)
    num = c
    
print(f"Número en binario: ",end=""),listBin.reverse()
for i in listBin:
    print(i,end="")
    
    
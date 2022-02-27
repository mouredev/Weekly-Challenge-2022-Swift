"""
 Reto #7
 CONTANDO PALABRAS
 Fecha publicación enunciado: 14/02/22
 Fecha publicación resolución: 21/02/22
 Dificultad: MEDIA

 Enunciado: Crea un programa que cuente cuantas veces se repite cada palabra y que muestre el recuento final de todas ellas.
 - Los signos de puntuación no forman parte de la palabra.
 - Una palabra es la misma aunque aparezca en mayúsculas y minúsculas.
 - No se pueden utilizar funciones propias del lenguaje que lo resuelvan automáticamente.

 Información adicional:
 - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda la acomunidad.
 - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
"""

frase = input("Introduzca una frase: ")

for i in frase:
    if i == ",":
        frase.replace(i," ")
    if i == ".":
        frase.replace("f{i}"," ")

lF = frase.split(" ")
dict = {}

for i in range(len(lF)):
    cont = 0
    for j in range(len(lF)):
        if lF[i].lower() == lF[j].lower():
            cont+=1 
    dict[lF[i]] = cont
    
for i,j in dict.items():
    print(f"Palabra: {i} | Veces en la frase: {j}")       
        


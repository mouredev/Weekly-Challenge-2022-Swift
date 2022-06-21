""" 

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
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */ """


def separadorPalabras(palabra: str):
    listaPalabra = []
    i = 0
    while i < len(palabra):
        cadena = ""
        if palabra[i] != " " and palabra[i] != "," and palabra[i] != ".":
            while palabra[i] != "," and palabra[i] != "." and palabra[i] != " " and i < len(palabra):
                cadena += palabra[i]
                i += 1
                if i == len(palabra):
                    break
            listaPalabra.append(cadena)
        i += 1
    return(listaPalabra)


lista = separadorPalabras("Hola emill logroño hola hola ivan logroño hola")
listaComprobacion = []
for i in range(0, len(lista)):
    cadena = lista[i].lower()
    contador = 0
    for j in range(0, len(lista)):
        if cadena in listaComprobacion:
            a = 0
        elif lista[j] == cadena:
            contador += 1
    listaComprobacion.append(cadena)
    if contador != 0:
        print(f"La palabra {cadena} se repite {contador}")



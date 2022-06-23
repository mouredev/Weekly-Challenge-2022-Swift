"""  * Reto #12
 * ¿ES UN PALÍNDROMO?
 * Fecha publicación enunciado: 21/03/22
 * Fecha publicación resolución: 28/03/22
 * Dificultad: MEDIA
 *
 * Enunciado: Escribe una función que reciba un texto y retorne verdadero o falso (Boolean) según sean o no palíndromos.
 * Un Palíndromo es una palabra o expresión que es igual si se lee de izquierda a derecha que de derecha a izquierda.
 * NO se tienen en cuenta los espacios, signos de puntuación y tildes.
 * Ejemplo: Ana lleva al oso la avellana.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 * """
def quitarSignosDePuntuacion(texto: str):
    cadena = ""
    listaParaNoTomarEnCuenta = ['.', ";", ",",
                                "*", "-", "(", ")",
                                ":", "[", "]", " "]
    for i in texto:
        if i not in listaParaNoTomarEnCuenta:
            cadena += i
    cadena = cadena.lower()  # cadena= cadena en minusculas
    cadena = quitarTildes(cadena)# cadena = la funcion que quita las tildes con cadena 
    return cadena


def quitarTildes(texto: str):
    for i in texto:
        if i == 'á':
            texto = texto.replace(i, 'a')
        elif i == 'é':
            texto = texto.replace(i, 'e')
        elif i == 'í':
            texto = texto.replace(i, 'i')
        elif i == 'ó':
            texto = texto.replace(i, 'o')
        elif i == 'ú':
            texto = texto.replace(i, 'u')
    return texto


def palindromo(texto: str):
    cadena = texto[::-1]  # cadena = al texto dado la vuelta
    if texto == cadena:
        return True
    else:
        return False

cadenaPrueba = quitarSignosDePuntuacion("Yo dono rosas, oro no doy.")
print(palindromo(cadenaPrueba))



""" print(isPalindrome(text: "Ana lleva al oso la avellana."))
print(isPalindrome(text: "Adivina ya te opina, ya ni miles origina, ya ni cetro me domina, ya ni monarcas, a repaso ni mulato carreta, acaso nicotina, ya ni cita vecino, anima cocina, pedazo gallina, cedazo terso nos retoza de canilla goza, de pánico camina, ónice vaticina, ya ni tocino saca, a terracota luminosa pera, sacra nómina y ánimo de mortecina, ya ni giros elimina, ya ni poeta, ya ni vida"))
print(isPalindrome(text: "¿Qué os ha parecido el reto?")) """

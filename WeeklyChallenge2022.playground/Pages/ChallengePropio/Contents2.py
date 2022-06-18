'''
Se requiere que el usuario ingree un numero, luego, que su algortimo verifique
por digito y devuelva el número como respuesta.
Por ejemplo, si ingresa 1234567, los números primos si son 2,3,5,7, la cantidad es 4
'''


def esPrimo(numero: int):
    contador = 0
    cadena = ""
    for i in range(1, numero+1):
        if numero % i == 0:
            contador += 1
    if contador == 2:
        cadena = (f"Es primo {numero}")
    return cadena


entrada = list(input("Digite un número: "))
listaEnteros = [int(x) for x in entrada]  # Transforma lista de str a int
contador = 0
for i in range(0, len(listaEnteros)):
    if esPrimo(listaEnteros[i]):
        print(esPrimo(listaEnteros[i]))
        contador += 1
print(f"La cantidad de números primos es: {contador}")

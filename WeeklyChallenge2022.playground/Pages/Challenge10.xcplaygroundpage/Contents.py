""" 

/*
 * Reto #10
 * EXPRESIONES EQUILIBRADAS
 * Fecha publicación enunciado: 07/03/22
 * Fecha publicación resolución: 14/03/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea un programa que comprueba si los paréntesis, llaves y corchetes de una expresión están equilibrados.
 * - Equilibrado significa que estos delimitadores se abren y cieran en orden y de forma correcta.
 * - Paréntesis, llaves y corchetes son igual de prioritarios. No hay uno más importante que otro.
 * - Expresión balanceada: { [ a * ( c + d ) ] - 5 }
 * - Expresión no balanceada: { a * ( c + d ) ] - 5 }
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */ """


def expresion(expresion_a_definir: str):
    lista = []
    buscador = ""
    contador = 0
    contadorMalvado = 1
    diccionarioInicioDeExpresion = {"{", "[", "("}
    diccionarioFinalDeExpresion = {"}", "]", ")"}
    resultado = True
    for i in range(0, len(expresion_a_definir)):
        if(resultado == True):
            if expresion_a_definir[i] in diccionarioInicioDeExpresion:
                if expresion_a_definir[i] == '{':
                    buscador = '}'
                    x = Buscador(buscador, i, expresion_a_definir, lista)#Se iguala x a la funcion Buscador para saber su lista que ya no se debe buscar y su resultado True o False
                    lista = x['lista']
                    resultado = x['resultado']
                elif expresion_a_definir[i] == '[':
                    buscador = ']'
                    x = Buscador(buscador, i, expresion_a_definir, lista)
                    lista = x['lista']
                    resultado = x['resultado']
                elif expresion_a_definir[i] == '(':
                    buscador = ')'
                    x = Buscador(buscador, i, expresion_a_definir, lista)
                    lista = x['lista']
                    resultado = x['resultado']
            elif expresion_a_definir[i] in diccionarioFinalDeExpresion:
                if i not in lista:
                    resultado = False
                    break
                else:
                    continue

        elif resultado == False:#Si retorna falso ya no se vuelve hacer
            break

    return resultado #Tru si esta bien, False si no encontro

#Funcion busca la expresion de cierre
def Buscador(buscador: str, i: int, expresion_a_definir: str, lista: list):
    resultado = False
    for j in range(i+1, len(expresion_a_definir)):
        if expresion_a_definir[j] == buscador and j not in lista:
            resultado = True
            lista.append(j)
            break

    return {'lista': lista, 'resultado': resultado}#Retorna la lista para no volver a buscar y el resultado True o False
"""
print(isBalanced(expression: "{a + b [c] * (2x2)}}}}"))
print(isBalanced(expression: "{ [ a * ( c + d ) ] - 5 }"))
print(isBalanced(expression: "{ a * ( c + d ) ] - 5 }"))
print(isBalanced(expression: "{a^4 + (((ax4)}"))
print(isBalanced(expression: "{ ] a * ( c + d ) + ( 2 - 3 )[ - 5 }"))
print(isBalanced(expression: "{{{{{{(}}}}}}"))
print(isBalanced(expression: "(a"))
"""
resultado = expresion("(([{5*65456556*5224}]))")

if resultado == True:
    print("Expresion Válida")
else:
    print("Expresion Inválida")




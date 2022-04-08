



print("Es un número de Armstrong." if (number := int(input("Ingrese número:"))) == sum([int(n) ** len(str(number)) for n in str(number)]) else "No es un número de Armstrong.")










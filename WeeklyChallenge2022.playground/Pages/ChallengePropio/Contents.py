'''
imprimir los Numeros primos hasta el 50
'''

for i in range(2,51):
    contador=0
    for j in range(1,i+1):
        if i%j==0:
            contador+=1
        """ if i%1==0:
            contador+=1 """
    if contador==2:
        print(f"{i}")
        


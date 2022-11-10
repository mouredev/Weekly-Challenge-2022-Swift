import Foundation

func contenedorAgua(arreglo:[Int])->Int{
    var inicio = 0
    var fin = arreglo.count - 1
    var suma = 0
    var dif: Int
    
    while inicio != fin {
        let punteroMenor = arreglo[inicio] < arreglo[fin] ? inicio : fin
        if punteroMenor == fin {
            fin -= 1
            dif = arreglo[punteroMenor] - arreglo[fin]
            while dif >= 0 {
                suma += dif
                fin -= 1
                dif = arreglo[punteroMenor] - arreglo[fin]
            }
        } else {
            inicio += 1
            dif = arreglo[punteroMenor] - arreglo[inicio]
            while dif >= 0 {
                suma += dif
                inicio += 1
                dif = arreglo[punteroMenor] - arreglo[inicio]
            }
        }
    }
    
    return suma
}

print(contenedorAgua(arreglo: [4, 0, 3, 6, 1, 3]))
print(contenedorAgua(arreglo: [4,2,5,6,3,2,3]))
print(contenedorAgua(arreglo: [4,0,6,2,3]))

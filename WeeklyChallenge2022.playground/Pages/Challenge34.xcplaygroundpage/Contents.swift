import Foundation

/*
 * Reto #34
 * LOS NÚMEROS PERDIDOS
 * Fecha publicación enunciado: 22/08/22
 * Fecha publicación resolución: 29/08/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Dado un array de enteros ordenado y sin repetidos, crea una función que calcule y retorne todos los que faltan entre el mayor y el menor.
 * - Lanza un error si el array de entrada no es correcto.
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en https://retosdeprogramacion.com/semanales2022.
 *
 */

private func arregloOrdenado(_ n: Int) -> [Int] {
    return Array(Set((0...n).map { _ in .random(in: 0...n)})).sorted()
}

private func arregloDesordenado(_ n: Int) -> [Int] {
    return Array(Set((0...n).map { _ in .random(in: 0...n)}))
}

private func numerosFaltantes(_ arr: [Int]) -> [Int]? {
    
    enum caseStatus {
        case arregloVacio
        case arregloUnElemento
        case arregloDesordenado
        case arregloValido
        case arregloDesconocido
    }
    
    var statusDelArreglo: caseStatus {
        switch true {
        case arr.isEmpty:
            print("El arreglo esta vacio")
            return caseStatus.arregloVacio
        case arr.count == 1:
            print("El arreglo solo tiene un elemento")
            return caseStatus.arregloUnElemento
        case arr != arr.sorted():
            print("El arreglo esta desordenado")
            return caseStatus.arregloDesordenado
        case arr == arr.sorted():
            print("El arreglo es valido")
            return caseStatus.arregloValido
        default:
            return caseStatus.arregloDesconocido
        }
    }
    
    guard statusDelArreglo == caseStatus.arregloValido else {
        return nil
    }
    
    var counter = 0
    var missingNumbers = [Int]()

    while counter < arr.count {
        
        guard (counter + 1) != arr.count else {
            break
        }
        
        guard (arr[counter + 1] - arr[counter]) == 1 else {
            let arr = Array((arr[counter] + 1)..<arr[counter + 1])
            missingNumbers.append(contentsOf: arr)
            counter += 1
            continue
        }
    
        counter += 1
    
    }
    return missingNumbers
}

let arregloValido = arregloOrdenado(20)
let arregloAleatorio = arregloDesordenado(20)
let arregloVacio = [Int]()
let arregloDeUnSoloElemento = [1]

print(numerosFaltantes(arregloValido) ?? "Hay un problema con el arreglo introducido")
print(numerosFaltantes(arregloAleatorio) ?? "Hay un problema con el arreglo introducido")
print(numerosFaltantes(arregloVacio) ?? "Hay un problema con el arreglo introducido")
print(numerosFaltantes(arregloDeUnSoloElemento) ?? "Hay un problema con el arreglo introducido")

import Foundation

/*
 * Reto #1
 * ¿ES UN ANAGRAMA?
 * Fecha publicación enunciado: 03/01/22
 * Fecha publicación resolución: 10/01/22
 * Dificultad: MEDIA
 *
 * Enunciado: Escribe una función en Swift que reciba dos palabras (String) y retorne verdadero o falso (Bool) según sean o no anagramas.
 * - Un Anagrama consiste en formar una palabra reordenando TODAS las letras de otra palabra inicial.
 * - NO hace falta comprobar que ambas palabras existan.
 * - Dos palabras exactamente iguales no son anagrama.
 *
 * Resuelto: No, en los casos en los que debe devolver falso a veces devuelve true.
 * Explicación: Para resolver este problema, podríamos utilizar un diccionario para contar la cantidad de ocurrencias de cada letra en cada palabra. Luego, comparar los dos diccionarios para ver si son iguales. Si lo son, entonces las palabras son anagramas.
 * Nota: no exige poner el nombre de los parámetros de la función. Utiliza tabulación de 2 espacios.
 *
 */

func esAnagrama(_ palabra1: String, _ palabra2: String) -> Bool {
  // Primero, convertimos las palabras a minúsculas
  let palabra1 = palabra1.lowercased()
  let palabra2 = palabra2.lowercased()
  
  // Creamos un diccionario vacío para contar las ocurrencias de cada letra
  var contador1 = [Character: Int]()
  var contador2 = [Character: Int]()
  
  // Recorremos las dos palabras y contamos las ocurrencias de cada letra
  for letra in palabra1 {
    contador1[letra, default: 0] += 1
  }
  for letra in palabra2 {
    contador2[letra, default: 0] += 1
  }
  
  // Comparamos los diccionarios para ver si son iguales
  return contador1 == contador2
}

// ChatGPT
// Debería devolver verdadero
esAnagrama("casa", "acas")
// Debería devolver falso
esAnagrama("casa", "casa")
esAnagrama("casa", "saca")
esAnagrama("casa", "baso")

// Brais
print(esAnagrama("amor", "roma"))

// Jaime
print(esAnagrama("Roma", ""))
print(esAnagrama("Roma", "Roma"))
print(esAnagrama("Roma", "romana"))
print(esAnagrama("Roma", "Peru"))
print(esAnagrama("Roma", "ramo"))
print(esAnagrama("Roma", "mora"))
print(esAnagrama("Roma", "moar"))
print(esAnagrama("Roma", "amor"))




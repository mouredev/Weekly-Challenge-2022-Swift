//: [Previous](@previous)

// Este es un ejemplo de fichero de reto

/*
 * Aquí aparecerá el enunciado y podrás resolverlo en el propio fichero.
 */

for i in 1...100{
    var texto = ""
    
    if i % 3 == 0{
        texto += "fizz"
    }
    if i % 5 == 0{
        texto += "buzz"
    }
    if texto == ""{
        texto = String(i)
    }
    print("\(texto) \n")
}

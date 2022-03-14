/*
 * Tienes toda la información ensencial en:
 * https://github.com/mouredev/Weekly-Challenge-2022-Swift/blob/main/README.md
 *
 * Cada nuevo reto se añadirá en un fichero del playground
 *
 * Recuerda que puedes ejecutar código Swift de una forma muy simple
 * pulsando el botón de "play ►" en el lateral.
 */


func reverseC(cadena:String) -> String {
    let cadena_caracteres = Array(cadena)
    var resultado = [String]()
    resultado.reserveCapacity(cadena_caracteres.count)
    for (index, valor) in cadena_caracteres.enumerated() {
       
        resultado.append(String(cadena_caracteres[cadena_caracteres.count - index - 1]))
    }

    return resultado.joined()
    
}




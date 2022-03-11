import Foundation

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
 */
func cadenaEquilibrada(text: String) {

    let corcheteAbierto = "{"
    let parentesisAbierto = "("
    let llaveAbierta = "["
    let corcheteCerrado = "}"
    let parentesisCerrado = ")"
    let llaveCerrada = "]"
  
    var myArray = [String]()
    
    var continuar = true
    var index = 0
    while continuar && index < text.count{
        let caracterActual = String(Array(text)[index])

        if caracterActual == corcheteAbierto || caracterActual == parentesisAbierto || caracterActual == llaveAbierta {

            myArray.append(caracterActual)
            
        } else if caracterActual == corcheteCerrado || caracterActual == parentesisCerrado || caracterActual == llaveCerrada {

            let caracterAnterior = myArray[myArray.count - 1]

            
            switch caracterAnterior {
            case corcheteAbierto:
                if corcheteCerrado == caracterActual {
                    myArray.remove(at: myArray.count-1)
                }else {
                    continuar = false
                }
            case parentesisAbierto:
                if parentesisCerrado == caracterActual {
                    myArray.remove(at: myArray.count-1)
                }else {
                    continuar = false
                }
            case llaveAbierta:
                if llaveCerrada == caracterActual {
                    myArray.remove(at: myArray.count-1)
                }else {
                    continuar = false
                }
            default:
                <#code#>
            }
        }
        
        index = index + 1
        
    }
    
    if myArray.count == 0 {
        print("La cadena " + text + " está equilibrada")
    }else{
        print("La cadena " + text + " no está equilibrada")
    }
}
 
cadenaEquilibrada(text: "{[a*(c+d)]-5}")
cadenaEquilibrada(text: "{ a * ( c + d ) ] - 5 }")
cadenaEquilibrada(text: "{ [ a )* ( c + d ) ] - 5 }")


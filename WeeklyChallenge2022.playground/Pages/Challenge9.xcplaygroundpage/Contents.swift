import Foundation

/*
 * Reto #9
 * CÓDIGO MORSE
 * Fecha publicación enunciado: 02/03/22
 * Fecha publicación resolución: 07/03/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea un programa que sea capaz de transformar texto natural a código morse y viceversa.
 * - Debe detectar automáticamente de qué tipo se trata y realizar la conversión.
 * - En morse se soporta raya "—", punto ".", un espacio " " entre letras o símbolos y dos espacios entre palabras "  ".
 * - El alfabeto morse soportado será el mostrado en https://es.wikipedia.org/wiki/Código_morse.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

/* ENUM CON TODOS LOS VALORES */
enum TipoCodificacion: String, CaseIterable {
   case alfabeto = "alfabeto"
   case morse = "morse"
   case error = "error"
}

struct SignoMorse {
   let signo: String
   let codigo: String
}

let alfabetoMorse: [SignoMorse] = [
   SignoMorse(signo: "A", codigo: "·—"),
   SignoMorse(signo: "B", codigo: "—···"),
   SignoMorse(signo: "C", codigo: "—·—·"),
   SignoMorse(signo: "CH", codigo: "————"),
   SignoMorse(signo: "D", codigo: "—··"),
   SignoMorse(signo: "E", codigo: "·"),
   SignoMorse(signo: "F", codigo: "··—··"),
   SignoMorse(signo: "G", codigo: "——·"),
   SignoMorse(signo: "H", codigo: "····"),
   SignoMorse(signo: "I", codigo: "··"),
   SignoMorse(signo: "J", codigo: "·———"),
   SignoMorse(signo: "K", codigo: "—·—"),
   SignoMorse(signo: "L", codigo: "·—··"),
   SignoMorse(signo: "M", codigo: "——"),
   SignoMorse(signo: "N", codigo: "—·"),
   SignoMorse(signo: "Ñ", codigo: "——·——"),
   SignoMorse(signo: "O", codigo: "———"),
   SignoMorse(signo: "P", codigo: "·——·"),
   SignoMorse(signo: "Q", codigo: "——·—"),
   SignoMorse(signo: "R", codigo: "·—·"),
   SignoMorse(signo: "S", codigo: "···"),
   SignoMorse(signo: "T", codigo: "—"),
   SignoMorse(signo: "U", codigo: "··—"),
   SignoMorse(signo: "V", codigo: "···—"),
   SignoMorse(signo: "W", codigo: "·——"),
   SignoMorse(signo: "X", codigo: "—··—"),
   SignoMorse(signo: "Y", codigo: "—·——"),
   SignoMorse(signo: "Z", codigo: "——··"),
   SignoMorse(signo: "0", codigo: "—————"),
   SignoMorse(signo: "1", codigo: "·————"),
   SignoMorse(signo: "2", codigo: "··———"),
   SignoMorse(signo: "3", codigo: "···——"),
   SignoMorse(signo: "4", codigo: "····—"),
   SignoMorse(signo: "5", codigo: "·····"),
   SignoMorse(signo: "6", codigo: "—····"),
   SignoMorse(signo: "7", codigo: "——···"),
   SignoMorse(signo: "8", codigo: "———··"),
   SignoMorse(signo: "9", codigo: "————·"),
   SignoMorse(signo: ".", codigo: "·—·—·—"),
   SignoMorse(signo: ",", codigo: "——··——"),
   SignoMorse(signo: "?", codigo: "··——··"),
   SignoMorse(signo: "\"", codigo: "·—··—·"),
   SignoMorse(signo: "/", codigo: "—··—·"),
   SignoMorse(signo: "ERROR", codigo: "../../.."),
   SignoMorse(signo: " ", codigo: "  ")
]

// Validacion
//print(runEnigma(""))
//print(runEnigma("$"))
//print(runEnigma("HO$A"))
//print(runEnigma("···· -----"))
//let mensajeAlfabeto = "A B C CH D E F G H I J K L M N Ñ O P Q R S T U V W X Y Z 0 1 2 3 4 5 6 7 8 9 . ? \" / Hola que tal chocolate"
//let mensajeMorse = runEnigma(mensajeAlfabeto)
//let mensajeAlfabetoAux = runEnigma(mensajeMorse)
//print("¿Mensaje codificado correctamente?: " + String(mensajeAlfabeto.uppercased().elementsEqual(mensajeAlfabetoAux)))

print(runEnigma("HOLA QUE TAL CHOCOLATE"))
print(runEnigma("···· ——— ·—·· ·—  ——·— ··— ·  — ·— ·—··  ———— ——— —·—· ——— ·—·· ·— — ·"))

func runEnigma(_ mensaje: String) -> String {
   let mensajeUppered = mensaje.uppercased()
   
   if (mensajeUppered.count == 0) {
       return "No hay mensaje para codificar"
   }
   
   let tipoCodificacion: TipoCodificacion = detectarCodificacion(String(mensajeUppered.first!))
   if (tipoCodificacion == .error) {
       return "No se ha podido detectar el tipo de codificacion"
   }
   
   var resultado: String = ""
   
   resultado = obtenerElemento(mensajeUppered, tipoCodificacion)
   
   return esError(resultado, tipoCodificacion) ? resultado : String(resultado.dropLast())
}

func obtenerElemento(_ mensaje: String, _ tipoCodificacion: TipoCodificacion) -> String {
   var mensajeDescodificado = ""
   switch(tipoCodificacion) {
   case .alfabeto:
       var i = 0
       while (i < mensaje.count) {
           var caracterDescodificado = ""
           
           // Se trata el signo CH
           if (i + 1 < mensaje.count && mensaje[i] == "C" && mensaje[i+1] == "H" ) {
               let caracterADescifrar = String(mensaje[i]).appending(String(mensaje[i+1]))
               caracterDescodificado = alfabetoMorse.filter { $0.signo == caracterADescifrar }.first?.codigo ?? "ERROR"
               i += 1
           } else {
               let caracterADescifrar = String(mensaje[i])
               caracterDescodificado = alfabetoMorse.filter { $0.signo == caracterADescifrar }.first?.codigo ?? "ERROR"
           }
           
           if (esError(caracterDescodificado, tipoCodificacion)) {
               mensajeDescodificado = retornarError(tipoCodificacion)
               break
           }
                       
           mensajeDescodificado.append(caracterDescodificado)
           
           // Se tratan los espacios dobles
           if (!caracterDescodificado.elementsEqual("  ")) {
               mensajeDescodificado.append(" ")
           } else {
               mensajeDescodificado = String(mensajeDescodificado.dropLast())
           }
           
           i += 1
           
       }
       
       
       break
   case .morse:
       let elementos = mensaje.components(separatedBy: "  ")
       for elemento in elementos {
           var caracterDescodificado = ""
           let elementosMorse = elemento.components(separatedBy: " ")
           for codigoMorse in elementosMorse {
               if (codigoMorse.count == 0) {
                   caracterDescodificado = alfabetoMorse.filter { $0.codigo == "  " }.first?.signo ?? "ERROR"
               } else {
                   caracterDescodificado = alfabetoMorse.filter { $0.codigo == codigoMorse }.first?.signo ?? "ERROR"
               }
               
               if (esError(caracterDescodificado, tipoCodificacion)) {
                   mensajeDescodificado = retornarError(tipoCodificacion)
                   break
               }
               
               mensajeDescodificado.append(caracterDescodificado)
           }
           
           mensajeDescodificado.append(" ")
       }

       break
   case .error:
       mensajeDescodificado = "ERROR"
       break
   }
   
   return mensajeDescodificado
}

func detectarCodificacion(_ mensaje: String) -> TipoCodificacion {
   if (alfabetoMorse.filter { $0.signo == mensaje }.first != nil) {
       return .alfabeto
   } else {
       let elementos = mensaje.components(separatedBy: "  ")
       
       if (elementos.first == nil || elementos.first?.count == 0) {
           return .error
       }
       
       if (alfabetoMorse.filter { $0.codigo == elementos.first }.first != nil) {
           return .morse
       } else {
           return .error
       }
   }
}

func esError(_ caracter: String, _ tipoCodificacion: TipoCodificacion) -> Bool {
   if (tipoCodificacion.rawValue.elementsEqual(TipoCodificacion.alfabeto.rawValue)) {
       let caracterErrorMorse = alfabetoMorse.filter { $0.signo == "ERROR" }.first!.signo
       if (caracter.elementsEqual(caracterErrorMorse)) {
           return true
       }
   } else if (tipoCodificacion.rawValue.elementsEqual(TipoCodificacion.morse.rawValue)) {
       let caracterErrorMorse = alfabetoMorse.filter { $0.signo == "ERROR" }.first!.signo
       if (caracter.elementsEqual(caracterErrorMorse)) {
           return true
       }
   }
   
   return false
}

func retornarError(_ tipoCodificacion: TipoCodificacion) -> String {
   var error = ""
   if (tipoCodificacion.rawValue.elementsEqual(TipoCodificacion.alfabeto.rawValue)) {
       error = alfabetoMorse.filter { $0.signo == "ERROR" }.first!.signo
   } else if (tipoCodificacion.rawValue.elementsEqual(TipoCodificacion.morse.rawValue)) {
       error = alfabetoMorse.filter { $0.signo == "ERROR" }.first!.codigo
   }
   
   return error
}
           
extension StringProtocol {
subscript(offset: Int) -> Character {
   self[index(startIndex, offsetBy: offset)]
 }
}

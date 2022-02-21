import Foundation

/*
 * Reto #8
 * DECIMAL A BINARIO
 * Fecha publicación enunciado: 18/02/22
 * Fecha publicación resolución: 02/03/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea un programa se encargue de transformar un número decimal a binario sin utilizar funciones propias del lenguaje que lo hagan directamente.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda la acomunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

extension Int {
    private static let firstLetter = Int(Character("A").asciiValue!)
    func toBinary() -> String {
        return self.to(base: 2)
    }
    
    func toHexadecimal() -> String {
        return self.to(base: 16)
    }
    
    func to(base: Int) -> String {
        let quotient = self / base
        let mod = self.mod(base: base)
        if quotient == Int.zero {
            return "\(mod)"
        }
        return "\(quotient.to(base: base))\((mod))"
    }
    
    func mod(base: Int) -> String {
        let value = self % base
        if value <= 9 {
            return "\(value)"
        }
        return String(UnicodeScalar(UInt8(Int.firstLetter + value - 10)))
    }
}

print(48.toBinary().elementsEqual("110000"))
print(869745.toBinary().elementsEqual("11010100010101110001"))
print(72.to(base: 3).elementsEqual("2200"))
print(38293.to(base: 7).elementsEqual("216433"))
print(255.toHexadecimal().elementsEqual("FF"))
print(83948422.toHexadecimal().elementsEqual("500F386"))

import Foundation

/*
 * Reto #14
 * ¿ES UN NÚMERO DE ARMSTRONG?
 * Fecha publicación enunciado: 04/04/22
 * Fecha publicación resolución: 11/04/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Escribe una función que calcule si un número dado es un número de Amstrong (o también llamado narcisista).
 * Si no conoces qué es un número de Armstrong, debes buscar información al respecto.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

extension Int {
    
    var length: Int {
        get {
            "\(self)".count
        }
    }
    
    func isArmstrong() -> Bool {
        if self <= 0 {
            return false
        }
        let raised = self.length
        var sum = Int.zero
        self.digits().forEach {
            sum += $0.pow(raised)
        }
        return self == sum
    }

    func digits() -> [Int] {
        if self < 0 {
            return "\(self)".dropFirst().map({$0.toInt()})
        }
        return "\(self)".map({$0.toInt()})
    }
    
    func pow(_ raised: Int) -> Int {
        if raised <= 0 {
            return 0
        }
        var value = self
        for _ in 1..<raised {
            value = value * self
        }
        return value
    }
}

extension Character {
    func toInt() -> Int {
        Int("\(self)") ?? Int.zero
    }
}

print((-371).isArmstrong())
print(0.isArmstrong())
print(371.isArmstrong())
print(8208.isArmstrong())
print(4210818.isArmstrong())
print(4210810.isArmstrong())

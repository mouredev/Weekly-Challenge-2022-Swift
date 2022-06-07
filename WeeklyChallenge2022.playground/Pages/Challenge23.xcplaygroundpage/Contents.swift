import Foundation

/*
 * Reto #23
 * MÁXIMO COMÚN DIVISOR Y MÍNIMO COMÚN MÚLTIPLO
 * Fecha publicación enunciado: 07/06/22
 * Fecha publicación resolución: 13/06/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea dos funciones, una que calcule el máximo común divisor (MCD) y otra que calcule el mínimo común múltiplo (mcm) de dos números enteros.
 * - No se pueden utilizar operaciones del lenguaje que lo resuelvan directamente.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

do {
    print("MCD of \(2) and \(4): \(try mcd(numberA: 2, numberB: 4))")
    print("MCD of \(3) and \(5): \(try mcd(numberA: 3, numberB: 5))")

    print("MCM of \(5) and \(8): \(try mcm(numberA: 5, numberB: 8))")
    print("MCM of \(3) and \(12): \(try mcm(numberA: 3, numberB: 12))")
} catch {
    if let error = error as? MathError {
        print(error.description)
    }
}

enum MathError: Error {
    case invalidNumbers
    
    var description: String {
        switch self {
        case .invalidNumbers: return "Both numbers must be equal or greater than 1."
        }
    }
}

/// Calculates the maximum common divisor of two numbers.
func mcd(numberA: Int, numberB: Int) throws -> Int {
    guard numberA >= 1, numberB >= 1 else { throw MathError.invalidNumbers }
    let minNumber = min(numberA, numberB)
    
    for potentialMCD in (1...minNumber).reversed() {
        if numberA.isMultiple(of: potentialMCD) && numberB.isMultiple(of: potentialMCD) {
            return potentialMCD
        }
    }
    
    // 1 is the maximum common divisor for all numbers.
    return 1
}

/// Calculates the minimum common multiple of two numbers.
func mcm(numberA: Int, numberB: Int) throws -> Int {
    guard numberA >= 1, numberB >= 1 else { throw MathError.invalidNumbers }
    
    for potentialMCM in 1...numberA * numberB {
        if potentialMCM.isMultiple(of: numberA) && potentialMCM.isMultiple(of: numberB) {
            return potentialMCM
        }
    }
    
    // At the end of the day, a common multiple for two numbers is always the result of their product.
    return numberA * numberB
}

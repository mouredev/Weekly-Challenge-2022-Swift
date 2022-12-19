import Foundation

/*
 * Reto #14
 * ¿ES UN NÚMERO DE ARMSTRONG?
 * Fecha publicación enunciado: 04/04/22
 * Fecha publicación resolución: 11/04/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Escribe una función en Swift que calcule si un número dado es un número de Armstrong (o también llamado narcisista).
 * Si no conoces qué es un número de Armstrong, debes buscar información al respecto.
 *
 * Resuelto: Sí
 * Iteracciones: 2
 * Explicación: Para calcular si un número es un número de Armstrong, necesitamos hacer lo siguiente:
 · Separar cada dígito del número dado.
 · Elevar cada dígito a la potencia del número de dígitos del número original.
 · Sumar todas las potencias.
 · Si la suma es igual al número original, entonces el número es un número de Armstrong. De lo contrario, no lo es.
 * Conversación:
 * - Con numeros negativos da error
 *
 */

func isArmstrongNumber(_ number: Int) -> Bool {
    // Si el número es negativo, devolver falso
    if number < 0 {
        return false
    }

    // Separar cada dígito del número
    let digits = String(number).map { Int(String($0))! }

    // Elevar cada dígito a la potencia del número de dígitos
    let poweredDigits = digits.map { pow(Double($0), Double(digits.count)) }

    // Sumar todas las potencias
    let sum = poweredDigits.reduce(0, +)

    // Devolver si la suma es igual al número original
    return sum == Double(number)
}

print(isArmstrongNumber(153))   // true
print(isArmstrongNumber(371))   // true
print(isArmstrongNumber(9474))  // true
print(isArmstrongNumber(407))   // true
print(isArmstrongNumber(-153))  // false
print(isArmstrongNumber(-371))  // false
print(isArmstrongNumber(-9474)) // false
print(isArmstrongNumber(-407))  // false

// Brais cases
print(isArmstrongNumber(371))   // Output: true
print(isArmstrongNumber(-371))  // Output: false
print(isArmstrongNumber(372))   // Output: false
print(isArmstrongNumber(0))     // Output: true

// Jaime cases
print(isArmstrongNumber(123))   // Output: false
print(isArmstrongNumber(153))   // Output: true
print(isArmstrongNumber(371))   // Output: true
print(isArmstrongNumber(1080))  // Output: false
print(isArmstrongNumber(1634))  // Output: true
print(isArmstrongNumber(8208))  // Output: true
 

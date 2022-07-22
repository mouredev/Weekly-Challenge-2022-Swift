import Foundation

/*
 * Reto #28
 * MÁQUINA EXPENDEDORA
 * Fecha publicación enunciado: 11/07/22
 * Fecha publicación resolución: 18/07/22
 * Dificultad: MEDIA
 *
 * Enunciado: Simula el funcionamiento de una máquina expendedora creando una operación
 * que reciba dinero (array de monedas) y un número que indique la selección del producto.
 * - El programa retornará el nombre del producto y un array con el dinero de vuelta (con el menor número de monedas).
 * - Si el dinero es insuficiente o el número de producto no existe, deberá indicarse con un mensaje y retornar todas las monedas.
 * - Si no hay dinero de vuelta, el array se retornará vacío.
 * - Para que resulte más simple, trabajaremos en céntimos con monedas de 5, 10, 50, 100 y 200.
 * - Debemos controlar que las monedas enviadas estén dentro de las soportadas.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

enum Money: Int, CaseIterable {
    
    case five = 5
    case ten = 10
    case fifty = 50
    case oneHundred = 100
    case twoHundred = 200
    
}

func buy(code: Int, money: [Money]) -> (name: String, money: [Money]) {
    
    let products = [1: (name: "Agua", money: 50),
                    2: (name: "Coca-Cola", money: 100),
                    4: (name: "Cerveza", money: 155),
                    5: (name: "Pizza", money: 200),
                    10: (name: "Donut", money: 75)]
    
    if let product = products[code] {
        
        let totalMoney = money.map{ $0.rawValue }.reduce(0, +)
        
        if totalMoney < product.money {
            return ("El producto con código [\(code)] tiene un coste \(product.money). Has introducido \(totalMoney).", money)
        }
        
        let pendingMoney = totalMoney - product.money
        
        return (product.name, returnMoney(pendingMoney: pendingMoney))
    }
    
    return ("El producto con código [\(code)] no existe.", money)
}

func returnMoney(pendingMoney: Int, money: [Money] = []) -> [Money] {
    
    if pendingMoney == 0 {
        return money
    }
    
    var newPendingMoney = pendingMoney
    var newMoney = money
    
    for coin in Money.allCases.reversed() {
        if coin.rawValue <= pendingMoney {
            newPendingMoney -= coin.rawValue
            newMoney.append(coin)
            break
        }
    }
    
    return returnMoney(pendingMoney: newPendingMoney, money: newMoney)
}

print(buy(code: 1, money: [.five, .five, .ten, .ten, .ten, .five]))
print(buy(code: 3, money: [.five, .five, .ten, .ten, .ten, .five]))
print(buy(code: 1, money: [.five, .five, .ten, .ten, .ten, .five, .fifty]))
print(buy(code: 5, money: [.twoHundred]))

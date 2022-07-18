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

enum Coin: Int, CaseIterable, Comparable {
    case five = 5
    case ten = 10
    case fifty = 50
    case oneHundred = 100
    case twoHundred = 200
    
    static func < (lhs: Coin, rhs: Coin) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

struct Product {
    var name: String
    var number: Int
    var value: Int
    
    init(name: String, number: Int, value: Int) {
        self.name = name
        self.number = number
        self.value = value
    }
}

func getExchange(value: Int) -> [Coin] {
    var rest = value
    var result: [Coin] = []
    repeat {
        let biggestCoin = Coin.allCases.filter{ $0.rawValue <= rest }.sorted().last!
        rest = rest - biggestCoin.rawValue
        result.append(biggestCoin)
    } while(rest > 0)
    return result
}

func getProduct(productNumber: Int, money: [Coin]) -> (productName: String, exchange: [Coin]) {
    let machineProducts = [
        Product.init(name: "Estrella Galicia", number: 1, value: 120),
        Product.init(name: "Alhambra Lager Singular", number: 2, value: 120),
        Product.init(name: "Estrella Galicia 1906", number: 3, value: 180),
        Product.init(name: "Alhambra Reserva 1900", number: 4, value: 180),
        Product.init(name: "Heineken", number: 5, value: 20)
    ]
    
    let selectedProducts = machineProducts.filter{ $0.number == productNumber}
    if(selectedProducts.count == 0) {
        print("Ningún producto tiene el identificador \(productNumber)")
        return ("", money)
    } else if(selectedProducts[0].value > money.compactMap{ $0.rawValue }.reduce(0,+)) {
        print("Saldo insuficiente")
        return ("", money)
    } else {
        return (selectedProducts[0].name, getExchange(value: money.compactMap{ $0.rawValue }.reduce(0,+) - selectedProducts[0].value))
    }
}

var product = getProduct(productNumber: 7, money: [Coin.fifty])
print(product.productName.isEmpty ? "" : "Producto: \(product.productName) - monedas: \(product.exchange.compactMap{ $0.rawValue })")
product = getProduct(productNumber: 1, money: [Coin.fifty, Coin.fifty])
print(product.productName.isEmpty ? "" : "Producto: \(product.productName) - monedas: \(product.exchange.compactMap{ $0.rawValue })")
product = getProduct(productNumber: 2, money: [Coin.twoHundred])
print(product.productName.isEmpty ? "" : "Producto: \(product.productName) - monedas: \(product.exchange.compactMap{ $0.rawValue })")

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

// MARK: Constants

struct Constants {
    static let coin5: Int = 5
    static let coin10: Int = 10
    static let coin50: Int = 50
    static let coin100: Int = 100
    static let coin200: Int = 200
    
    static let products: [Int: (name: String, price: Int)] = [
        1: (name: "producto1", price: 100),
        2: (name: "producto2", price: 200),
        3: (name: "producto3", price: 300)
    ]
}

// MARK: Data Structures

struct InputData {
    let product: Int
    let cashIn: Cash
}

struct Cash {
    let inputCoins: (coin5: Int, coin10: Int, coin50: Int, coin100: Int, coin200: Int)
    var cents: Int {
        get {
            return (self.inputCoins.coin5 * Constants.coin5) + (self.inputCoins.coin10 * Constants.coin10) + (self.inputCoins.coin50 * Constants.coin50) + (self.inputCoins.coin100 * Constants.coin100) + (self.inputCoins.coin200 * Constants.coin200)
        }
    }
    
    init(coin5: Int = 0, coin10: Int = 0, coin50: Int = 0, coin100: Int = 0, coin200: Int = 0) {
        self.inputCoins = (coin5: coin5, coin10: coin10, coin50: coin50, coin100: coin100, coin200: coin200)
    }
    
    func calculateOutputCoins(formProductPrice price: Int = 0) -> Cash {
        var coins: [Int] = []
        let coinValues: [Int] = [Constants.coin5, Constants.coin10, Constants.coin50, Constants.coin100, Constants.coin200]
        var spareAmount = self.cents - price
        
        for coinValue in coinValues.reversed() {
            while spareAmount  - coinValue >= 0 {
                coins.append(coinValue)
                spareAmount -= coinValue
            }
        }
                
        return Cash(coin5: coins.filter({$0 == Constants.coin5}).count,
                    coin10: coins.filter({$0 == Constants.coin10}).count,
                    coin50: coins.filter({$0 == Constants.coin50}).count,
                    coin100: coins.filter({$0 == Constants.coin100}).count,
                    coin200: coins.filter({$0 == Constants.coin200}).count)
    }
}


// MARK: Entry Point

func buySomething(input: InputData) {
    if let product = Constants.products[input.product] {
        if product.price <= input.cashIn.cents {
            let cashOut = input.cashIn.calculateOutputCoins(formProductPrice: product.price)
            print("SUCCESS: Saldo insertado: \(input.cashIn.cents)  -> [Producto seleccionado: \(product.name), Precio del producto: \(product.price)]")
            print("         Se han devuelto \(cashOut.cents) céntimos en las siguientes monedas: \(cashOut))")
        } else {
            print("ERROR: Saldo insuficiente: \(input.cashIn.cents)  -> [Producto seleccionado: \(product.name), Precio del producto: \(product.price)]")
            print("       Se han devuelto \(input.cashIn.cents) céntimos en las siguientes monedas: \(input.cashIn.calculateOutputCoins())")
        }
    } else {
        print("ERROR: No existe ningún producto para el índice \(input.product).")
        print("       Se han devuelto \(input.cashIn.cents) céntimos en las siguientes monedas: \(input.cashIn.calculateOutputCoins())")
    }
}












// MARK: Test cases

// TESTCASE: No se ha seleccionado un producto valido
// --------- COMPORTAMIENTO: Se muestra mensaje de error de selección de producto
// --------- SALIDA CONSOLA: "ERROR: No existe ningún producto para el índice 0"
//                           "Se han devuelto 0 céntimos en las siguientes monedas: Cash(m5: 0, m10: 0, m50: 0, m100: 0, m200: 0)"
print("### TESTCASE: No se ha seleccionado un producto valido ###")
buySomething(input: InputData(product: 23, cashIn: Cash()))



// TESTCASE: No se insertan monedas
// --------- COMPORTAMIENTO: Se considera que se han introducido 0 céntimos
// --------- SALIDA: Se muestra mensaje de error de importe insuficiente para comprar el producto
print("### TESTCASE: No se insertan monedas ###")
buySomething(input: InputData(product: 1, cashIn: Cash()))



// TESTCASE: Saldo insuficiente
// --------- COMPORTAMIENTO: Se muestra mensaje de error de importe insuficiente para comprar el producto y el cambio empleando la mínima cantidad de monedas.
// --------- SALIDA: ERROR: Saldo insuficiente: 160  -> [Producto seleccionado: producto2, Precio del producto: 200]
//                   Se han devuelto 160 céntimos en las siguientes monedas: Cash(m5: 0, m10: 1, m50: 1, m100: 1, m200: 0)
print("### TESTCASE: Saldo insuficiente ###")
buySomething(input: InputData(product: 2, cashIn: Cash(coin5: 10, coin10: 1, coin100: 1)))



// TESTCASE: Saldo exacto
// --------- COMPORTAMIENTO: Se compra el producto y se devuelven 0 céntimos
// --------- SALIDA: SUCCESS: Saldo insertado: 300  -> [Producto seleccionado: producto3, Precio del producto: 300]
//                            Se han devuelto 0 céntimos en las siguientes monedas: Cash(m5: 0, m10: 0, m50: 0, m100: 1, m200: 1)
print("### TESTCASE: Saldo exacto ###")
buySomething(input: InputData(product: 3, cashIn: Cash(coin5: 2, coin10: 4, coin50: 1, coin100: 2)))



// TESTCASE: Saldo superior al precio
// --------- COMPORTAMIENTO: Se compra el producto y se devuelve el importe restante empleando la mínima cantidad de monedas.
// --------- SALIDA: SUCCESS: Saldo insertado: 500  -> [Producto seleccionado: producto3, Precio del producto: 300]
//                            Se han devuelto 200 céntimos en las siguientes monedas: Cash(m5: 0, m10: 0, m50: 0, m100: 1, m200: 2)
print("### TESTCASE: Saldo superior al precio ###")
buySomething(input: InputData(product: 3, cashIn: Cash(coin100: 1, coin200: 2)))

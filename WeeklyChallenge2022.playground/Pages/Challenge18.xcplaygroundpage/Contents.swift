import Foundation

/*
 * Reto #18
 * TRES EN RAYA
 * Fecha publicación enunciado: 02/05/22
 * Fecha publicación resolución: 09/05/22
 * Dificultad: DIFÍCIL
 *
 * Enunciado: Crea una función que analice una matriz 3x3 compuesta por "X" y "O" y retorne lo siguiente:
 * - "X" si han ganado las "X"
 * - "O" si han ganado los "O"
 * - "Empate" si ha habido un empate
 * - "Nulo" si la proporción de "X", de "O", o de la matriz no es correcta. O si han ganado los 2.
 * Nota: La matriz puede no estar totalmente cubierta. Se podría representar con un vacío "", por ejemplo.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

enum TicTacToeValue {
    case X, O, empty
}

enum TicTacToeResult {
    case X, O, draw, null
}

func checkTicTacToe(board: [[TicTacToeValue]]) -> TicTacToeResult {
           
    // Null
    
    if board.count != 3 {
        return .null
    }
    
    var xCount = 0
    var oCount = 0
    
    var flatBoard: [TicTacToeValue] = []
    for row in board {
        flatBoard.append(contentsOf: row)
        
        if row.count != 3 {
            return .null
        }
        
        for col in row {
            if col == .X {
                xCount += 1
            } else if col == .O {
                oCount += 1
            }
        }
    }
    
    if abs(xCount - oCount) > 1 {
        return .null
    }
    
    // Win or Draw
    
    let winCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    var result = TicTacToeResult.draw
    
    for winCombination in winCombinations {
        
        if flatBoard[winCombination[0]] != .empty
            && flatBoard[winCombination[0]] == flatBoard[winCombination[1]]
            && flatBoard[winCombination[0]] == flatBoard[winCombination[2]] {
            
            let winner = flatBoard[winCombination[0]]
            
            if result != .draw
                && (result == .O ? TicTacToeValue.O : TicTacToeValue.X) != winner {
                return .null
            }
                
            result = winner == .X ? .X : .O
        }
    }
    
    return result
}

print(checkTicTacToe(board: [[.X, .O, .X],
                             [.O, .X, .O],
                             [.O, .O, .X]]))

print(checkTicTacToe(board: [[.empty, .O, .X],
                             [.empty, .X, .O],
                             [.empty, .O, .X]]))

print(checkTicTacToe(board: [[.O, .O, .O],
                             [.O, .X, .X],
                             [.O, .X, .X]]))

print(checkTicTacToe(board: [[.X, .O, .X],
                             [.X, .X, .O],
                             [.X, .X, .X]]))

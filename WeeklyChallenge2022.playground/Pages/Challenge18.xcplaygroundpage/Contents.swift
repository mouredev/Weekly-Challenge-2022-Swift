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

//enum Player: String, CaseIterable {
//    case one = "X"
//    case two = "O"
//
//    func getTries(board: [[String]]) -> Int {
//        return board.compactMap{ $0.filter{ $0 == self.rawValue }.count }.reduce(0,+)
//    }
//}

enum Player: String, CaseIterable {
    case X
    case O
    
    func getTries(board: [[String]]) -> Int {
        return board.compactMap{ $0.filter{ $0 == self.rawValue }.count }.reduce(0,+)
    }
}

func playVeryRayy(board: [[String]]) -> String {
    var result = "Nulo"
    if((board.compactMap{ $0.count }.reduce(0,+) == 9) && (abs(Player.X.getTries(board: board) - Player.O.getTries(board: board)) == 1)) {
        result = "Empate"
        Player.allCases.forEach { player in
            if(board[0].filter{ $0 == player.rawValue }.count == 3) || (board[1].filter{ $0 == player.rawValue }.count == 3) || (board[2].filter{ $0 == player.rawValue }.count == 3) ||
                (board.filter{ $0[0] == player.rawValue }.count == 3) || (board.filter{ $0[1] == player.rawValue }.count == 3) || (board.filter{ $0[2] == player.rawValue }.count == 3) ||
                (board[0][0] == player.rawValue && board[1][1] == player.rawValue && board[2][2] == player.rawValue) || (board[0][2] == player.rawValue && board[1][1] == player.rawValue && board[2][0] == player.rawValue) {
                result = player.rawValue
            }
        }
    }
    return result
}

print(playVeryRayy(board: [["","",""],["","",""],["","",""]]))
print(playVeryRayy(board: [["","",""],["","",""],["",""]]))
print(playVeryRayy(board: [["X","O",""],["","",""],["","",""]]))
print(playVeryRayy(board: [["X","X","X"],["O","",""],["","",""]]))
print(playVeryRayy(board: [["X","X","X"],["O","O","O"],["","",""]]))
print(playVeryRayy(board: [["X","X","X"],["O","O",""],["","",""]]))
print(playVeryRayy(board: [["X","O",""],["X","O",""],["X","",""]]))
print(playVeryRayy(board: [["X","O",""],["O","X",""],["","","X"]]))
print(playVeryRayy(board: [["","O","X"],["","X","O"],["X","",""]]))
print(playVeryRayy(board: [["O","O","X"],["X","X","O"],["O","X","O"]]))

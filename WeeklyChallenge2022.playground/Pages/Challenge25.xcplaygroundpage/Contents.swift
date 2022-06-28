import Foundation

/*
 * Reto #25
 * PIEDRA, PAPEL, TIJERA
 * Fecha publicación enunciado: 20/06/22
 * Fecha publicación resolución: 27/06/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea un programa que calcule quien gana más partidas al piedra, papel, tijera.
 * - El resultado puede ser: "Player 1", "Player 2", "Tie" (empate)
 * - La función recibe un listado que contiene pares, representando cada jugada.
 * - El par puede contener combinaciones de "R" (piedra), "P" (papel) o "S" (tijera).
 * - Ejemplo. Entrada: [("R","S"), ("S","R"), ("P","S")]. Resultado: "Player 2".
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

enum Move {
    case rock, scissors, paper
}

func rockScissorsPaper(games: [(Move, Move)]) -> String {

    var playerOneGames = 0
    var playerTwoGames = 0
    
    games.forEach { playerOneMove, playerTwoMove in

        if (playerOneMove != playerTwoMove) {

            if playerOneMove == .rock && playerTwoMove == .scissors
                || playerOneMove == .scissors && playerTwoMove == .paper
                || playerOneMove == .paper && playerTwoMove == .rock {
                
                playerOneGames += 1
            } else {
                playerTwoGames += 1
            }
        }
    }
    
    return playerOneGames == playerTwoGames ? "Tie" : playerOneGames > playerTwoGames ? "Player 1" : "Player 2"
}

print(rockScissorsPaper(games: [(.rock, .rock)]))
print(rockScissorsPaper(games: [(.rock, .scissors)]))
print(rockScissorsPaper(games: [(.paper, .scissors)]))
print(rockScissorsPaper(games: [(.rock, .rock), (.scissors, .scissors), (.paper, .paper)]))
print(rockScissorsPaper(games: [(.rock, .scissors), (.scissors, .paper), (.scissors, .rock)]))
print(rockScissorsPaper(games: [(.rock, .paper), (.scissors, .rock), (.paper, .scissors)]))

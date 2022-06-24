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
RockPaperScissorsGame S = new RockPaperScissorsGame();

var Result= S.WhoWon(new List<Match>()
{
	new Match(RockPaperScissors.Paper,RockPaperScissors.Rock),
	new Match(RockPaperScissors.Rock,RockPaperScissors.Scissors),
});

public enum RockPaperScissors
{
	Rock, Paper, Scissors
}

public class RockPaperScissorsGame
{

	Dictionary<RockPaperScissors, RockPaperScissors> Rules = new Dictionary<RockPaperScissors, RockPaperScissors>()
	{
		[RockPaperScissors.Rock] = RockPaperScissors.Scissors,
		[RockPaperScissors.Paper] = RockPaperScissors.Rock,
		[RockPaperScissors.Scissors] = RockPaperScissors.Paper
	};

	int Player1MatchesWon = 0;
	int Player2MatchesWon = 0;

	public string WhoWon(List<Match> Game)
	{
		if (Game.Count < 1)
		{
			return "Error, el juego esta vacio";
		}
		foreach (Match item in Game)
		{
			if (Rules[item.Player1] == item.Player2)
			{
				Player1MatchesWon++;
				continue;
			}

			if (Rules[item.Player2] == item.Player1)
			{
				Player2MatchesWon++;
				continue;
			}
		}
		return Result();
	}

	private string Result()
	{
		if (Player1MatchesWon > Player2MatchesWon)
		{
			return "Player1";
		}

		if (Player2MatchesWon > Player1MatchesWon)
		{
			return "Player2";
		}

		return "Tie";
	}
}

public class Match
{
	public readonly RockPaperScissors Player1;
	public readonly RockPaperScissors Player2;

	public Match(RockPaperScissors Player1, RockPaperScissors Player2)
	{
		this.Player1 = Player1;
		this.Player2 = Player2;
	}
}

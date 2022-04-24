import Foundation

/*
 * Reto #16
 * EN MAYÚSCULA
 * Fecha publicación enunciado: 18/04/22
 * Fecha publicación resolución: 25/04/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea una función que reciba un String de cualquier tipo y se encargue de
 * poner en mayúscula la primera letra de cada palabra.
 * - No se pueden utilizar operaciones del lenguaje que lo resuelvan directamente.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

//respuesta: Aaaa Bc C
Console.WriteLine(Solution.Solution("aaaa bc c"));
//respuesta: Moure         Dev
Console.WriteLine(Solution.Solution("moure         dev"));
//Hola ¿Como Estan?
Console.WriteLine(Solution.Solution("Hola ¿como estan?"));



public class AutomataSolution
{
	AbstractState State;

	public AutomataSolution()
	{
		State = new StartState();
	}
  
	public override string Solution(string text)
	{
		char[] _Text = (" " + text).ToCharArray();
		for (int i = 0; i < _Text.Length; i++)
		{
			State = State.State(_Text[i]);
			if (State.ValidState)
			{
				State = new StartState();
				_Text[i] = char.ToUpper(_Text[i]);
			}
		}
		return new string(_Text).Trim();
	}
}



public abstract class AbstractState
{

	public bool IsValid { get; set; } = false;

	public abstract AbstractState State(char Letter);
}

public class FinalState : AbstractState
{

	public FinalState()
	{
		IsValid = true;
	}

	public override AbstractState State(char Letter)
	{
		return this;
	}
}

public class StartState : AbstractState
{
	public override AbstractState State(char Letter)
	{
		if (Letter == ' ')
		{
			return new S0();
		}
		return this;
	}
}


public class S0 : AbstractState
{

	char[] Letters = new char[] { '¿', '!' };
	public override AbstractState State(char Letter)
	{

		if (Letter == ' ')
		{
			return this;
		}

		if (Letters.Contains(Letter))
		{
			return new S1();
		}

		if (char.IsLower(Letter))
		{
			return new FinalState();
		}

		return new StartState();
	}
}

public class S1 : AbstractState
{

	char[] Letters = new char[] { '¿', '!' };

	public override AbstractState State(char Letter)
	{
		if (Letters.Contains(Letter))
		{
			return this;
		}


		if (char.IsLower(Letter))
		{
			return new FinalState();
		}

		return new StartState();
	}
}

import Foundation

/*
 * Reto #17
 * LA CARRERA DE OBSTÁCULOS
 * Fecha publicación enunciado: 25/04/22
 * Fecha publicación resolución: 02/05/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea una función que evalúe si un/a atleta ha superado correctamente una
 * carrera de obstáculos.
 * - La función recibirá dos parámetros:
 *      - Un array que sólo puede contener String con las palabras "run" o "jump"
 *      - Un String que represente la pista y sólo puede contener "_" (suelo) o "|" (valla)
 * - La función imprimirá cómo ha finalizado la carrera:
 *      - Si el/a atleta hace "run" en "_" (suelo) y "jump" en "|" (valla) será correcto y no
 *        variará el símbolo de esa parte de la pista.
 *      - Si hace "jump" en "_" (suelo), se variará la pista por "x".
 *      - Si hace "run" en "|" (valla), se variará la pista por "/".
 * - La función retornará un Boolean que indique si ha superado la carrera.
 * Para ello tiene que realizar la opción correcta en cada tramo de la pista.
 * 
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

public class Solution
{
	Dictionary<char,string> Acctions = new Dictionary<char, string>()
	{
		['_'] = "run",
		['|'] = "jump",
	};
	Dictionary<char, char> Errors = new Dictionary<char, char>()
	{
		['_'] = 'x',
		['|'] = '/',
	};
	public bool IsPathValid(string[] Acctions, string Path, out string Result)
	{
		if (!IsPathValid(Path))
		{
			Result = Path;
			return false;
		}
		string[] _Acctions = (string[]) Acctions.Clone();
		Array.Resize(ref _Acctions,Path.Length);
		bool IsValid = true;
		char[] ResultArray = Path.ToCharArray();
		for (int i = 0; i < Path.Length; i++)
		{
			if (this.Acctions[char.ToLower(Path[i])] != _Acctions[i]?.ToLower())
			{
				IsValid = false;
				ResultArray[i] = Errors[Path[i]];
			}
		}
		Result = new string(ResultArray);
		return IsValid;
	}
	private bool IsPathValid(string Path)
	{
		return !string.IsNullOrEmpty(Path) && Path.All(i => Acctions.Keys.Contains(i));
	}

}

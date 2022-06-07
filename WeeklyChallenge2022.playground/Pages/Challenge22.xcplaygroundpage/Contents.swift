import Foundation

/*
 * Reto #22
 * CONJUNTOS
 * Fecha publicación enunciado: 01/06/22
 * Fecha publicación resolución: 07/06/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea una función que reciba dos array, un booleano y retorne un array.
 * - Si el booleano es verdadero buscará y retornará los elementos comunes de los dos array.
 * - Si el booleano es falso buscará y retornará los elementos no comunes de los dos array.
 * - No se pueden utilizar operaciones del lenguaje que lo resuelvan directamente.
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
	static Dictionary<object,int> _Results = new Dictionary<object, int>();
	public static object[] SolutionMethod(object[] Array1, object[] Array2, bool FindCommon = true)
	{
		List<object> List1 = Array1.Distinct().ToList();
		List<object> List2 = Array2.Distinct().ToList();
		Add(List1);
    Add(List2);
		return FindCommon ? _Results.Where(i => i.Value > 1).Select(i => i.Key).ToArray() 
			: _Results.Where(i => i.Value == 1).Select(i => i.Key).ToArray();
	}

	private static void Add(List<object> Array1)
	{
		foreach (object item in  Array1)
		{
			if (!_Results.TryAdd(item,1))
			{
				_Results[item] += 1;
			}
		}
	}
}

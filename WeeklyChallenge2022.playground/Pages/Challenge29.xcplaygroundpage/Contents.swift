import Foundation

/*
 * Reto #29
 * ORDENA LA LISTA
 * Fecha publicación enunciado: 18/07/22
 * Fecha publicación resolución: 26/07/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea una función que ordene y retorne una matriz de números.
 * - La función recibirá un listado (por ejemplo [2, 4, 6, 8, 9]) y un parámetro adicional
 *   "Asc" o "Desc" para indicar si debe ordenarse de menor a mayor o de mayor a menor.
 * - No se pueden utilizar funciones propias del lenguaje que lo resuelvan automáticamente.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

SortClass<int> sort = new SortClass<int>();

int[] numbers = new int[] { 5, 3, 7 };

sort.Sort(numbers, SortClass<int>.SortDirection.Ascending);

Array.ForEach(numbers, (i) => Console.WriteLine(i));

//La clase generica T debe de implementar la interface IComparable
public class SortClass<T> where T : IComparable<T>
{
	public enum SortDirection
	{
		Ascending, Descending
	}

  //Delegado que retorne un bool
	private delegate bool Predicate<T1>(T1 first, T1 second);
  //aqui se guarda las condiciones que se usaran por cada tipo de ordenamiento
	Dictionary<SortDirection, Predicate<T>> _keys = new Dictionary<SortDirection, Predicate<T>>()
	{
		[SortDirection.Ascending] = (first, second) => first.CompareTo(second) > 0,
		[SortDirection.Descending] = (first, second) => first.CompareTo(second) < 0,
	};
  //declaracion de un delegado en el cual guardaremos la condicion a usar
	Predicate<T> _condition;

	public void Sort(T[] array, SortDirection direction)
	{
		_condition = _keys[direction];
		Sort(array);
	}

  //algoritmo de burbuja mejorado
	void Sort(T[] array)
	{
		bool changes = true;
		while (changes)
		{
			changes = false;
			for (int i = 1; i < array.Length; i++)
			{
				if (_condition.Invoke(array[i - 1], array[i]))
				{
					T aux = array[i - 1];
					array[i - 1] = array[i];
					array[i] = aux;
					changes = true;
				}
			}
		}
	}
}

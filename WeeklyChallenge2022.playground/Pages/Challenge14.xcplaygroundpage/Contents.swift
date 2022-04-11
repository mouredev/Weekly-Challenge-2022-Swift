import Foundation

/*
 * Reto #14
 * ¿ES UN NÚMERO DE ARMSTRONG?
 * Fecha publicación enunciado: 04/04/22
 * Fecha publicación resolución: 11/04/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Escribe una función que calcule si un número dado es un número de Armstrong (o también llamado narcisista).
 * Si no conoces qué es un número de Armstrong, debes buscar información al respecto.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */
ulong x = 28116440335967UL;

Console.WriteLine(IsArmstrong(x));


bool IsArmstrong(ulong Number)
{
	string StringNumber = Number.ToString();
	long Lenght = StringNumber.Length;

	long ArmstrongNumber = StringNumber.Sum((i) =>
	{
		long N = (long)char.GetNumericValue(i);
		return (long)Math.Pow(N, Lenght);
	});

	return (ulong)ArmstrongNumber == Number;
}

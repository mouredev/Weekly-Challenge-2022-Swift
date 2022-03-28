import Foundation

/*
 * Reto #12
 * ¿ES UN PALÍNDROMO?
 * Fecha publicación enunciado: 21/03/22
 * Fecha publicación resolución: 28/03/22
 * Dificultad: MEDIA
 *
 * Enunciado: Escribe una función que reciba un texto y retorne verdadero o falso (Boolean) según sean o no palíndromos.
 * Un Palíndromo es una palabra o expresión que es igual si se lee de izquierda a derecha que de derecha a izquierda.
 * NO se tienen en cuenta los espacios, signos de puntuación y tildes.
 * Ejemplo: Ana lleva al oso la avellana.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

Console.WriteLine(IsPalindromeIzzi("Anita lava la tina"));
//Solucion 1
bool IsPalindromeIzzi(string Text)
{
	string LowerText = Format(Text);
	string OriginalText = Format(Text);
	return new string(LowerText.Reverse().ToArray()) == OriginalText;
}

string Format(string Text)
{
	return Text.ToLower().Replace(" ", string.Empty);
}
//Solucion 2
bool IsPalindrome(string Text)
{
	string LowerText = Format(Text);
	for (int i = 0; i < LowerText.Length / 2; i++)
	{
		if (LowerText[i] != LowerText[(LowerText.Length - 1) - i])
		{
			return false;
		}
	}
	return true;
}

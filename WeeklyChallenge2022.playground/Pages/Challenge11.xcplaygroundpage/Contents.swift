import Foundation

/*
 * Reto #11
 * ELIMINANDO CARACTERES
 * Fecha publicación enunciado: 14/03/22
 * Fecha publicación resolución: 21/03/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea una función que reciba dos cadenas como parámetro (str1, str2) e imprima otras dos cadenas como salida (out1, out2).
 * - out1 contendrá todos los caracteres presentes en la str1 pero NO estén presentes en str2.
 * - out2 contendrá todos los caracteres presentes en la str2 pero NO estén presentes en str1.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

string str1 = "ABCDFUH";
string str2 = "BCAASMN";

DiffStrings(str1,str2);

static void DiffStrings(string str1, string str2)
{
	var group1 = str1.Select(i => Diff(str2, i));
	var group2 = str2.Select(i => Diff(str1, i));
	Print(group1);
	Console.WriteLine("-----------------------------------");
	Print(group2);
}

static void Print(IEnumerable<char> Array)
{
	string S = new string(Array.ToArray());
	Console.WriteLine(S);
}

static char Diff(string Compared,char c)
{
	return Compared.Contains(c) ? '\0' : c;
}

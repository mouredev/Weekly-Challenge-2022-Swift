import Foundation

/*
 * Reto #15
 * ¿CUÁNTOS DÍAS?
 * Fecha publicación enunciado: 11/04/22
 * Fecha publicación resolución: 18/04/22
 * Dificultad: DIFÍCIL
 *
 * Enunciado: Crea una función que calcule y retorne cuántos días hay entre dos cadenas de texto que representen fechas.
 * - Una cadena de texto que representa una fecha tiene el formato "dd/MM/yyyy".
 * - La función recibirá dos String y retornará un Int.
 * - La diferencia en días será absoluta (no importa el orden de las fechas).
 * - Si una de las dos cadenas de texto no representa una fecha correcta se lanzará una excepción.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */
using System.Globalization;
using System.Text.RegularExpressions;

//Asignamos el formato dd/mm/yyyy
Thread.CurrentThread.CurrentCulture = new CultureInfo("es-MX");

EasyWay Easy = new EasyWay();

Easy.DateDayDiff("10/01/2004", "13/12/2012")

public class EasyWay
{
	public int DateDayDiff(string Date1, string Date2)
	{
		try
		{
			DateTime _Date1 = DateTime.Parse(Date1, new CultureInfo("es-MX"));
			DateTime _Date2 = DateTime.Parse(Date2, new CultureInfo("es-MX"));
			return (int)_Date2.Subtract(_Date1).TotalDays;
		}
		catch (Exception ex)
		{
			throw new Exception(ex.Message);
		}
	}
}

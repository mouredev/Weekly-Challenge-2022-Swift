using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

/*
 * Reto #43
 * TRUCO O TRATO
 * Fecha publicación enunciado: 24/10/22
 * Fecha publicación resolución: 02/11/22
 * Dificultad: MEDIA
 *
 * Enunciado: Este es un reto especial por Halloween.
 * Deberemos crear un programa al que le indiquemos si queremos realizar "Truco o Trato" y
 * un listado (array) de personas con las siguientes propiedades:
 * - Nombre de la niña o niño
 * - Edad
 * - Altura en centímetros
 *
 * Si las personas han pedido truco, el programa retornará sustos (aleatorios)
 * siguiendo estos criterios:
 * - Un susto por cada 2 letras del nombre por persona
 * - Dos sustos por cada edad que sea un número par
 * - Tres sustos por cada 100 cm de altura entre todas las personas
 * - Sustos: 🎃 👻 💀 🕷 🕸 🦇
 *
 * Si las personas han pedido trato, el programa retornará dulces (aleatorios)
 * siguiendo estos criterios:
 * - Un dulce por cada letra de nombre
 * - Un dulce por cada 3 años cumplidos hasta un máximo de 10 años por persona
 * - Dos dulces por cada 50 cm de altura hasta un máximo de 150 cm por persona
 * - Dulces: 🍰 🍬 🍡 🍭 🍪 🍫 🧁 🍩
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal"
 *   para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en
 *   https://retosdeprogramacion.com/semanales2022.
 *
 */

namespace Reto43
{
	internal class Program
	{
		static void Main(string[] args)
		{
			string dulces = Halloween.TrucoOTrato(new List<Persona>
			{
				new Persona(){Nombre = "Luis",Edad = 1,Altura = 49},
				//8+8+7

			}, new Trato());
			Console.OutputEncoding = Encoding.UTF8;
			Console.WriteLine(dulces);
			Console.WriteLine(dulces.Length / 2);
			Console.ReadKey();

		}
	}

	internal class Truco : RegaloHalloween
	{
		protected override string[] _elementos { get; set; } = new string[] { "🎃", "👻", "💀", "🕷", "🕸", "🦇" };

		protected override int ObtenerPorAltutra(List<Persona> personas)
		{
			return personas.Sum(i => i.Altura) / 100;
		}

		protected override int ObtenerPorAños(List<Persona> personas)
		{
			return personas.Where(i => i.Edad % 2 == 0).Count() * 2;
		}

		protected override int ObtenerPorNombre(List<Persona> personas)
		{
			return personas.Sum(i => i.Nombre.Length) / 2;
		}
	}

	internal abstract class RegaloHalloween
	{
		protected abstract string[] _elementos { get; set; }

		protected abstract int ObtenerPorNombre(List<Persona> personas);
		protected abstract int ObtenerPorAños(List<Persona> personas);
		protected abstract int ObtenerPorAltutra(List<Persona> personas);

		public string TrucoOTrato(List<Persona> personas)
		{
			string resultado = "";
			resultado += ObtenerDulce(ObtenerPorNombre(personas));
			resultado += ObtenerDulce(ObtenerPorAños(personas));
			resultado += ObtenerDulce(ObtenerPorAltutra(personas));
			return resultado;
		}

		private string ObtenerDulce(int num)
		{
			string resultado = string.Empty;
			Random random = new Random();
			for (int i = 0; i < num; i++)
			{
				int index = random.Next(0, _elementos.Length);
				resultado += _elementos[index];
			}
			return resultado;
		}
	}

	internal class Trato : RegaloHalloween
	{
		protected override string[] _elementos { get; set; } = new string[] { "🍰", "🍬", "🍡", "🍭", "🍪", "🍫", "🧁", "🍩" };

		private int ObtenerDuclcesPorAlutraOAños(IEnumerable<int> personas, int limiteDulces, int porcada, int numeroDeDulcesADarPorCada)
		{
			return personas.Sum((i) =>
			{
				return (i / porcada) * numeroDeDulcesADarPorCada > limiteDulces ? limiteDulces : (i / porcada) * numeroDeDulcesADarPorCada;
			});
		}

		protected override int ObtenerPorAltutra(List<Persona> personas)
		{
			return ObtenerDuclcesPorAlutraOAños(personas.Select(i => i.Altura), 6, 50, 2);
		}

		protected override int ObtenerPorAños(List<Persona> personas)
		{
			return ObtenerDuclcesPorAlutraOAños(personas.Select(i => i.Edad), 3, 3, 1);
		}

		protected override int ObtenerPorNombre(List<Persona> personas)
		{
			return personas.Sum(i => i.Nombre.Length);
		}
	}

	internal class Halloween
	{
		public static string TrucoOTrato(List<Persona> personas, RegaloHalloween trucoTrato)
		{
			return trucoTrato.TrucoOTrato(personas);
		}
	}
	internal class Persona
	{
		public string Nombre { get; set; }
		public int Edad { get; set; }
		public int Altura { get; set; }
	}
}

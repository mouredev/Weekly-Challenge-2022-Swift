import Foundation

/*
 * Reto #26
 * CUADRADO Y TRIÁNGULO 2D
 * Fecha publicación enunciado: 27/06/22
 * Fecha publicación resolución: 07/07/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea un programa que dibuje un cuadrado o un triángulo con asteriscos "*".
 * - Indicaremos el tamaño del lado y si la figura a dibujar es una u otra.
 * - EXTRA: ¿Eres capaz de dibujar más figuras?
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

FigureFactory figureFactory = new FigureFactory();
FigureBase Figure = figureFactory.GetFigure("square");

Figure.Menu();
Figure.DrawFigure();

public class FigureFactory
{
	Dictionary<string, FigureBase> Figures = new Dictionary<string, FigureBase>()
	{
		["square"] = new Square(),
		["triangle"] = new Triangle(),
		["rectangle"] = new Rectangle(),
	};

	public FigureBase GetFigure(string Name)
	{
		return Figures.GetValueOrDefault(Name.ToLower(), Figures["square"]);
	}
}

public abstract class FigureBase
{
	protected const char Brush = '*';
	public int Height { get; set; }
	public virtual void Menu()
	{
		try
		{
			Console.WriteLine("ingrese la altura de la figura");
			Height = int.Parse(Console.ReadLine());
		}
		catch
		{
			Console.WriteLine("Error con el dato ingresado");
			Menu();
		}
	}
	public abstract void DrawFigure();
}


public class Square : FigureBase
{
	public override void DrawFigure()
	{
		Console.Clear();
		string Line = "".PadLeft(Height, Brush);
		for (int i = 0; i < Height; i++)
		{
			Console.WriteLine(Line);
		}
	}
}

public class Triangle : FigureBase
{
	public override void DrawFigure()
	{
		Console.Clear();
		for (int i = 0; i < Height; i++)
		{
			for (int j = Height - i; j <= Height + i; j++)
			{
				Console.SetCursorPosition(j, i);
				Console.Write(Brush);
			}
		}
	}

}

public class Rectangle : FigureBase
{
	int Width { get; set; }
	public override void DrawFigure()
	{
		Console.Clear();
		for (int i = 0; i < Height; i++)
		{
			for (int j = 0; j < Width; j++)
			{
				Console.Write(Brush);
			}
			Console.WriteLine();
		}
	}

	public override void Menu()
	{
		base.Menu();
		try
		{
			Console.WriteLine("Dame la anchura");
			Width = int.Parse(Console.ReadLine());
			if (Width == Height)
			{
				Console.WriteLine("Los lados no deben ser iguales");
				Menu();
			}
		}
		catch
		{
			Console.WriteLine("Error en los datos ingresados");
			Menu();
		}

	}

}

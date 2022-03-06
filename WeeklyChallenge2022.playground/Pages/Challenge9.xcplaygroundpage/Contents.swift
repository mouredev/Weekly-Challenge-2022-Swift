import Foundation

/*
 * Reto #9
 * CÓDIGO MORSE
 * Fecha publicación enunciado: 02/03/22
 * Fecha publicación resolución: 07/03/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea un programa que sea capaz de transformar texto natural a código morse y viceversa.
 * - Debe detectar automáticamente de qué tipo se trata y realizar la conversión.
 * - En morse se soporta raya "—", punto ".", un espacio " " entre letras o símbolos y dos espacios entre palabras "  ".
 * - El alfabeto morse soportado será el mostrado en https://es.wikipedia.org/wiki/Código_morse.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */
MorseCode MorseCode = new MorseCode();

Console.WriteLine(MorseCode.Convert("Moure Dev"));


public class MorseCode
{

	Dictionary<string, string> _Morse = new Dictionary<string, string>()
	{
		["A"] = ".-",
		["B"] = "-...",
		["C"] = "-.-.",
		["D"] = "-..",
		["E"] = ".",
		["F"] = "..-.",
		["G"] = "--.",
		["CH"] = "----",
		["H"] = "....",
		["I"] = "..",
		["J"] = ".---",
		["K"] = "-.-",
		["L"] = ".-..",
		["M"] = "--",
		["N"] = "-.",
		["Ñ"] = "--.--",
		["O"] = "---",
		["P"] = ".--.",
		["Q"] = "--.-",
		["R"] = ".-.",
		["S"] = "...",
		["T"] = "-",
		["U"] = "..-",
		["V"] = "...-",
		["W"] = ".--",
		["X"] = "-..-",
		["Y"] = "-.--",
		["Z"] = "--..",
		["0"] = "—————",
		["1"] = ".----",
		["2"] = "..---",
		["3"] = "...--",
		["4"] = "....-",
		["5"] = ".....",
		["6"] = "-....",
		["7"] = "--...",
		["8"] = "---..",
		["9"] = "----.",
		[" "] = "  ",
		["."] = ".—.—.—",
		[","] = "--..--",
		["?"] = "..--..",
		["/"] = "—..—.",
		["\""] = ".—..—."
	};

	public bool IsError { get; private set; }

	private string? _Error;
  
	public string Error
	{
		get
		{
			return _Error;
		}
		private set
		{
			_Error = value;
			IsError = true;
		}
	}

	private enum TextType
	{
		Latin, Morse
	}

	public string Convert(string Text)
	{
		string WordEncripted = "";
		string Word = FormatText(Text);

		switch (GetTextType(Word))
		{
			case TextType.Latin:
				WordEncripted = FromLatinToMorse(Word);
				break;
			case TextType.Morse:
				WordEncripted = FromMorseToLatin(Word);
				break;
		}

		if (!IsValid(WordEncripted))
		{
			Error = "Contiene caracteres que no se pueden codificar :(";
		}

		return WordEncripted.Trim();
	}

	private string FromMorseToLatin(string Word)
	{
		string[] Words = GetLettersAndWhiteSpaces(Word);
		StringBuilder Encripted = new StringBuilder();
		foreach (string _Word in Words)
		{
			//Linq
			Encripted.Append(_Morse.FirstOrDefault(i => i.Value == _Word).Key);
		}
		return Encripted.ToString();
	}

	private string FromLatinToMorse(string Word)
	{
		StringBuilder Encripted = new StringBuilder();
		char append , Character;
		string Key;
		for (int index = 0; index < Word.Length; index++)
		{
			append = ' ';
			Character = Word[index];
			Key = Character + "";
			//Es CH?
			if (Character == 'C' && Word[Math.Clamp(index + 1, 0, Word.Length - 1)] == 'H')
			{
				Key = "CH";
				index++;
			}
			//¿fin de la palabra o es espacio en blanco?
			if (Word[Math.Clamp(index + 1, 0, Word.Length - 1)] == ' ' || Word[index] == ' ')
			{
				append = '\0';
			}

			Encripted.Append(_Morse.GetValueOrDefault(Key, "#") + append);
		}
		return Encripted.ToString();
	}

	private TextType GetTextType(string Text)
	{
		return Regex.IsMatch(Text, @"^[\.\-/ ]*$") ? TextType.Morse : TextType.Latin;
	}

	private string[] GetLettersAndWhiteSpaces(string Text)
	{
		return Regex.Matches(Text, @"([\.\-]+| {2})").Select(i => i.Value).ToArray();
	}

	public bool IsValid(string Text)
	{
		return !Text.Contains('#');
	}

	private string FormatText(string Text)
	{
		return Text.ToUpper().Trim();
	}
}

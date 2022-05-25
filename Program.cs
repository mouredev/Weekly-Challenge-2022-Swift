/*
 * Reto #21
 * CALCULADORA .TXT
 * Fecha publicación enunciado: 23/05/22
 * Fecha publicación resolución: 01/06/22
 * Dificultad: MEDIA
 *
 * Enunciado: Lee el fichero "Challenge21.txt" incluido en el proyecto, calcula su resultado e imprímelo.
 * - El .txt se corresponde con las entradas de una calculadora.
 * - Cada línea tendrá un número o una operación representada por un símbolo (alternando ambos).
 * - Soporta números enteros y decimales.
 * - Soporta las operaciones suma "+", resta "-", multiplicación "*" y división "/".
 * - El resultado se muestra al finalizar la lectura de la última línea (si el .txt es correcto).
 * - Si el formato del .txt no es correcto, se indicará que no se han podido resolver las operaciones.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */



using System.Data;
using System.Text;

#region Pseudo-Constantes
string OPERATIONS_FILE = @"Challenge21.txt";
string[] OPERATORS = { "+", "-", "*", "/"};
#endregion

#region Programa Principal
try
{
    Console.WriteLine("Weekly Challenge 2022 (Week 21): CALCULADORA");
    Console.WriteLine("--------------------------------------------");

    var fileContent = ReadTextFile(OPERATIONS_FILE);

    Console.WriteLine($"Leídas {fileContent.Length:D0} líneas.");

    var validatedText = ConvertAndValidateReadedText(fileContent);
    Console.WriteLine($"Validado fichero correctamente: '{validatedText}'");

    var result = DoArithmeticalOperations(validatedText);
    Console.WriteLine($"Resultado: {validatedText}={result}");

}
catch (Exception ex)
{
    Console.WriteLine($"Ha ocurrido un error: {ex.Message}");
    Console.WriteLine($"La aplicación se cerrará.");
}
Console.WriteLine("Fin aplicación.");
#endregion

#region Funciones y métodos
string[] ReadTextFile(string filePath)
{
    

    if (System.IO.File.Exists(filePath) == false)
    {
        throw new ArgumentException($"Fichero '{filePath}' no encontrado.", nameof(filePath));
    }

    var fileContent = File.ReadAllLines(filePath, Encoding.UTF8);

    if (fileContent.Any() == false)
    {
        throw new FileLoadException($"No se ha podido leer el fichero, o está vacío.", filePath);
    }

    return fileContent;
}
bool IsOperator(string value) => OPERATORS.Contains(value);
bool IsNumber(string value) => decimal.TryParse(value, out _);
string ConvertAndValidateReadedText(string[] linesReaded)
{
    var result = new List<EquationElement>();

    for (int i = 0; i < linesReaded.Length; i++)
    {
        var line = linesReaded[i].Trim();
        EquationElement equationElement;

        if (IsOperator(line))
        {
            if (i == 0)
            {
                throw new InvalidDataException($"La primera línea del fichero ha de ser un número. Valor detectado: '{line}'.");
            }

            if (result.Any() && result.Last().Type == InputType.Operator)
            {
                throw new InvalidDataException($"Se ha encontrado dos operadores seguidos. Debe haber un número entre cada operador. Línea: '{i + 1}', Valor:'{line}'");
            }

            equationElement = new EquationElement(line, InputType.Operator);
        }
        else if (IsNumber(line))
        {
            if (result.Any() && result.Last().Type == InputType.Number)
            {
                throw new InvalidDataException($"Se ha encontrado dos números seguidos. Debe haber un operador entre cada número. Línea: '{i + 1}', Valor:'{line}'");
            }
            equationElement = new EquationElement(line, InputType.Number);
        }
        else
        {
            throw new InvalidDataException($"Se ha encontrado un valor desconocido. Línea: '{i + 1}', Valor:'{line}'");
        }

        result.Add(equationElement);
    }

    if (result.Any() && result.Last().Type == InputType.Operator)
    {
        throw new InvalidDataException($"El fichero debe acabar con un número y no con un operador. Valor:'{result.Last().Value}'");
    }

    return string.Join("", result.Select(x => x.Value));
}
decimal DoArithmeticalOperations(string equation)
{
    var result = Convert.ToDecimal(new DataTable().Compute(equation, null));
    return result;
}
#endregion

#region Clases y enumeraciones auxiliares
internal enum InputType
{
    Number,
    Operator
}

internal readonly struct EquationElement
{
    public EquationElement(string value, InputType type)
    {
        Value = value;
        Type = type;
    }

    public readonly string Value { get; init; }
    public readonly InputType Type { get; init; }
}
#endregion
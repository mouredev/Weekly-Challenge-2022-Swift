/*
 * Reto #16
 * EN MAYÚSCULA
 * Fecha publicación enunciado: 18/04/22
 * Fecha publicación resolución: 25/04/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea una función que reciba un String de cualquier tipo y se encargue de
 * poner en mayúscula la primera letra de cada palabra.
 * - No se pueden utilizar operaciones del lenguaje que lo resuelvan directamente.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WeeklyChallenge2022
{
    class Program
    {
        private const char DOT = '.';
        private const char WHITESPACE = ' ';

        private const string MS_FORMAT = "N0";
        private const string EXIT_KEY = ":q";

        static async Task Main(string[] args)
        {
            Stopwatch timeTracker = new();
            var originalText = await GetTextFromConsoleInput();            

            timeTracker.Restart();
            var finalText = NormalizeText(originalText, true);
            Console.WriteLine($"Texto modificadas mayúsculas despúes de punto en {timeTracker.ElapsedMilliseconds.ToString(MS_FORMAT)} ms:");
            Console.WriteLine(finalText);
            Console.WriteLine();

            timeTracker.Restart();
            finalText = NormalizeText(originalText, false);
            Console.WriteLine($"Texto normalizado en {timeTracker.ElapsedMilliseconds.ToString(MS_FORMAT)} ms:");
            Console.WriteLine(finalText);
            Console.WriteLine();
        }

        static string NormalizeText(string originalText, bool onlyModifyCharsAfterDots = false)
        {
            if (onlyModifyCharsAfterDots == false)
            {
                originalText = originalText.ToLower();
            }

            var splittedText = originalText.Split(DOT);
            var sentences = new List<string>();

            splittedText.ToList()
                .ForEach(x =>
                {
                    if (string.IsNullOrWhiteSpace(x) == false)
                    {
                        sentences.Add(CleanString(x));
                    }
                });

            return string.Join(WHITESPACE, sentences);
        }
        static string CleanString(string text)
        {
            var sb = new StringBuilder(text.Trim());

            sb[0] = char.ToUpper(sb[0]);
            sb.Append(DOT);

            return sb.ToString();
        }

        static async Task<string> GetRandomTextFromInternet()
        {
            Stopwatch timeTracker = new();
            Console.WriteLine("Obteniendo texto Lorem Ipsum desde internet (https://random-data-api.com/)...");
            Console.WriteLine();

            timeTracker.Start();
            var randomSentence = await RandomDataAPI.Services.LoremIpsumService.GetRandomText();
            timeTracker.Stop();
            Console.WriteLine($"Texto obtenido en {timeTracker.ElapsedMilliseconds.ToString(MS_FORMAT)} ms:");
            Console.WriteLine(randomSentence);
            Console.WriteLine();

            return randomSentence;
        }
        static async Task<string> GetTextFromConsoleInput()
        {
            while(true)
            {
                Console.WriteLine($"Por favor introduzca una cadena de texto, o deje en blanco para obtener una cadena aleatoria desde internet. Si desea salir, escriba {EXIT_KEY}  ");
                Console.Write("=> ");
                var readedText = Console.ReadLine();

                if(string.IsNullOrWhiteSpace(readedText))
                {
                    return await GetRandomTextFromInternet();
                }
                else if (readedText.Equals(EXIT_KEY, StringComparison.InvariantCultureIgnoreCase))
                {
                    Console.WriteLine("Saliendo de la aplicación");
                    Environment.Exit(0);
                }
                else
                {
                    return readedText;
                }


            }
        }
        
    }
}

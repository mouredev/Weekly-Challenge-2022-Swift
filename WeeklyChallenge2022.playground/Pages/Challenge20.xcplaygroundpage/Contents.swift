import Foundation

/*
 * Reto #20
 * PARANDO EL TIEMPO
 * Fecha publicación enunciado: 16/05/22
 * Fecha publicación resolución: 23/05/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea una función que sume 2 números y retorne su resultado pasados unos segundos.
 * - Recibirá por parámetros los 2 números a sumar y los segundos que debe tardar en finalizar su ejecución.
 * - Si el lenguaje lo soporta, deberá retornar el resultado de forma asíncrona, es decir, sin detener la ejecución del programa principal. Se podría ejecutar varias veces al mismo tiempo.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

Task<int> t1 = SumAsync(10, 20, 30);
Task<int> t2 = SumAsync(10, 80, 20);
Task<int> t3 = SumAsync(25, 90, 60);
int Result = await t3;

Console.WriteLine(Result);

//Console.WriteLine();

async Task<int> SumAsync(int Number1, int Number2, int Seconds)
{
	//Se crea una task (Un hilo).
	Task<int> t = new Task<int>(() => Number1 + Number2);
	//Se Inicia la tarea.
	t.Start();
	//Se retraza la tarea por el numero de segundos que el usuario introduce
	await Task.Delay(Seconds * 1000);
	//y aqui se espera el resultado de la tarea
	return await t;
}

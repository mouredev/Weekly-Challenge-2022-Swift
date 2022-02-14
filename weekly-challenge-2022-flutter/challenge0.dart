/*
 * Reto #0
 * EL FAMOSO "FIZZ BUZZ"
 * Fecha publicación enunciado: 27/12/21
 * Fecha publicación resolución: 03/01/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Escribe un programa que muestre por consola (con un print) los números de 1 a 100 (ambos incluidos y con un salto de línea entre cada impresión), sustituyendo los siguientes:
 * - Múltiplos de 3 por la palabra "fizz".
 * - Múltiplos de 5 por la palabra "buzz".
 * - Múltiplos de 3 y de 5 a la vez por la palabra "fizzbuzz".
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda la acomunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */
void main() {

  for (var index = 0; index <= 100; index++) {

    bool divisibleByThree = index % 3 == 0;
    bool divisibleByFive  = index % 5 == 0;

    // Con if y else if:
    // if (divisibleByThree && divisibleByFive) {
    //   print('fizzBuzz');
    // } else if (divisibleByThree) {
    //   print('fizz');
    // } else if (divisibleByFive) {
    //   print('buzz');
    // } else {
    //   print(index);
    // }

    // Mediante ternarios
    (divisibleByThree && divisibleByThree)
        ? print('fizzBuzz')
        : (divisibleByFive)
            ? print('fizz')
            : (divisibleByFive)
                ? print('buzz')
                : print(index);
  }

}

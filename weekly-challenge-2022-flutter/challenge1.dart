/*
 * Reto #1
 * ¿ES UN ANAGRAMA?
 * Fecha publicación enunciado: 03/01/22
 * Fecha publicación resolución: 10/01/22
 * Dificultad: MEDIA
 *
 * Enunciado: Escribe una función que reciba dos palabras (String) y retorne verdadero o falso (Bool) según sean o no anagramas.
 * Un Anagrama consiste en formar una palabra reordenando TODAS las letras de otra palabra inicial.
 * NO hace falta comprobar que ambas palabras existan.
 * Dos palabras exactamente iguales no son anagrama.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda la acomunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

void main() {
  bool anagrama(String word1, String word2) {
    // paso todo a minusculas
    word1.toLowerCase();
    word2.toLowerCase();
    bool resultado = false;

    // Si son iguales no es una anagrama
    if ( word1.compareTo(word2) == 0 ) {
      return resultado;
    }

    // Lo paso a una lista de String
    List<String> s1 = [];
    List<String> s2 = [];

    for (var i = 0; i < word1.length; i++) {
      s1.add(word1[i]);
    }
    for (var i = 0; i < word2.length; i++) {
      s2.add(word2[i]);
    }

    // Función comparar Listas
    bool compareList(List<String> array1, List<String> array2) {
      print('Dentro');
      if (array1.length == array2.length) {
        return array1.every((value) => array2.contains(value));
      } else {
        return false;
      }
    }

    resultado = compareList(s1, s2);

    return resultado;
  }
  bool isAnagrama = anagrama('olahd', 'hola');
  print(isAnagrama);
}

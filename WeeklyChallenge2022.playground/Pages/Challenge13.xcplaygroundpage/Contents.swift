import Foundation

/*
 * Reto #13
 * FACTORIAL RECURSIVO
 * Fecha publicación enunciado: 28/03/22
 * Fecha publicación resolución: 04/04/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Escribe una función que calcule y retorne el factorial de un número dado de forma recursiva.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */
// PHP
//
// https://poio.com.ar/retos_moure/13/

<?php 
function factorial($numero){
  $n = intval($numero);
  $resultado = $n;

  for ($i = ($n-1); $i >= 2; $i--){
    $resultado = ($resultado * $i);
  }

  return $resultado;
}

echo '<pre>'.factorial(20).'</pre>';
echo '<pre>'.factorial(5).'</pre>';
?>
import Foundation

/*
 * Reto #12
 * ¿ES UN PALÍNDROMO?
 * Fecha publicación enunciado: 21/03/22
 * Fecha publicación resolución: 28/03/22
 * Dificultad: MEDIA
 *
 * Enunciado: Escribe una función que reciba un texto y retorne verdadero o falso (Boolean) según sean o no palíndromos.
 * Un Palíndromo es una palabra o expresión que es igual si se lee de izquierda a derecha que de derecha a izquierda.
 * NO se tienen en cuenta los espacios, signos de puntuación y tildes.
 * Ejemplo: Ana lleva al oso la avellana.
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
 // Solucion disponible en https://poio.com.ar/retos_moure/12/

<?php
function checkPalindromo($string){
  //Todo a Minuscula
  $frase_limpia = strtolower($string);

  //Eliminamos Simbolos y espacios
  $simbolos = array(' ', ',' , '.' , ';' , '-' , '¿' , '?' , '¡' , '!');
  $frase_limpia = str_replace($simbolos, '', $frase_limpia);

  //Reemplazamos acentos
  $con_tilde = array('á', 'é', 'í', 'ó', 'ú');
  $sin_tilde = array('a', 'e', 'i', 'o', 'u');
  $frase_limpia = str_replace($con_tilde, $sin_tilde, $frase_limpia);

  //Chequeo
  $palindromo = 0; 
  for($i = 1; $i <= strlen($frase_limpia); $i++){
    if( substr($frase_limpia, ($i-1),1) == substr($frase_limpia, ($i*-1),1) ){
      $palindromo += 1;
    }
  }

  //Si la suma da la cantidad de caracteres, quiere decir que es un palindromo
  if( $palindromo == strlen($frase_limpia)){
    $resultado = ': ES UN PALINDROMO ';
  } else {
    $resultado = ': NO ES UN PALINDROMO';
  }

return $string.$resultado;
}

echo checkPalindromo('Ana lleva al oso la avellana.');
?>
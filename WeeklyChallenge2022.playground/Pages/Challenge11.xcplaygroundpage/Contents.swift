import Foundation

/*
 * Reto #11
 * ELIMINANDO CARACTERES
 * Fecha publicación enunciado: 14/03/22
 * Fecha publicación resolución: 21/03/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea una función que reciba dos cadenas como parámetro (str1, str2) e imprima otras dos cadenas como salida (out1, out2).
 * - out1 contendrá todos los caracteres presentes en la str1 pero NO estén presentes en str2.
 * - out2 contendrá todos los caracteres presentes en la str2 pero NO estén presentes en str1.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

// PHP
// Volvi con el codigo del horror! 
//
// Para chequear funcionamiento: https://poio.com.ar/retos_moure/11/

<?php
function delChar($str1, $str2){
  // Array de cada string
  $array_string_1 = array();
  $array_string_2 = array();

  // 1
  for($a = 0; $a <= strlen($str1); $a++){
    // Enviamos cada caracter al array correspondiente, salvo los espacios.
    if(substr($str1, $a, 1) != ' '){
      array_push($array_string_1, substr($str1, $a, 1));    
    }
  }

  // 2
  for($a = 0; $a <= strlen($str2); $a++){
    if(substr($str2, $a, 1) != ' '){
      array_push($array_string_2, substr($str2, $a, 1));
    }
  }

  // "Reemplazamos" cada caracter del otro array por un '' (vacio), asi lo borramos
  $out1 = str_replace($array_string_2, '', $str1); 
  $out2 = str_replace($array_string_1, '', $str2);

  return 'Cadena reformateada 1: '.$out1.'.<br \>Cadena reformateada 2: '.$out2;
}

echo delChar('Hola Mundo!', 'Mi nombre es Fedex');
?>  
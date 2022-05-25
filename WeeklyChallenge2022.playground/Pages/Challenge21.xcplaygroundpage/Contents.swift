import Foundation

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

/**************************************************
 * Solucion en PHP para el Reto Semanal #21
 * by fedex (fgarciadelrio)
 * 
 * Se puede ver funcionando en:
 * https://poio.com.ar/retos_moure/21/
 **************************************************/

<?php
function leerArchivo($file){
  // Variables
  $signo = 0;
  $linea = 1;
  $operador = '';

  // Array de operadores
  $operadoresValidos = array('+', '-', '*', '/');

  // Leer linea a linea
  $lectura = fopen($file, "r");
  while($l = fgets($lectura) ){
    $l = str_replace("\n","", $l);
    echo '<pre>'.$linea.': '.$l.'</pre>';

    if($signo == 0) { // Deberia ser un signo ? 0 == NO / 1 == SI
      $l = str_replace(',', '.', $l); // Si hay algun numero con , se convierte a . para que lo tome como numero.

      if( is_numeric($l) ) { // Si no es un numero, retorna error
        switch($operador){ // Switch al valor que se le asigno a la variable para ver que cuenta hacer. En el primer paso es '' (vacio)
          case "+":
            $valor = $valor + $l;
            break;

          case "-":
            $valor = $valor - $l;
            break;

          case "*":
            $valor = $valor * $l;
            break;

          case "/":
            $valor = $valor / $l;
            break;

          case '':
            $valor = $l;
            break;

          default:
            return '<b>[ ! ]</b> Error: Error inesperado en la linea '.$linea.' => '.$operador.'.';
            break;
        }
      } else {
        return '<b>[ ! ]</b> Error: se esperaba un valor numerico en la linea '.$linea.' => '.$l.'.';
      }
      $signo = 1;
      
    } else {
      if( in_array($l, $operadoresValidos) ){ // Si no es un operador aritmetico dentro del array definido, retorna error
        $operador = $l;
        $signo = 0;
      } else {
        return '<b>[ ! ]</b> Error: se esperaba un operador aritmetico ( + - * / ) en la linea '.$linea.' => '.$l.'.';
      }
    }
    $linea = $linea + 1;
  }
  return '<hr /><b>Resultado:</b> '.$valor;
  fclose($file);
} // END leerArchivo()

echo '<b>Leer el archivo:</b><hr />';
echo leerArchivo("Resources/Challenge21.txt");
?>

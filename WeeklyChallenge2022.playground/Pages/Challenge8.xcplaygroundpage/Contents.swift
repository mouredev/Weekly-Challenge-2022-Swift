import Foundation

/*
 * Reto #8
 * DECIMAL A BINARIO
 * Fecha publicación enunciado: 18/02/22
 * Fecha publicación resolución: 02/03/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea un programa se encargue de transformar un número decimal a binario sin utilizar funciones propias del lenguaje que lo hagan directamente.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda la acomunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

func decimalToBinary(_ decimal: Int) -> String {
    
    var number = decimal
    var binary = ""
    
    while number != 0 {
        
        let reminder = number % 2
        number /= 2
        
        binary = "\(reminder)\(binary)"
    }
    
    return binary.isEmpty ? "0" : binary
}

print(decimalToBinary(387))
print(decimalToBinary(0))
 // PHP
//
// Como siempre, la prueba se puede ver en:
// https://poio.com.ar/retos_moure/8/
// donde se puede poner cualquier numero

<?php //Funcion
$binario = '';
function convertirEnBinario($decimal){

  if($decimal == 0){
    $binario = '0'.$binario;
  } else {
    while($decimal >= 1){
      $resultado = ($decimal % 2);
      $binario = $resultado.$binario;

      $decimal = intval($decimal / 2);
    }
  }

  return $binario;
}

echo convertirEnBinario(69420); 
?>



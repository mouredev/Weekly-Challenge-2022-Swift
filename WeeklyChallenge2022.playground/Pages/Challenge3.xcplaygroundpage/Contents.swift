import Foundation

/*
 * Reto #3
 * ¿ES UN NÚMERO PRIMO?
 * Fecha publicación enunciado: 17/01/22
 * Fecha publicación resolución: 24/01/22
 * Dificultad: MEDIA
 *
 * Enunciado: Escribe un programa que se encargue de comprobar si un número es o no primo.
 * Hecho esto, imprime los números primos entre 1 y 100.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda la acomunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */



// Resolucion en PHP
//
// Para verlo funcionando pueden ir a https://poio.com.ar/retos_moure/3/
// 

<?PHP
function esPrimo($valor){
  $divisores = array(); //Iniciar el array

  if((is_int($valor)) && ($valor > 1 )){ //Si el valor no es un entero, no juega :P
    for($div = 2; $div <= 9; $div++){ //Conocer si es divisible por otro numero
      if($div != $valor){ //No hacer que se cuente a si mismo 
        $resultado  = round(($valor / $div),4); //chequear con numeros grandes, capaz haya que aumentar o no los decimales 
        $entero     = intval($resultado); //solo quiero el valor entero

        if($resultado == $entero) { array_push($divisores, $div); } //Si son iguales, es un divisor valido
      }
    }
      
    if(count($divisores) != 0){
      echo 'El numero '.$valor.' NO ES primo, ya que se puede dividir al menos por: ';
      foreach($divisores as $d){ echo '[ '.$d.' ] '; }
      echo '<br />Ademas de 1 y '.$valor;
    } else {
      echo 'El numero '.$valor.' ES primo!';
    }
  } else {
    echo 'Numero '.$valor.' no es un numero Natural mayor que 1. Que es lo primero a descartar para saber si es o no primo.';
  }


  //Mostrar los primos del 1 al 100. Obiamente se podria encarar el programa de otra forma para no tener que reescribir esta parte. Pero vamos a hacer locurillas.
  echo '<hr />';
  echo '<h4>Como ejemplo de primos, aca estan los que van del 1 al 100:</h4>';
  $primitos = array(); //Iniciar el array
  for($x = 1; $x <= 100; $x++){
    $divisores = array();

    for($div = 2; $div <= 9; $div++){
      if($div != $x){
        $resultado  = round(($x / $div),4); 
        $entero     = intval($resultado);

        if($resultado == $entero) { array_push($divisores, $entero); }
      }
    }
    if(count($divisores) == 0){ array_push($primitos, $x); }
  }

  $p = 1;
  foreach($primitos as $es){ 
    echo $p.': '.$es.'<br />';
    $p++;
  }    
}
?>
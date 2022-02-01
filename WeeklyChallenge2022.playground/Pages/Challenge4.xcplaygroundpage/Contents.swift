import Foundation

/*
 * Reto #4
 * ÁREA DE UN POLÍGONO
 * Fecha publicación enunciado: 24/01/22
 * Fecha publicación resolución: 31/01/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea UNA ÚNICA FUNCIÓN (importante que sólo sea una) que sea capaz de calcular y retornar el área de un polígono.
 * - La función recibirá por parámetro sólo UN polígono a la vez.
 * - Los polígonos soportados serán Triángulo, Cuadrado y Rectángulo.
 * - Imprime el cálculo del área de un polígono de cada tipo.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda la acomunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

// PHP
// Se puede ver en https://poio.com.ar/retos_moure/4/ 
//
//   Pense 2 soluciones, la 1ra es la facil y la que mejor funcionaria 
//   y la 2da agarrate de la silla porque es una locura que todavia
//   hay que pulir.
//

// 1ra funcion/posibilidad
<?php
  function area($b, $h, $shape){
    switch($shape){
      case 'Cuadrado':
      case 'Rectangulo':
        $resultado = $b * $h;
        break;

      case 'Triangulo';
        $resultado = round( (($b * $h) / 2) , 2);
        break;

      default:
        $resultado = 'Error: Falta seleccionar el poligono';
        break;
    }

    return $resultado;
  }
?>

// 2da funcion/posibilidad
<?php //Funciones
  function calcularArea($lado1, $lado2, $lado3){
    // Array de lados
    $_lados = array();
      // Incluimos los valores al array
      for($l = 1; $l <= 3; $l++){
        if(${"lado$l"} > 0){ array_push($_lados, ${"lado$l"});}
      }
      // Ordenar valores de mayor a menor
      arsort($_lados);

      // Sacar valores 0 y vacio 
      $zeros = array(0, '');
      $lados = array_diff($_lados, $zeros);

    // Empieza la Matematica
    switch(count($lados)){
      case 1:
        //Cuadrado
        $area_c = $lados[0] * $lados[0];

        //Triangulo
          // Semiperimetro
          $s = ($lados[0] + $lados[0] + $lados[0]) / 2;

          // Heron
          $area_t = sqrt( $s * ($s - $lados[0]) * ($s - $lados[0]) * ($s - $lados[0]) );

          // Respuesta
          $respuesta = 'Si es un Cuadrado, su area es '.$area_c.'.<br />Si se trata de un Triangulo EQUILATERO, su area es '.$area_t;
        break;
      case 2:
        //Cuadrado / Rectangulo
        $area_c = $lados[0] * $lados[1];

        //Triangulo
          // Semiperimetro
          $s = ($lados[0] + $lados[0] + $lados[1]) / 2;

          // Heron
          $area_t = sqrt( $s * ($s - $lados[0]) * ($s - $lados[0]) * ($s - $lados[1]) );

          // Respuesta
          $respuesta = 'Si es un Rectangulo, su area es '.$area_c.'.<br />Si se trata de un Triangulo ISOSELES, su area es '.$area_t;
        break;
      case 3:
        // Semiperimetro
        $s = ($lados[0] + $lados[1] + $lados[2]) / 2;

        // Heron
        $area = sqrt( $s * ($s - $lados[0]) * ($s - $lados[1]) * ($s - $lados[2]) );

        // Respuesta
        $respuesta = 'El area del Triangulo es: '.$area;
        break;
    }

    //Devolver el resultado
    return $respuesta;
  }
?>
import Foundation

/*
 * Reto #5
 * ASPECT RATIO DE UNA IMAGEN
 * Fecha publicación enunciado: 01/02/22
 * Fecha publicación resolución: 07/02/22
 * Dificultad: DIFÍCIL
 *
 * Enunciado: Crea un programa que se encargue de calcular y el aspect ratio de una imagen a partir de una url.
 * - Url de ejemplo: https://raw.githubusercontent.com/mouredev/mouredev/master/mouredev_github_profile.png
 * - Por ratio hacemos referencia por ejemplo a los "16:9" de una imagen de 1920*1080px.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda la acomunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */


// PHP
//
// Se puede probar la solucion en https://poio.com.ar/retos_moure/5/

<?php
    function calcularAspectRatio($image){
      // Tomar los valores de la imagen
      $h  = getimagesize($image)[0]; // Alto
      $w  = getimagesize($image)[1]; // Ancho

      $cos = round( ($h / $w) , 3);  // Dividimos

      for($multi = 1; $multi <= $h; $multi++){ // Vamos a chequear todos los numero hasta el Alto, el primero que aparezca es el Aspect Ratio
        $resultado = round(($cos * $multi),2);
        $resultado_int = intval($cos * $multi);

        // existe una funcion is_int() para saber si es un numero entero
        // pero por algun motivo me daba siempre falso, asi que meto este
        // parche para chequear entre uno y otro si son iguales.
        // intval() solo devuelve el valor entero, por lo que si es igual
        // al resultado que no esta "formateado", es porque ya daba numero
        // entero.

        if($resultado == $resultado_int){ 
          return "[+] Imagen Analizada: ".$image."<br />
                  [+] Dimensiones: ".$h." x ".$w."<br />
                  [+] Aspect Ratio => ".$resultado.":".$multi;
        }
      }
    }

    echo calcularAspectRatio('https://raw.githubusercontent.com/mouredev/mouredev/master/mouredev_github_profile.png');
  ?>
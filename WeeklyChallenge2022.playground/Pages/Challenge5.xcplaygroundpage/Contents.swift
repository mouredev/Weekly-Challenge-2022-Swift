import UIKit

/*
 * Reto #5
 * ASPECT RATIO DE UNA IMAGEN
 * Fecha publicación enunciado: 01/02/22
 * Fecha publicación resolución: 07/02/22
 * Dificultad: DIFÍCIL
 *
 * Enunciado: Crea un programa que se encargue de calcular el aspect ratio de una imagen a partir de una url.
 * - Url de ejemplo: https://raw.githubusercontent.com/mouredev/mouredev/master/mouredev_github_profile.png
 * - Por ratio hacemos referencia por ejemplo a los "16:9" de una imagen de 1920*1080px.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

func rationalAspectRatio(aspectRatio: Double) -> (num: Int, den: Int) {
    let precision = 1.0E-6
    var x = aspectRatio
    var a = x.rounded(.down)
    var (h1, k1, h, k) = (1, 0, Int(a), 1)

    while x - a > precision * Double(k) * Double(k) {
        x = 1.0 / (x - a)
        a = x.rounded(.down)
        (h1, k1, h, k) = (h, k, h1 + Int(a) * h, k1 + Int(a) * k)
    }
    return (h, k)
}

var aspectRationStr: String?

if let url = URL(string: "https://raw.githubusercontent.com/mouredev/mouredev/master/mouredev_github_profile.png"), let data = try? Data(contentsOf: url) {
    
    let imagen = UIImage(data: data)
    if let height = imagen?.size.height, let width = imagen?.size.width {
        let aspectRatio = rationalAspectRatio(aspectRatio: height / width)
        aspectRationStr = "\(aspectRatio.den):\(aspectRatio.num)"
    }
}

if let ratio = aspectRationStr {
    print("El aspect ratio es \(ratio)")
} else {
    print("No se ha podido calcular el aspect ratio")
}

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

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

import UIKit


let url = String ("https://raw.githubusercontent.com/mouredev/mouredev/master/mouredev_github_profile.png")
    let urlImagen = URL(string: url)!
   
    let task = URLSession.shared.dataTask(with: urlImagen) { data, response, error in
        if let data = data {
            let image = UIImage(data: data)!
            print("el aspect ratio es \(calcularAR(width: Int(image.size.width),height: Int(image.size.height)))")
        } else if let error = error {
            print("Error en la llamada \(error)")
        }
        
        func calcularAR(width: Int, height: Int) -> String{
            var temporal : Int
            var a: Int = width
            var b: Int = height
            while (b != 0) {
                temporal = b
                b = a % b
                a = temporal
            }
            return "\(width/a) / \(height/a)";
        }
        
    }.resume()
    

    

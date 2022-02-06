import UIKit

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




func getAspectRatioOfImageURL(_ url: String) {

    let urlSession = URLSession.shared

    let url = URL(string: url)

    urlSession.dataTask(with: url!) { data, response, error in
        
        if let data = data {
            
            let image =  UIImage(data: data)
            let width = Int((image?.size.width)!)
            let hight = Int((image?.size.height)!)

            func gcd(_ a: Int, _ b: Int) -> Int {
              let r = a % b

              if r != 0 {
                return gcd(b, r)

              } else {
                return b
              }
            }
            let gcd = gcd(width, hight)

            print("Image URL: \(url!)\nAspect Ration\n\(width / gcd):\(hight / gcd)")
        }
    }.resume()
}

getAspectRatioOfImageURL("https://raw.githubusercontent.com/mouredev/mouredev/master/mouredev_github_profile.png")


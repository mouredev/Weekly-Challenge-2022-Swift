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

import ImageIO

func showAspectRatioOf(imageLink: String) {
    let imageURL = URL(string: imageLink)!
    let imageName = imageLink.split(separator: "/").last!.split(separator: ".").first!
    let source = CGImageSourceCreateWithURL(imageURL as CFURL, nil)
    let imageHeader = CGImageSourceCopyPropertiesAtIndex(source!, 0, nil)! as NSDictionary
    if let imageWidth = imageHeader["PixelWidth"] as? Int,
       let imageHeight = imageHeader["PixelHeight"] as? Int {
        var minWidth = imageWidth
        var minHeight = imageHeight
        (1...min(imageWidth, imageHeight)).forEach { i in
            if((imageWidth % i == 0) && (imageHeight % i == 0)) {
                minWidth = imageWidth / i
                minHeight = imageHeight / i
            }
        }
        print("\(String(describing: imageName)) tiene \(minWidth):\(minHeight) de ratio")
    } else {
        print("No se ha podido calcular el ratio de \(String(describing: imageName))")
    }
}

showAspectRatioOf(imageLink: "https://raw.githubusercontent.com/mouredev/mouredev/master/mouredev_github_profile.png")
showAspectRatioOf(imageLink: "https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg")
showAspectRatioOf(imageLink: "https://upload.wikimedia.org/wikipedia/commons/4/43/Aspect_ratio_4_3_example.jpg")
showAspectRatioOf(imageLink: "https://pbs.twimg.com/profile_images/918389307831934976/22ktBpnu_400x400.jpg")


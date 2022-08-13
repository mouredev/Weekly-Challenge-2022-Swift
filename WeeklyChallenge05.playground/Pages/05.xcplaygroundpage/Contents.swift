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

typealias Rational = (num : Int, den : Int)

func rationalApproximationOf(_ x0 : Double, withPrecision eps : Double = 1.0E-6) -> Rational {
    var x = x0
    var a = floor(x)
    var (h1, k1, h, k) = (1, 0, Int(a), 1)

    while x - a > eps * Double(k) * Double(k) {
        x = 1.0/(x - a)
        a = floor(x)
        (h1, k1, h, k) = (h, k, h1 + Int(a) * h, k1 + Int(a) * k)
    }
    return (h, k)
}

let imageURL = "https://raw.githubusercontent.com/mouredev/mouredev/master/mouredev_github_profile.png"

var aspectRatio: String?

if let url = URL(string: imageURL), let data = try? Data(contentsOf: url) {
    
    let imagen = UIImage(data: data)
    if let height = imagen?.size.height, let width = imagen?.size.width {
        var aspect = rationalApproximationOf(height / width)
        aspectRatio = "\(aspect.den):\(aspect.num)"
    }
}


if let ratio = aspectRatio {
    print("El ratio es:  \(ratio)")
}else{
    print("Error al calcular el AR")
}




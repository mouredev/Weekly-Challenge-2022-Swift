import Foundation
import UIKit

/*
 * Reto #5
 * ASPECT RATIO DE UNA IMAGEN
 * Fecha publicación enunciado: 01/02/22
 * Fecha publicación resolución: 07/02/22
 * Dificultad: DIFÍCIL
 *
 * Enunciado: Crea un programa en Swift que se encargue de calcular el aspect ratio de una imagen a partir de una url.
 * - Url de ejemplo: https://raw.githubusercontent.com/mouredev/mouredev/master/mouredev_github_profile.png
 * - Por ratio hacemos referencia por ejemplo a los "16:9" de una imagen de 1920*1080px.
 *
 * Resuelto: Sí.
 * Explicación:
 * · Para calcular el aspect ratio de una imagen en Swift, primero necesitaríamos acceder a la imagen a partir de su URL. Luego, podríamos obtener sus dimensiones (ancho y alto) y calcular el ratio de estos valores.
 * Conversación:
 * - El aspect ratio se suele mostrar separado por dos puntos (:)
 * + Sí, tienes razón. El aspect ratio de una imagen se suele mostrar separado por dos puntos, como por ejemplo en "16:9" o "4:3".
 * + Si quieres mostrar el aspect ratio de una imagen de esta manera, puedes utilizar la función String(format:) de Swift para formatear el resultado del cálculo.
 * - Pero, en lugar del ancho y el alto completos, se suelen mostrar los número más pequeños posibles.
 * + Sí, tienes razón. Además de separar el aspect ratio por dos puntos, también se suele mostrar utilizando los números más pequeños posibles. Por ejemplo, en lugar de mostrar "1920:1080" para una imagen de resolución 1920x1080, se suele mostrar "16:9" ya que ambos números pueden ser divididos por 16.
 * + Si quieres mostrar el aspect ratio de una imagen de esta manera, puedes utilizar la función gcd() de Swift para calcular el máximo común divisor (MCD) de los valores del ancho y del alto, y luego dividir estos valores por el MCD para obtener los números más pequeños posibles.
 * - No reconoce la función gcd()
 * + Lo siento si te causé confusión. La función gcd() que mencioné en mi respuesta anterior no es una función predefinida en Swift, sino que se trata de una función que podrías definir tú mismo para calcular el máximo común divisor (MCD) de dos números.
 * Nota: se inventa que gcd es una función de la librería de Swift
 */

// Define una función gcd que recibe dos enteros y devuelve su máximo común divisor
func gcd(_ a: Int, _ b: Int) -> Int {
    // Si uno de los números es cero, devuelve el otro número
    if a == 0 {
        return b
    } else if b == 0 {
        return a
    }

    // Si ambos números son iguales, devuelve uno de ellos
    if a == b {
        return a
    }

    // Si el primer número es mayor que el segundo, intercambia ambos valores
    if a > b {
        return gcd(a - b, b)
    } else {
        return gcd(a, b - a)
    }
}

// URL de ejemplo
// let url = URL(string: "https://raw.githubusercontent.com/mouredev/mouredev/master/mouredev_github_profile.png")!
// let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/7/7c/Aspect_ratio_16_9_example.jpg")!
let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/4/43/Aspect_ratio_4_3_example.jpg")!
// let url = URL(string: "https://pbs.twimg.com/profile_images/918389307831934976/22ktBpnu_400x400.jpg")!

// Luego, cargamos la imagen en una variable de tipo UIImage
let image = UIImage(data: try! Data(contentsOf: url))!

// A continuación, podemos obtener las dimensiones de la imagen
let width = image.size.width
let height = image.size.height

// Calculamos el máximo común divisor (MCD) de los valores del ancho y del alto
let mcd = gcd(Int(width), Int(height))

// Dividimos los valores del ancho y del alto por el MCD para obtener
// los números más pequeños posibles
let aspectRatio = (Int(width) / mcd, Int(height) / mcd)

// Usamos la función String(format:) para formatear el resultado
// como "ancho:alto"
let aspectRatioString = String(format: "%d:%d", aspectRatio.0, aspectRatio.1)

// Imprimimos el resultado en consola
print(aspectRatioString)





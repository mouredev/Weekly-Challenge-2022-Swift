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

extension Int {
    func primeFactors() -> [Int] {
        var values :[Int] = []
        if self > 2 {
            for value in 2...self {
                if self % value == 0 {
                    values.append(value)
                    values.append(contentsOf: (self/value).primeFactors())
                    break
                }
            }
        }
        return values
    }
    
    func greatestCommonFactor(value: Int) -> Int {
        var result = 1
        let selfFactors = self.primeFactors()
        var valueFactors = value.primeFactors()
        selfFactors.forEach {
            if let index = valueFactors.firstIndex(of: $0) {
                result = result * $0
                valueFactors.remove(at: index)
            }
        }
        return result
    }
}

class Image {
    var width: Int = Int.zero
    var height: Int = Int.zero
    var aspectRatio: String = ""
    init(url urlValue: String) {
        if let url = URL(string: urlValue) {
            guard let data = try? Data(contentsOf: url) else {
                fatalError()
            }
            if let image = UIImage(data: data) {
                self.width = Int(image.size.width)
                self.height = Int(image.size.height)
                let factor = self.width.greatestCommonFactor(value: self.height)
                self.aspectRatio = "\(self.width/factor):\(self.height/factor)"
            }
        }
    }
}

let image = Image(url: "https://raw.githubusercontent.com/mouredev/mouredev/master/mouredev_github_profile.png")
print(image.width)
print(image.height)
print(image.aspectRatio)

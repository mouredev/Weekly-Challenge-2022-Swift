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
        for value in 2..<self {
            if self % value == 0 {
                values.append(value)
                values.append(contentsOf: (self/value).primeFactors())
                return values
            }
        }
        return [self]
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
                return
            }
            if let image = UIImage(data: data) {
                self.width = Int(image.size.width)
                self.height = Int(image.size.height)
                let factor = self.width.greatestCommonFactor(value: self.height)
                self.aspectRatio = "\(self.width/factor):\(self.height/factor)"
            }
        }
    }
    init(asynchronous urlValue: String) {
        if let url = URL(string: urlValue) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let data = data, error == nil,
                let image = UIImage(data: data)
                else {
                    return
                }
                self.width = Int(image.size.width)
                self.height = Int(image.size.height)
                let factor = self.width.greatestCommonFactor(value: self.height)
                self.aspectRatio = "\(self.width/factor):\(self.height/factor)"
            }.resume()
        }
    }
    init(synchronous urlValue: String) {
        if let url = URL(string: urlValue) {
            let semaphore = DispatchSemaphore(value: 0)
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let data = data, error == nil,
                let image = UIImage(data: data)
                else {
                    semaphore.signal()
                    return
                }
                self.width = Int(image.size.width)
                self.height = Int(image.size.height)
                let factor = self.width.greatestCommonFactor(value: self.height)
                self.aspectRatio = "\(self.width/factor):\(self.height/factor)"
                semaphore.signal()
            }.resume()
            semaphore.wait(timeout: .distantFuture)
        }
    }
}

let image = Image(url: "https://raw.githubusercontent.com/mouredev/mouredev/master/mouredev_github_profile.png")
print("------------------------")
print(image.width)
print(image.height)
print(image.aspectRatio)
print("------------------------")
let image1 = Image(synchronous: "https://raw.githubusercontent.com/mouredev/mouredev/master/mouredev_github_profile.png")
print(image1.width)
print(image1.height)
print(image1.aspectRatio)
print("------------------------")
let image2 = Image(asynchronous: "https://raw.githubusercontent.com/mouredev/mouredev/master/mouredev_github_profile.png")
print(image2.width)
print(image2.height)
print(image2.aspectRatio)
print("------------------------")
sleep(3)
print(image2.width)
print(image2.height)
print(image2.aspectRatio)
print("------------------------")
//128:41

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

class Ratio {
    /// Compute prime numbers from 2 to 1000 is enough for most common images
    private lazy var primeNumbers: [Int] = {
        var numbers = [Int]()
        nextPrime: for currentNumber in (2...1000) {
            for divisor in (2..<currentNumber) where currentNumber.isMultiple(of: divisor) {
                continue nextPrime
            }
            numbers.append(currentNumber)
        }
        return numbers
    }()
    
    /// Compute Aspect Ratio using width and height via max common divisor
    func getAspectRatio(width: Int, height: Int) {
        let smallestDimension = width < height ? width : height
        var widthR: Int = width
        var heightR: Int = height
        
        for prime in primeNumbers.filter({ $0 < smallestDimension }) {
            while widthR.isMultiple(of: prime) && heightR.isMultiple(of: prime) {
                widthR /= prime
                heightR /= prime
            }
        }
        
        print("Aspect Ratio \(widthR):\(heightR)\n")
    }
    
    /// Get image from String url and compute the aspect ratio
    func getImageRatio(for path: String) {
        guard let url = URL(string: path) else {
            print("Not a valid URL")
            return
        }
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  response.statusCode == 200,
                  let image = UIImage(data: data) else {
                      print("Error, couldn't get image")
                      return
                  }
            let width = Int(image.size.width)
            let height = Int(image.size.height)
            
            DispatchQueue.main.async {
                print("Results for image with path: \(path)")
                print("Image dimensions: \(width) width, \(height) height")
                self.getAspectRatio(width: width, height: height)
            }
        }
        
        dataTask.resume()
    }
}

let ratio = Ratio()
ratio.getImageRatio(for: "https://raw.githubusercontent.com/mouredev/mouredev/master/mouredev_github_profile.png")
ratio.getImageRatio(for: "http://pokexgames.christianleon.pro/assets/images/pokemons/charizard.gif")
ratio.getImageRatio(for: "https://raw.githubusercontent.com/cleonps/Conecta4/main/Connect4.png")
ratio.getImageRatio(for: "https://raw.githubusercontent.com/mouredev/mouredev/master/mouredev_weekly_challenge.png")



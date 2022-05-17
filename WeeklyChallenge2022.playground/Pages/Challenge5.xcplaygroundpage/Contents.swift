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

enum HTTPError: Error {
    case defaultError
}

func aspectRatioOfImage(fromURL url: URL, completion: @escaping (Result<CGSize, Error>) -> Void) {
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode),
              error == nil else {
            completion(.failure(HTTPError.defaultError))
            return
        }
        
        if let data = data, let image = UIImage(data: data) {
            completion(.success(image.size))
        }
    }
    
    task.resume()
}

let url = URL(string: "https://raw.githubusercontent.com/mouredev/mouredev/master/mouredev_github_profile.png")!

aspectRatioOfImage(fromURL: url) { result in
    switch result {
    case .failure(let error):
        print("ERROR: \(error)")
    case .success(let size):
        print("RESULT: The image size is \(size.width) : \(size.height)")
    }
}

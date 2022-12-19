import Foundation

/*
 * Reto #15
 * ¿CUÁNTOS DÍAS?
 * Fecha publicación enunciado: 11/04/22
 * Fecha publicación resolución: 18/04/22
 * Dificultad: DIFÍCIL
 *
 * Enunciado: Crea una función en Swift que calcule y retorne cuántos días hay entre dos cadenas de texto que representen fechas.
 * - Una cadena de texto que representa una fecha tiene el formato "dd/MM/yyyy".
 * - La función recibirá dos String y retornará un Int.
 * - La diferencia en días será absoluta (no importa el orden de las fechas).
 * - Si una de las dos cadenas de texto no representa una fecha correcta se lanzará una excepción.
 *
 * Resuelto: Sí
 * Iteracciones: 2
 * Explicación: Para resolver este problema, podemos crear una función que acepte dos cadenas de texto como parámetros y utilice el tipo DateFormatter de Swift para convertir estas cadenas en objetos Date. Luego, podemos calcular la diferencia entre estas dos fechas en días y retornar el resultado.
 En este ejemplo, hemos creado una función daysBetween que acepta dos cadenas de texto como parámetros. Luego, creamos un objeto DateFormatter y configuramos su formato para que pueda interpretar correctamente las cadenas de texto como fechas.
 A continuación, usamos el método date(from:) del objeto DateFormatter para convertir las dos cadenas de texto en objetos Date. Si alguna de las dos cadenas de texto no tiene un formato válido, el método date(from:) devolverá nil, por lo que podemos lanzar una excepción utilizando la sentencia throw.
 Una vez que tenemos las dos fechas en forma de objetos Date, podemos calcular la diferencia entre ellas en días utilizando el objeto Calendar y el método dateComponents(_:from:to:). Este método nos permite obtener un conjunto de componentes de fecha (en este caso, solo necesitamos los días) entre dos fechas.
 Finalmente, retornamos el valor absoluto de la diferencia en días, para que el resultado sea siempre positivo independientemente del orden en el que se hayan proporcionado las fechas.
 * Conversación:
 * - Ponme ejemplos de prueba donde se muestre el número de días o un texto si se ha lanzado el error
 *
 */

func daysBetween(date1: String, date2: String) throws -> Int {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"

    guard let dateA = formatter.date(from: date1), let dateB = formatter.date(from: date2) else {
        throw NSError(domain: "Invalid date format", code: 0, userInfo: nil)
    }

    let calendar = Calendar.current
    let components = calendar.dateComponents([.day], from: dateA, to: dateB)
    return abs(components.day!)
}

do {
    let days = try daysBetween(date1: "01/01/2022", date2: "01/01/2023")
    print("Hay \(days) días entre las dos fechas")
} catch {
    print("Error: \(error)")
}

do {
    let days = try daysBetween(date1: "01/01/2022", date2: "02/01/2022")
    print("Hay \(days) días entre las dos fechas")
} catch {
    print("Error: \(error)")
}

do {
    let days = try daysBetween(date1: "01/01/2022", date2: "31/12/2021")
    print("Hay \(days) días entre las dos fechas")
} catch {
    print("Error: \(error)")
}

do {
    let days = try daysBetween(date1: "01/01/2022", date2: "01/02/2022")
    print("Hay \(days) días entre las dos fechas")
} catch {
    print("Error: \(error)")
}

do {
    let days = try daysBetween(date1: "01/01/2022", date2: "01/01/2022")
    print("Hay \(days) días entre las dos fechas")
} catch {
    print("Error: \(error)")
}

do {
    let days = try daysBetween(date1: "01/01/2022", date2: "01/01/202")
    print("Hay \(days) días entre las dos fechas")
} catch {
    print("Error: \(error)")
}

// Brais cases
do { print(try daysBetween(date1: "18/05/2022", date2: "29/05/2022")) } catch { print("Error en el formato de alguna fecha") }  // 11
do { print(try daysBetween(date1: "mouredev", date2: "29/04/2022")) } catch { print("Error en el formato de alguna fecha") }    // Error en el formato de alguna fecha
do { print(try daysBetween(date1: "18/5/2022", date2: "29/04/2022")) } catch { print("Error en el formato de alguna fecha") }   // Error en el formato de alguna fecha

// Jaime cases
do { print(try daysBetween(date1: "16/04/2022", date2: "16-04-2022")) } catch { print("Error en el formato de alguna fecha") }  // 0
do { print(try daysBetween(date1: "16/04/2022", date2: "16/13/2022")) } catch { print("Error en el formato de alguna fecha") }  // Error en el formato de alguna fecha
do { print(try daysBetween(date1: "16/04/2022", date2: "32/04/2022")) } catch { print("Error en el formato de alguna fecha") }  // Error en el formato de alguna fecha
do { print(try daysBetween(date1: "16/04/2022", date2: "17/04/2022")) } catch { print("Error en el formato de alguna fecha") }  // 1
do { print(try daysBetween(date1: "17/04/2022", date2: "16/04/2022")) } catch { print("Error en el formato de alguna fecha") }  // 1
do { print(try daysBetween(date1: "17/04/2022", date2: "16/04/2023")) } catch { print("Error en el formato de alguna fecha") }  // 364


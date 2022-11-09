import Foundation

/*
 * Reto #45
 * CONTENEDOR DE AGUA
 * Fecha publicación enunciado: 07/10/22
 * Fecha publicación resolución: 14/11/22
 * Dificultad: MEDIA
 *
 * Enunciado: Dado un array de números enteros positivos, donde cada uno representa unidades
 * de bloques apilados, debemos calcular cuantas unidades de agua quedarán atrapadas entre ellos.
 *
 * - Ejemplo: Dado el array [4, 0, 3, 6, 1, 3].
 *
 *        ⏹
 *        ⏹
 *   ⏹💧💧⏹
 *   ⏹💧⏹⏹💧⏹
 *   ⏹💧⏹⏹💧⏹
 *   ⏹💧⏹⏹⏹⏹
 *
 *   Representando bloque con ⏹︎ y agua con 💧, quedarán atrapadas 7 unidades de agua.
 *   Suponemos que existe un suelo impermeable en la parte inferior que retiene el agua.
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal"
 *   para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en
 *   https://retosdeprogramacion.com/semanales2022.
 *
 */




 func countWatter(lista: [Int]) -> Int{
     var cont = 0
     for (inx,i) in lista.enumerated(){
        if inx == lista.count - 1 || inx == 0 {continue}
        let m = [lista[0..<inx].max()!, lista[inx+1...(lista.count - 1)].max()!].min()!
        if m > i{
             cont += m - i
         }
         
     }
     
     return cont
 }

countWatter(lista: [4, 0, 3, 6, 1, 3])

countWatter(lista: [4, 0, 3, 6, 1, 3].reversed())

countWatter(lista: [4, 0, 3, 6, 1, 3].sorted())

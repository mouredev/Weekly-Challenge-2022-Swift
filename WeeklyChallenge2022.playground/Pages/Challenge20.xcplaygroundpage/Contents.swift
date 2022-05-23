import Foundation

/*
 * Reto #20
 * PARANDO EL TIEMPO
 * Fecha publicación enunciado: 16/05/22
 * Fecha publicación resolución: 23/05/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea una función que sume 2 números y retorne su resultado pasados unos segundos.
 * - Recibirá por parámetros los 2 números a sumar y los segundos que debe tardar en finalizar su ejecución.
 * - Si el lenguaje lo soporta, deberá retornar el resultado de forma asíncrona, es decir, sin detener la ejecución del programa principal. Se podría ejecutar varias veces al mismo tiempo.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */
package main

import (
	"fmt"
	"sync"
	"time"
)

// Espera a que las goroutines termines
var wg sync.WaitGroup

func main() {
  // Incrementando el numero de goroutines a esperar
  wg.Add(1)
  // La palabra reservada "go" crea una goroutine para la funcion addNumbers
  go addNumbers(5, 5, 3) 

  // Que seria lo mismo con una funcion anonima
  wg.Add(1)
  go func ()  {
   addNumbers(2, 2, 1)  
  }()

  wg.Add(1)
  go addNumbers(5, 2, 2) 
  
  // Bloquea hasta que el contador del WaitGroup sea cero 
  wg.Wait()

  fmt.Println("Finish ...")

  // Playground https://go.dev/play/p/SUYGU8ntyvI
}

func addNumbers (a, b, delay int) {
  // Decrementa el numero de goroutines a esperar
  defer wg.Done()

  res := a + b

  i32 := int32(delay)
  duration := time.Duration(i32)
  seconds := time.Second * duration
  time.Sleep(seconds)

  fmt.Printf("%d + %d = %d %s\n", a, b, res, seconds.String())
}

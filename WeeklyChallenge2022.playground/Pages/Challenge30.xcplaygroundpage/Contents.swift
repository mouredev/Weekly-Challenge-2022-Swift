#!/usr/bin/env ruby

#import Foundation

/*
 * Reto #30
 * MARCO DE PALABRAS
 * Fecha publicación enunciado: 26/07/22
 * Fecha publicación resolución: 01/08/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea una función que reciba un texto y muestre cada palabra en una línea, formando
 * un marco rectangular de asteriscos.
 * - ¿Qué te parece el reto? Se vería así:
 *   **********
 *   * ¿Qué   *
 *   * te     *
 *   * parece *
 *   * el     *
 *   * reto?  *
 *   **********
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */


def word_frame (sentence) 
  max_len = 0
  words = sentence.split
  words.each do |word|
    if word.length > max_len
      max_len = word.length
    end
  end

  # top line
  puts "*" * (max_len + 4)

  # core lines
  words.each do |word|
    puts "* " + word + " " * (max_len - word.length) + " *"
  end

  # bottom line
  puts "*" * (max_len + 4)

end

word_frame "Dos cosas son infinitas: la estupidez humana y el universo. Y de lo segundo ¡no estoy seguro!"
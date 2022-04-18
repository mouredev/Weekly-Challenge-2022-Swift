import Foundation

/*
 * Reto #15
 * ¿CUÁNTOS DÍAS?
 * Fecha publicación enunciado: 11/04/22
 * Fecha publicación resolución: 18/04/22
 * Dificultad: DIFÍCIL
 *
 * Enunciado: Crea una función que calcule y retorne cuántos días hay entre dos cadenas de texto que representen fechas.
 * - Una cadena de texto que representa una fecha tiene el formato "dd/MM/yyyy".
 * - La función recibirá dos String y retornará un Int.
 * - La diferencia en días será absoluta (no importa el orden de las fechas).
 * - Si una de las dos cadenas de texto no representa una fecha correcta se lanzará una excepción.
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
	"math"
	"strconv"
	"strings"
	"time"
)

// Go Playground Online https://go.dev/play/p/c3GnHUTvQXS
func main() {
	days, err := getNumberDays("15/04/2022", "18/04/2022")
	fmt.Println(days, err)

	days, err = getNumberDays("18/04/2022", "15/04/2022")
	fmt.Println(days, err)

	days, err = getNumberDays("18/100/2022", "15/04/2022")
	fmt.Println(days, err)
}

func getNumberDays(firstDate, lastDate string) (int, error) {
	const layoutTimeFormat = "2006-01-02"

	nFirstDate := reverseDate(firstDate)

	firstTime, err := time.ParseInLocation(layoutTimeFormat, nFirstDate, time.UTC)
	if err != nil {
		return 0, err
	}

	nLastDate := reverseDate(lastDate)

	lastTime, err := time.ParseInLocation(layoutTimeFormat, nLastDate, time.UTC)
	if err != nil {
		return 0, err
	}

	duration := firstTime.Sub(lastTime)
	daysF64 := math.Abs(duration.Hours() / 24.0)
	days := int(daysF64)

	return days, nil
}

func reverseDate(str string) string {
	input := strings.Split(str, "/")

	var output []string

	for i := len(input) - 1; i >= 0; i-- {
		output = append(output, input[i])
	}

	return strings.Join(output, "-")
}

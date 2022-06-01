import Foundation

/*
 * Reto #21
 * CALCULADORA .TXT
 * Fecha publicación enunciado: 23/05/22
 * Fecha publicación resolución: 01/06/22
 * Dificultad: MEDIA
 *
 * Enunciado: Lee el fichero "Challenge21.txt" incluido en el proyecto, calcula su resultado e imprímelo.
 * - El .txt se corresponde con las entradas de una calculadora.
 * - Cada línea tendrá un número o una operación representada por un símbolo (alternando ambos).
 * - Soporta números enteros y decimales.
 * - Soporta las operaciones suma "+", resta "-", multiplicación "*" y división "/".
 * - El resultado se muestra al finalizar la lectura de la última línea (si el .txt es correcto).
 * - Si el formato del .txt no es correcto, se indicará que no se han podido resolver las operaciones.
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
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

type Item struct {
	Operator   string
	Value      float64
	IsOperator bool
	IsInvalid  bool
}

const (
	Add = "+"
	Sub = "-"
	Mul = "*"
	Div = "/"
)

type Number struct {
	Value   float64
	IsValid bool
}

type Operation struct {
	Operator string
	IsValid  bool
}

type Calculator struct {
	Total     Number
	Operation Operation
	Number    Number
}

func (c *Calculator) Add() {
	if c.Number.IsValid {
		c.Total.Value += c.Number.Value
	}
}

func (c *Calculator) Sub() {
	if c.Number.IsValid {
		c.Total.Value -= c.Number.Value
	}
}

func (c *Calculator) Mul() {
	if c.Number.IsValid {
		c.Total.Value *= c.Number.Value
	}
}

func (c *Calculator) Div() {
	if c.Number.IsValid {
		c.Total.Value /= c.Number.Value
	}
}

func (c *Calculator) Result() string {
	if c.Operation.IsValid {
		return "Exite una operacion Incompleta, se necesita un numero"
	}

	return fmt.Sprintf("Resultado: %v", c.Total.Value)
}

func main() {
	file, err := os.Open("./Resources/Challenge21.txt")
	if err != nil {
		fmt.Println("No se encontro el archivo")
		return
	}

	defer file.Close()

	calculator := Calculator{}

	scanner := bufio.NewScanner(file)
	var lineNum int

	for scanner.Scan() {
		line := scanner.Text()
		item := parseLine(line)

		lineNum += 1

		if item.IsInvalid {
			fmt.Printf("Linea %d invalida: %s \n", lineNum, line)
			return
		}

		if !item.IsOperator {

			if calculator.Total.IsValid {

				if calculator.Operation.IsValid {

					if calculator.Number.IsValid {
						fmt.Printf("Linea %d invalida: Ya exite un valor numero previo, debe ser un operador\n", lineNum)
						return
					}

					calculator.Number.Value = item.Value
					calculator.Number.IsValid = true

					switch calculator.Operation.Operator {
					case Add:
						calculator.Add()

					case Sub:
						calculator.Sub()

					case Mul:
						calculator.Mul()

					case Div:
						calculator.Div()
					}

					calculator.Operation.Operator = ""
					calculator.Operation.IsValid = false

					calculator.Number.Value = 0.0
					calculator.Number.IsValid = false

				} else {
					fmt.Printf("Linea %d invalida: Ya exite un valor numero previo, debe ser un operador\n", lineNum)
					return
				}

			} else {
				calculator.Total.Value = item.Value
				calculator.Total.IsValid = true
			}
		}

		if item.IsOperator {

			if !calculator.Total.IsValid && !calculator.Number.IsValid {
				fmt.Printf("Linea %d invalida: Se necesita un valor numero previo \n", lineNum)
				return
			}

			if calculator.Operation.IsValid {
				fmt.Printf("Linea %d invalida: Ya exite un operador previo, se necesita un numero\n", lineNum)
				return
			}

			calculator.Operation = Operation{
				Operator: item.Operator,
				IsValid:  true,
			}
		}
	}

	if lineNum < 3 {
		fmt.Println("Operacion Incompleta")
		return
	}

	res := calculator.Result()
	fmt.Println(res)
}

func parseLine(line string) Item {
	s := strings.TrimSpace(line)

	var ok bool

	switch line {
	case Add, Sub, Mul, Div:
		ok = true
	}

	if ok {
		return Item{Operator: s, IsOperator: true}
	}

	f64, err := strconv.ParseFloat(s, 64)
	if err != nil {
		return Item{IsInvalid: true}
	}

	return Item{Value: f64}
}

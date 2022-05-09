import Foundation

/*
 * Reto #18
 * TRES EN RAYA
 * Fecha publicación enunciado: 02/05/22
 * Fecha publicación resolución: 09/05/22
 * Dificultad: DIFÍCIL
 *
 * Enunciado: Crea una función que analice una matriz 3x3 compuesta por "X" y "O" y retorne lo siguiente:
 * - "X" si han ganado las "X"
 * - "O" si han ganado los "O"
 * - "Empate" si ha habido un empate
 * - "Nulo" si la proporción de "X", de "O", o de la matriz no es correcta. O si han ganado los 2.
 * Nota: La matriz puede no estar totalmente cubierta. Se podría representar con un vacío "", por ejemplo.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */


const size = 3
const charX = "X"
const charO = "O"
const drawMsg = "Empate"
const nullMsg = "Nulo"

const (
	CharX     string = "X"
	CharO            = "O"
	CharEmpty        = ""
)

func getResultTicTacToe(matrix [3][3]string) string {
	var numX int
	var numO int

	for _, row := range matrix {
		for _, value := range row {
			if value == CharX {
				numX += 1
			} else if value == CharO {
				numO += 1
			}
		}
	}

	if numX == 0 && numO == 0 {
		return nullMsg
	}

	diff := math.Abs(float64(numX - numO))
	if diff > 1 {
		return nullMsg
	}

	var winChar string
	if numX > numO {
		winChar = charX
	} else if numO > numX {
		winChar = charO
	}

	const limit = 2
	numX = 0
	numO = 0

	for i := 0; i < size; i++ {
		x := limit - i
		y := limit - i

		y = y + i

		current := matrix[x][y]
		first := matrix[x][y-1]
		last := matrix[x][y-2]

		if current == first && current == last {
			if current == charX || current == charO {
				if winChar != "" && current != winChar {
					return nullMsg
				}

				if current == charX {
					numX += 1

				} else if current == charO {
					numO += 1
				}
			}
		}

		x = x + i
		y = limit - i

		current = matrix[x][y]
		first = matrix[x-1][y]
		last = matrix[x-2][y]

		if current == first && current == last {
			if current == charX || current == charO {
				if winChar != "" && current != winChar {
					return nullMsg
				}

				if current == charX {
					numX += 1

				} else if current == charO {
					numO += 1
				}
			}
		}
	}

	x := 2
	y := 2

	current := matrix[x][y]
	first := matrix[x-1][y-1]
	last := matrix[x-2][y-2]

	if current == first && current == last {
		if current == charX || current == charO {
			if winChar != "" && current != winChar {
				return nullMsg
			}

			if current == charX {
				numX += 1

			} else if current == charO {
				numO += 1
			}
		}
	}

	x = 0

	current = matrix[x][y]
	first = matrix[x+1][y-1]
	last = matrix[x+2][y-2]

	if current == first && current == last {
		if current == charX || current == charO {
			if winChar != "" && current != winChar {
				return nullMsg
			}

			if current == charX {
				numX += 1

			} else if current == charO {
				numO += 1
			}
		}
	}

	if numX > numO {
		return charX

	} else if numO > numX {
		return charO

	} else if numX == numO && winChar != "" {
		return drawMsg
	}

	return nullMsg
}

// Siento que pudo quedar mejor :v 
func main() {
	matrix := [3][3]string{
		{"", "", ""},
		{"", "", ""},
		{"", "", ""},
	}

	res := getResultTicTacToe(matrix)
	fmt.Println(nullMsg, res)

	matrix = [3][3]string{
		{"O", "X", "O"},
		{"O", "X", "X"},
		{"X", "O", "O"},
	}

	res = getResultTicTacToe(matrix)
	fmt.Println(drawMsg, res)

	matrix = [3][3]string{
		{"O", "X", "O"},
		{"X", "O", "X"},
		{"X", "O", "X"},
	}

	res = getResultTicTacToe(matrix)
	fmt.Println(drawMsg, res)

	matrix = [3][3]string{
		{"O", "X", "O"},
		{"O", "X", "X"},
		{"O", "O", "O"},
	}

	res = getResultTicTacToe(matrix)
	fmt.Println(nullMsg, res)

	matrix = [3][3]string{
		{"O", "X", "O"},
		{"", "X", ""},
		{"", "X", "O"},
	}

	res = getResultTicTacToe(matrix)
	fmt.Println(charX, res)

	matrix = [3][3]string{
		{"X", "X", "O"},
		{"", "O", ""},
		{"O", "X", ""},
	}

	res = getResultTicTacToe(matrix)
	fmt.Println(charO, res)

	matrix = [3][3]string{
		{"O", "X", "O"},
		{"X", "", "O"},
		{"X", "X", "O"},
	}

	res = getResultTicTacToe(matrix)
	fmt.Println(charO, res)

	matrix = [3][3]string{
		{"O", "X", "O"},
		{"", "", "O"},
		{"X", "X", "O"},
	}

	res = getResultTicTacToe(matrix)
	fmt.Println(charO, res)

	matrix = [3][3]string{
		{"O", "X", "O"},
		{"", "X", ""},
		{"X", "X", "O"},
	}

	res = getResultTicTacToe(matrix)
	fmt.Println(charX, res)

	matrix = [3][3]string{
		{"", "X", "O"},
		{"", "X", "O"},
		{"", "X", "O"},
	}

	res = getResultTicTacToe(matrix)
	fmt.Println(nullMsg, res)
}

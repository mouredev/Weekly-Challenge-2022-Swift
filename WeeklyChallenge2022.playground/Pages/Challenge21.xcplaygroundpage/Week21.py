"""
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
"""

from enum import Enum


class Operation(Enum):
    NONE = 0
    ADDITION = 1
    SUBTRACTION = 2
    MULTIPLY = 3
    SPLIT = 4


class Challenge21LinesOnMemory:
    # Constructor
    def __init__(self, path: str):
        self.number: float = 0
        self.path: str = path
        self.Lines = []
        self.operation = Operation.ADDITION
        self.read_file()
        self.calculate()

    # Read all lines in txt and stores on Lines array
    def read_file(self):
        with open(self.path) as file:
            self.Lines = file.readlines()

        self.remove_last_char()
        self.arrange_lines()

    def remove_last_char(self):
        for i in range(len(self.Lines)):
            if len(self.Lines[i]) > 1:
                self.Lines[i] = self.Lines[i][:-1]

    # Check line by line if is number or operation and parse it from str
    def arrange_lines(self):
        operations = {
            "+": Operation.ADDITION,
            "-": Operation.SUBTRACTION,
            "*": Operation.MULTIPLY,
            "/": Operation.SPLIT
        }

        for i in range(len(self.Lines)):
            if operations.get(self.Lines[i]) is not None:
                self.Lines[i] = operations.get(self.Lines[i])
            else:
                try:
                    self.Lines[i] = int(self.Lines[i])
                except ValueError:
                    self.Lines[i] = float(self.Lines[i])

    # Perform calculator operations
    def calculate(self):
        for line in self.Lines:
            if self.operation == Operation.NONE:
                self.operation = line
            else:
                if self.operation == Operation.ADDITION:
                    self.number += line
                elif self.operation == Operation.SUBTRACTION:
                    self.number -= line
                elif self.operation == Operation.MULTIPLY:
                    self.number *= line
                elif self.operation == Operation.SPLIT:
                    self.number /= line

                self.operation = Operation.NONE

        print(self.number)


if __name__ == '__main__':
    # Path to txt
    path: str = "Resources/Challenge21.txt"
    challenge = Challenge21LinesOnMemory(path)


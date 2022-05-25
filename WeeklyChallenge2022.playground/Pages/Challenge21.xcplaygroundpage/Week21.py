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
    """
    Enum to indicate what operation must be performed
    We can increase calculator operations adding new Operations to switch-case on
    perform_operation function and Operation Enum
    """
    NONE = 0
    PLUS = 1
    MINUS = 2
    MULTIPLY = 3
    SPLIT = 4


def remove_last_character(line: str) -> str:
    """
    This method will remove the newline character if exists
    :param line: Line to try to remove newline character
    :return: Line without newline character
    """
    if len(line) > 1:
        line = line[:-1]
    return line


def check_operation(line: str) -> Operation:
    """
    Checks if the given line have an operation
    :param line: Line to check
    :return: The operation, if it doesn't have an operation, it will return an Operation.NONE
    """
    if line == "+":
        return Operation.PLUS
    elif line == "-":
        return Operation.MINUS
    elif line == "*":
        return Operation.MULTIPLY
    elif line == "/":
        return Operation.SPLIT
    else:
        return Operation.NONE


def check_float(line: str) -> bool:
    """
    Checks if the given line can be parsed to a float value
    :param line: Line to check
    :return: True if it can be parsed, False if it can't be parsed
    """
    try:
        float(line)
        return True
    except ValueError:
        return False


def check_int(line: str) -> bool:
    """
    Checks if the given line can be parsed to an int value
    :param line: Line to check
    :return: True if it can be parsed, False if it can't be parsed
    """
    try:
        int(line)
        return True
    except ValueError:
        return False


def fix_decimals(line: str) -> str:
    """
    Fix decimal bad characters
    :param line: Line to fix
    :return: Fixed line
    """
    line = line.replace(",", ".")
    line = line.replace("'", ".")
    return line


def parse_number(line: str):
    """
    Parse the given line to a number format (integer or float)
    :param line: Line to parse
    :return: The parsed number (integer or float)
    """
    try:
        number: int = int(line)
    except ValueError:
        number: float = float(line)
    return number


def perform_operation(result: float, line: str, operation: Operation) -> float:
    """
    Perform the operation between the given number and the str to parse.
    We can increase calculator operations adding new Operations to switch-case on
    perform_operation function and Operation Enum
    :param result: Accumulated number
    :param line: str to parse and perform operation over result
    :param operation: Operation to perform
    :return: The number after operation
    """
    if operation is Operation.PLUS:
        result += parse_number(line)
    elif operation is Operation.MINUS:
        result -= parse_number(line)
    elif operation is Operation.MULTIPLY:
        result *= parse_number(line)
    elif operation is Operation.SPLIT:
        result /= parse_number(line)
    return result


class Challenge21:
    """
    Class used to solve week 21 challenge
    """
    def __init__(self, path_to_file: str):
        """
        Class constructor, it receives the path from parameter
        :param path_to_file: Path to txt
        """
        self.path = path_to_file

    def do_challenge(self):
        """
        As the challenge said, it will read line by line the txt, performing the necessary operations.
        Finally it will print the result or the error
        :return: None
        """

        error: bool = False
        """Used to stop the while loop in case of error"""
        operation: Operation = Operation.PLUS
        """Used to check the operation to perform"""
        result: float = 0

        with open(self.path, 'r') as file:
            # If we use "with" we have exception handling and automatically close the file
            line: str = file.readline()

            while line and not error:
                # It reads line by line until last one or an error appears
                line = remove_last_character(line)
                # First, we must remove the newline character

                if check_operation(line) is not Operation.NONE:
                    # At this point, line have an operation
                    if operation is not Operation.NONE:
                        # At this point, the line before had an Operation, and it's an error
                        # If we want to allow overwrite last operation, comment the next line
                        error = True

                    operation = check_operation(line)
                    # We put the operation to perform

                else:
                    # At this point, line doesn't have an operation
                    is_operation_last = False
                    line = fix_decimals(line)
                    # Fix decimal bad characters (if exists)

                    if check_float(line) or check_int(line):
                        # At this point the number format are correct
                        result = perform_operation(result, line, operation)
                        operation = Operation.NONE

                    else:
                        # At this point number format are incorrect
                        error = True

                line = file.readline()

            if not error:
                print(result)
            else:
                print("No se han podido realizar las operaciones")


if __name__ == '__main__':

    path: str = "Resources/Challenge21.txt"
    """Path to txt"""
    challenge = Challenge21(path)
    challenge.do_challenge()

//
// Reto 8: Entero a binario.
//
// Funciona hasta el número 1023.
// Para números más grandes, agregue más memoria cambiando el tipo 'long int'
//
#include <stdio.h>

int integer_to_binary (int integer);

int main (void) {
    long int user_input;

    printf("Ingrese el número: ");
    scanf("%ld", &user_input);

    user_input = integer_to_binary(user_input);
    printf("Número binario: %ld \n", user_input);

    return 0;
}

int integer_to_binary (int integer) {
    if (integer == 0) {
        return 0;
    } else {
        return (integer % 2) + 10 * integer_to_binary(integer / 2);
    }
}

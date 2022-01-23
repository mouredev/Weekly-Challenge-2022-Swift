#include <iostream>
#include <time.h>
using namespace std;
int main(void){
    int num1;
    int num2;
    int pri;
    unsigned t0, t1;
 
    t0=clock();
    
    cout << 2;
    cout << " es Primo" << endl;
    /* El 2 es primoC */
    for(num1=3;num1<100;num1++) {
        for(num2=1;num2<num1+1;num2++) {
            if(num2==1) {
                pri++; /* Asumimos que todos los numeros son divisibles por 1 */
            } else {
                if(num2%2==0) { /* Si el numero es par dificil que sea primo */
                    if(num1==2) { /* Si el nuumero a calcuular es 2 es primo */
                        pri=2;
                        break;
                    }
                }
                if(num1%num2==0) { /*Si el nume1 es divisible por num2 incrementamos los divisibles*/
                    pri++;
                } 
            }
        }
        if(pri==2) { /* pri = 2 solo ha sido divisible entre 1 y el mismo asi que es primo */
            cout << num1;
            cout << " es Primo" << endl;
        }
        pri=0;
    }
    t1 = clock();
 
    double time = (double(t1-t0)/CLOCKS_PER_SEC);
    cout << "Tiempo ejecucion: " << time << endl;
}

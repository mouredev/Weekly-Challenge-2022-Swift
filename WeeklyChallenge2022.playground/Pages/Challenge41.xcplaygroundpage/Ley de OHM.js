/*
 * Reto #41
 * LA LEY DE OHM
 * Fecha publicación enunciado: 10/10/22
 * Fecha publicación resolución: 17/10/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea una función que calcule el valor del parámetro perdido correspondiente a la ley de Ohm.
 * - Enviaremos a la función 2 de los 3 parámetros (V, R, I), y retornará el valor del tercero (redondeado a 2 decimales).
 * - Si los parámetros son incorrectos o insuficientes, la función retornará la cadena de texto "Invalid values".
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal"
 *   para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en
 *   https://retosdeprogramacion.com/semanales2022.
 *
 */

let V = 670;
let R = 5;

function OHM (V,R,I){

    if(V == 0 || R == 0){
        return "Invalid values";
    } else if(typeof V == "number" && typeof R == "number"){
        let resulI = V/R; 
        return  `la corriente es  igual a ${resulI.toFixed(2)}`  ;
    }else {
        return "Invalid values";
    }

}

console.log(`${OHM(V , R)}`)


let Vol = 6;
let Cor;
let Res = 7;

function OHMM (Vol, Res, Cor){
    try{
        if(typeof (Vol,Res, Cor) == "string" || typeof (Vol,Res,Cor) == "boolean"){
            throw "Error"
        } else{
            var Corr = Cor || Vol /  Res;
            if(Corr != Cor){
                let resultadoCor = Corr.toFixed(2);
                console.log(`La corriente es igual a ${resultadoCor}`)
            }
        
            var Ress = Res || Vol / Cor;
                if(Ress != Res){
                    let resultadoRes = Ress.toFixed(2);
                    console.log(`La resistencia es igual a ${resultadoRes}`)
                } 
            
            var Voll = Vol || Cor * Res;
                if(Voll != Vol){
                    let resultadoVoll = Voll.toFixed(2)
                    console.log(`El voltaje es igual a ${resultadoVoll}`)
                }
        }
    } catch (eror){
            console.log("Invalid values")
    }
}

OHMM(Vol, Res, Cor);
//Arreglos cons los que se lleva el control de los limitadores
let keysArr = [];
let validArr = [];

/**
 * Función que extrae los delimitadores "{}[]()" de la cadena a evaluar
 * @param {string} word cualquier string que desee el usuario
 */
function getDelimiters( word = '') {
    for (let i = 0; i <= (word.length - 1); i++ ){
    
        if (word.charAt(i) == '{' || word.charAt(i) == '}'|| 
            word.charAt(i) == '[' || word.charAt(i) == ']'||
            word.charAt(i) == '(' || word.charAt(i) == ')'
            ){
    
            keysArr.push(word.charAt(i));
        }
        
    }
    console.log(keysArr);
}


/**
 * Función que verifica que estén en orden los limitadores, ej: ([]) y no ([)]
 * @param {stack} arr pila que llevará el orden de los limitadores (, {, [ 
 * @returns true or false
 */
function isValid(arr = []){


    for( let j = 0; j <= (arr.length - 1); j++){

        if( arr[j] == '{' || arr[j] == '(' || arr[j] == '['){
            
            validArr.push(arr[j]);

        }
        else if( arr[j] == '}' || arr[j] == ')' || arr[j] == ']'){
            
            if( !verifyList(arr[j]) ){
                return false;
            }else{
                validArr.pop();
            }

        }

    }

    if( validArr.length === 0){
        return true;
    }else{
        return false;
    }
}

/**
 * Función que verifica que el delimitador que esté cerrando corresponda con el último abierto
 * @param {string} key delimitador recibido
 * @returns true or false
 */
function verifyList( key = '' ) {

    switch (key) {
        case '}':

            if( validArr[validArr.length - 1] == '{'){
                return true
            }
        case ']':

            if( validArr[validArr.length - 1] == '['){
                return true
            }
        case ')':

            if( validArr[validArr.length - 1] === '('){
                return true
            }

    
        default:
            return false;
    }

}

// const word = 'Este es un string{ que contiene ( muchos [ tipos de llaves] por lo que ) no pasa nada} si ( estos { se interponen} así)';
const word = '{ [ a * ( c + d ) ] - 5 }';
// const word = '{ a * ( c + d ) ] - 5 }';

getDelimiters( word );
( isValid(keysArr) ) ? console.log('La expresión esta equilibrada') : console.log('La expresion no está equilibrada');

/*
 * Reto #9
 * CÓDIGO MORSE
 * Fecha publicación enunciado: 02/03/22
 * Fecha publicación resolución: 07/03/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea un programa que sea capaz de transformar texto natural a código morse y viceversa.
 * - Debe detectar automáticamente de qué tipo se trata y realizar la conversión.
 * - En morse se soporta raya "—", punto ".", un espacio " " entre letras o símbolos y dos espacios entre palabras "  ".
 * - El alfabeto morse soportado será el mostrado en https://es.wikipedia.org/wiki/Código_morse.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */
class MorseEncrypter
{
     
    constructor(charactersInMorse)
    {
        this.charactersInMorse = charactersInMorse; 
    }

    conver(text)
    {
        if(this.isNaturalText(text)){
            return this.naturalTextToMorseText(text);
        }

        return this.morseTextToNaturalText();
    }

    naturalTextToMorseText(text)
    {
        let result =  "";
        const clearText = this.cleanDoubleMoreWhiteSpace(text);

        const words = clearText.split(" "); 
        
        words.forEach(word => {
            let wordInMorse = "";
            let letters = word.split(""); 

            letters.forEach(letter => {
                let morseCharacter = this.charactersInMorse[letter.toUpperCase()];

                if(!morseCharacter) 
                    throw Error("El texto contiene caracteres que no pueden ser representados");

                wordInMorse = wordInMorse.concat(`${morseCharacter} `);
            }); 

            result = result.concat(`  ${wordInMorse.trim()}`).trim(); 
        });

        return result.trim(); 
    }

    morseTextToNaturalText(text)
    {
        let result = "";
        const words = text.trim().split("  "); 
        
        words.forEach(word => {
            let wordInNatural = "";
            let letters = word.split(" "); 

            letters.forEach(letter => {
                let naturalCharacter = this.charactersInMorse.findKeyByValue(letter);
                if(!naturalCharacter) 
                    throw Error("El texto contiene caracteres que no pueden ser representados");

                wordInNatural = wordInNatural.concat(`${naturalCharacter}`);
            }); 

            result = result.concat(` ${wordInNatural.trim()} `).trim(); 
        });

        return result;
    }

    cleanDoubleMoreWhiteSpace(text)
    {
        return text.replace(/\s+/g, " ").trim(); 
    }

    isNaturalText(text)
    {
        if(!text && text != 0 ) return false; 
        
        text = text.toString().trim(); 

        return /[A-Za-z0-9\./\,\s\"]+$/.test(text); 
    }

    isMorse(text)
    {
        if(!text) return false; 

        return /[\.-\s]/.test(text.trim());
    }
}

let enc = new MorseEncrypter(charactersInMorse); 
let morse = enc.naturalTextToMorseText("culo");
let morse_dos = enc.naturalTextToMorseText("cu lo"); 
let natural = enc.morseTextToNaturalText(morse); 
let natural_dos = enc.morseTextToNaturalText(morse_dos); 
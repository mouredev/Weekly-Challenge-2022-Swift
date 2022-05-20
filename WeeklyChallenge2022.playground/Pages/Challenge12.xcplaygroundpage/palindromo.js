
function isPalindrome(str1='') {
    
    str1 = str1.toLowerCase();
    str1 = str1.normalize('NFD').replace(/[\u0300-\u036f]/g,'').replace(/ /g,'');

    for(let i = 0; i < str1.length ; i++){
        if(str1[i] != str1[ str1.length - 1 - i]) return false;
    }
    return true;
}

console.log(isPalindrome('Anä llevá al ósÖ lA avêllAnâ'));
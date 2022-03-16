function delCharacter(str1, str2) {
    
    let output = '';
    str1 = str1.toLowerCase();
    str2 = str2.toLowerCase();

    for( let i = 0; i < str1.length; i++){
        
        let flag = true;
        let cont = 0;
        while( (cont < str2.length ) && flag){
            if( str1.charAt(i) == str2.charAt(cont)) flag = false;
            cont += 1;
        }

        if(flag) output += str1.charAt(i);
    }

    return output;
}

function getDifference(str1, str2) {
    
    const out1 = delCharacter(str1,str2);
    const out2 = delCharacter(str2,str1);
    console.log(`out1: ${out1}, out2: ${out2}`);
}

getDifference('universitario','universal');
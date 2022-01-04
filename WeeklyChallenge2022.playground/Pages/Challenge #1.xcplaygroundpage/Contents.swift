import Foundation

func anagrama(_ str1: String, _ str2: String) -> Bool {
    if (str1 == str2) || (str1.count != str2.count) {return false}
    else {
        let sortStr1 = String((str1.lowercased()).sorted())
        let sortStr2 = String((str2.lowercased()).sorted())
        if sortStr1 == sortStr2 {return true}
        else {return false}
    }
}

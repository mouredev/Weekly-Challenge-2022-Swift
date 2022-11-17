import Foundation

func boumerang(array: [Int]) -> Int{
    var contBoumerang = 0
    
    for i in 0...array.count - 3 {
        let a = array[i]
        let b = array[i+1]
        let c = array[i+2]
        if a != b && b != c && a == c {
            print([a,b,c])
            contBoumerang += 1
        }
    }
    
    return contBoumerang
}

print(boumerang(array: [2, 1, 2, 3, 3, 4, 2, 4]))

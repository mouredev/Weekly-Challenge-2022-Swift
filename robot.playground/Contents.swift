import Foundation

func girar(direccion: String) ->String {
    var d = ""
    
    switch direccion {
        case "N":
            d = "O"
        case "S":
            d = "E"
        case "E":
            d = "N"
        case "O":
            d = "S"
        default:
            print("Dirección incorrecta")
    }
    
    return d
}

func avanzar(x: Int, y: Int, dato: Int, direccion: String) -> [Int] {
    var xx = x
    var yy = y
    switch direccion {
        case "N":
            yy += dato
        case "S":
            yy -= dato
        case "E":
            xx += dato
        case "O":
            xx -= dato
        default:
            print("Dirección incorrecta...")
    }
    
    return [xx,yy]
}

func dondeEsRobot(arreglo:[Int]) -> [Int] {
    var d =  "E"
    var x = 0
    var y = 0
    var coordenadas: [Int]
    for dato in arreglo {
        if dato < 0 {
            d = girar(direccion: d)
            d = girar(direccion: d)
            d = girar(direccion: d)
        } else {
            d = girar(direccion: d)
        }
        //print(d)
        coordenadas = avanzar(x: x, y: y, dato: abs(dato), direccion: d)
        x = coordenadas[0]
        y = coordenadas[1]
    }
    
    return [x,y]
}

print(dondeEsRobot(arreglo: [10,5,-2]))
print(dondeEsRobot(arreglo: [-2,3,-1,4]))

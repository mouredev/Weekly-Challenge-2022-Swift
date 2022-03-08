import Foundation
import AVFoundation

/*
 * Reto #9
 * CÓDIGO MORSE
 * Fecha publicación enunciado: 02/03/22
 * Fecha publicación resolución: 07/03/22
 * Dificultad: MEDIA
 *
 * Enunciado: Crea un programa que sea capaz de transformar texto natural a código morse y viceversa.
 * - Debe detectar automáticamente de qué tipo se trata y realizar la conversión.
 * - En morse se soporta raya ", .dash", punto ".", un espacio " " entre letras o símbolos y dos espacios entre palabras "  ".
 * - El alfabeto morse soportado será el mostrado en https://es.wikipedia.org/wiki/Código_morse.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

enum MorseCharacter: Character {
    case dot = "."
    case dash = "-"
    case space = " "
}

class Morse: NSObject {
    var dotSound: URL
    var dashSound: URL
    private var values: Dictionary<String, [MorseCharacter]>
    private var sounds: [URL?] = [URL?]()
    private var soundPlay: Int = Int.zero
    private var player: AVAudioPlayer?
    
    override init() {
        self.dotSound = URL(fileURLWithPath: Bundle.main.path(forResource: "dot.mp3", ofType:nil)!)
        self.dashSound = URL(fileURLWithPath: Bundle.main.path(forResource: "dash.mp3", ofType:nil)!)
        self.values = Dictionary<String, [MorseCharacter]>()
        self.values["A"] = [.dot, .dash, .space]
        self.values["B"] = [.dash, .dot, .dot, .dot, .space]
        self.values["C"] = [.dash, .dot , .dash, .dot, .space]
        self.values["CH"] = [.dash, .dash , .dash, .dash, .space]
        self.values["D"] = [.dash, .dot, .dot, .space]
        self.values["E"] = [.dot, .space]
        self.values["F"] = [.dot, .dot , .dash, .dot, .space]
        self.values["G"] = [.dash , .dash, .dot, .space]
        self.values["H"] = [.dot, .dot, .dot, .dot, .space]
        self.values["I"] = [.dot, .dot, .space]
        self.values["J"] = [.dot, .dash , .dash , .dash, .space]
        self.values["K"] = [.dash, .dot , .dash, .space]
        self.values["L"] = [.dot, .dash, .dot, .dot, .space]
        self.values["M"] = [.dash, .dash, .space]
        self.values["N"] = [.dash, .dot, .space]
        self.values["Ñ"] = [.dash , .dash, .dot, .dash, .dash, .space]
        self.values["O"] = [.dash , .dash, .dash, .space]
        self.values["P"] = [.dot , .dash , .dash, .dot, .space]
        self.values["Q"] = [.dash , .dash, .dot, .dash, .space]
        self.values["R"] = [.dot, .dash, .dot, .space]
        self.values["S"] = [.dot, .dot, .dot, .space]
        self.values["T"] = [.dash, .space]
        self.values["U"] = [.dot, .dot, .dash, .space]
        self.values["V"] = [.dot, .dot, .dot, .dash, .space]
        self.values["W"] = [.dot, .dash, .dash, .space]
        self.values["X"] = [.dash, .dot, .dot, .dash, .space]
        self.values["Y"] = [.dash, .dot, .dash , .dash, .space]
        self.values["Z"] = [.dash , .dash, .dot, .dot, .space]
        self.values["0"] = [.dash , .dash , .dash , .dash , .dash, .space]
        self.values["1"] = [.dot, .dash , .dash , .dash , .dash, .space]
        self.values["2"] = [.dot, .dot, .dash , .dash , .dash, .space]
        self.values["3"] = [.dot, .dot, .dot, .dash , .dash, .space]
        self.values["4"] = [.dot, .dot, .dot, .dot, .dash, .space]
        self.values["5"] = [.dot, .dot, .dot, .dot, .dot, .space]
        self.values["6"] = [.dash, .dot, .dot, .dot, .dot, .space]
        self.values["7"] = [.dash , .dash, .dot, .dot, .dot, .space]
        self.values["8"] = [.dash , .dash , .dash, .dot, .dot, .space]
        self.values["9"] = [.dash , .dash , .dash , .dash, .dot, .space]
        self.values["."] = [.dot , .dash, .dot, .dash, .dot, .dash, .space]
        self.values[","] = [.dash , .dash, .dot, .dot, .dash , .dash, .space]
        self.values["?"] = [.dot, .dot, .dash , .dash, .dot, .dot, .space]
        self.values["\""] = [.dot, .dash, .dot, .dot, .dash, .dot, .space]
        self.values["/"] = [.dash, .dot, .dot, .dash, .dot, .space]
        self.values[" "] = [.space]
    }
    
    func get(_ value: String) -> String {
        var code = ""
        let key = value.uppercased()
        if self.values.keys.contains(key) {
            self.values[key]?.forEach {
                code += String($0.rawValue)
                switch $0 {
                case .dot:
                    self.sounds.append(self.dotSound)
                case .dash:
                    self.sounds.append(self.dashSound)
                case .space:
                    self.sounds.append(nil)
                }
            }
        }
        return code
    }
    
    func play() {
        if let url = self.sounds[self.soundPlay] {
            var mySound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(url as CFURL, &mySound)
            AudioServicesPlaySystemSound(mySound);
            usleep(500000)
        } else {
            usleep(500000)
        }
        self.soundPlay += 1
        if  self.soundPlay < self.sounds.count {
            self.play()
        }
    }

    func get(_ codes: [MorseCharacter]) -> String {
        var value = ""
        var word = [MorseCharacter]()
        var last: MorseCharacter = .space
        codes.forEach {
            word.append($0)
            if $0 == .space{
                if last == .space {
                    value += " "
                } else {
                    value += self.values.first(where: { (key, value) in
                        return value.equals(word)
                    })?.key ?? ""
                }
                word = [MorseCharacter]()
            }
            last = $0
        }
        word.append(.space)
        value += self.values.first(where: { (key, value) in
            return value.equals(word)
        })?.key ?? ""
        return value
    }
}

extension Morse: AVAudioPlayerDelegate {
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.soundPlay += 1
        if  self.soundPlay < self.sounds.count {
            self.play()
        }
    }
    
}

extension Array where Element == MorseCharacter {
    func equals(_ compare: [MorseCharacter]) -> Bool {
        if self.count != compare.count {
            return false
        }
        var count = 0
        for value in self {
            if value.rawValue != compare[count].rawValue {
                return false
            }
            count += 1
        }
        return true
    }
}

extension String {
    func toMorse() -> String {
        let morse = Morse()
        var code = ""
        var character = ""
        var i = 0
        while i < self.count {
            character = self.get(i)
            i += 1
            if character.uppercased().elementsEqual("C") && self.get(i).uppercased().elementsEqual("H") {
                character += self.get(i)
                i += 1
            }
            code += morse.get(character)
        }
        DispatchQueue.main.async {
            morse.play()
        }
        return code
    }
    
    func translateMorse() -> String {
        var codes = [MorseCharacter]()
        self.forEach {
            if let code = MorseCharacter.init(rawValue: $0) {
                codes.append(code)
            }
        }
        
        return Morse().get(codes)
    }
    
    func get(_ count: Int) -> String {
        let start = self.index(self.startIndex, offsetBy: count)
        let end = self.index(self.startIndex, offsetBy: count+1)
        let range = start..<end
        return String(self[range])
    }
}

extension Character {
    
    func toString() -> String {
        String(self)
    }
    
}

print("sos 112".toMorse())
print("... --- ...  .---- .---- ..---  ---- ..- . -.-. .-".translateMorse())

//let player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "dash.mp3", ofType:nil)!))
//player.numberOfLoops = 0
//player.volume = 10
//player.play()

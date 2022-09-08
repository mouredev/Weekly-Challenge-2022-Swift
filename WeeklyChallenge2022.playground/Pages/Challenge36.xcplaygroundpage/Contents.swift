import Foundation

/*
 * Reto #36
 * LOS ANILLOS DE PODER
 * Fecha publicación enunciado: 06/08/22
 * Fecha publicación resolución: 14/09/22
 * Dificultad: MEDIA
 *
 * Enunciado: ¡La Tierra Media está en guerra! En ella lucharán razas leales a Sauron
 * contra otras bondadosas que no quieren que el mal reine sobre sus tierras.
 * Cada raza tiene asociado un "valor" entre 1 y 5:
 * - Razas bondadosas: Pelosos (1), Sureños buenos (2), Enanos (3), Númenóreanos (4), Elfos (5)
 * - Razas malvadas: Sureños malos (2), Orcos (2), Goblins (2), Huargos (3), Trolls (5)
 * Crea un programa que calcule el resultado de la batalla entre los 2 tipos de ejércitos:
 * - El resultado puede ser que gane el bien, el mal, o exista un empate. Dependiendo de la
 *   suma del valor del ejército y el número de integrantes.
 * - Cada ejército puede estar compuesto por un número de integrantes variable de cada raza.
 * - Tienes total libertad para modelar los datos del ejercicio.
 * Ej: 1 Peloso pierde contra 1 Orco, 2 Pelosos empatan contra 1 Orco, 3 Pelosos ganan a 1 Orco.
 *
 * Información adicional:
 * - Usa el canal de nuestro Discord (https://mouredev.com/discord) "🔁reto-semanal"
 *   para preguntas, dudas o prestar ayuda a la comunidad.
 * - Tienes toda la información sobre los retos semanales en
 *   https://retosdeprogramacion.com/semanales2022.
 *
 */

var bond_race = ["Pelosos","Sureños buenos","Enanos","Númenóreanos","Elfos"]
var bond_str = [1,2,3,4,5]
var malv_race = ["Sureños malos","Orcos","Goblins","Huargos","Trolls"]
var malv_str = [2,2,2,3,5]

var arm_bond = ["Pelosos","Pelosos","Pelosos","Pelosos","Elfos"]
var arm_malv = ["Orcos", "Goblins","Trolls"]

var arm_b_tot = 0
var arm_m_tot = 0

for bond in arm_bond{
    if let i = bond_race.firstIndex(of: bond){
        arm_b_tot += bond_str[i]
    }
}

for malv in arm_malv{
    if let i = malv_race.firstIndex(of: malv){
        arm_m_tot += malv_str[i]
    }
}
print("Razas bondadosas: \(arm_b_tot)")
print("Razas malvadas: \(arm_m_tot)")
if (arm_b_tot > arm_m_tot){
    print("Ganador Razas bondadosas")
}
    else if (arm_b_tot < arm_m_tot){
        print("Ganador Razas malvadas")
    }
    else{
        print("Empate")
    }


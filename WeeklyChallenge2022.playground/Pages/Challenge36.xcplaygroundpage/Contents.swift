import Foundation

/*
 * Reto #36
 * LOS ANILLOS DE PODER
 * Fecha publicación enunciado: 06/09/22
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


enum LightUnits {
    Peloso = 1, Sureno_bueno = 2, Enano = 3, Númenóreano = 4, Elfos = 5
}

enum DarkUnits {
    Sureno_malo = 1, Orco = 2, Goblin = 3, Huargo = 4, Trolls = 5
}

abstract class Army {
    army: Unit[];
    UnitFactory: UnitFactory;
    name: string
    value: number;

    constructor(unitFactory: UnitFactory, name: string) {
        this.UnitFactory = unitFactory;
        this.army = [];
        this.value = 0;
        this.name = name;
    }

    private _addUnit(unit: Unit | null): boolean {
        if (unit != null) {
            this.army.push(unit);
            this.value += unit.damage;
            return true;
        }
        return false;
    }

    public addUnit(index: number): boolean {
        let unit: Unit | null = null;
        unit = this.UnitFactory.CreateUnit(index);
        return this._addUnit(unit);
    }

    public Random() {
        let min: number = 1;
        let max: number = 10;
        let numUnits = Math.floor(Math.random() * (max - min + 1)) + min;
        for (let index = 0; index < numUnits; index++) {
            let unit = Math.floor(Math.random() * (5 - 1 + 1)) + 1;
            if (!this.addUnit(unit)) index--;
        }
    }
}

class Light extends Army {
    constructor() {
        super(new LightUnitsFactory(), "Light");
    }
}

class Dark extends Army {
    constructor() {
        super(new DarkUnitsFactory(), "Dark");
    }
}

abstract class UnitFactory {
    public abstract CreateUnit(index: number): Unit | null;
}

class LightUnitsFactory extends UnitFactory {
    public CreateUnit(index: number): Unit | null {
        switch (index) {
            case LightUnits.Sureno_bueno:
                return new Unit("Light", 2, "Sureño_bueno");
            case LightUnits.Elfos:
                return new Unit("Light", 1, "Peloso");
            case LightUnits.Enano:
                return new Unit("Light", 3, "Enano");
            case LightUnits.Númenóreano:
                return new Unit("Light", 4, "Númenóreano");
            case LightUnits.Peloso:
                return new Unit("Light", 5, "Elfo");
            default:
                return null
        }
    }
}

class DarkUnitsFactory extends UnitFactory {

    public CreateUnit(index: number): Unit | null {
        switch (index) {
            case DarkUnits.Sureno_malo:
                return new Unit("Dark", 2, "Sureño_malo");
            case DarkUnits.Orco:
                return new Unit("Dark", 1, "Orco");
            case DarkUnits.Goblin:
                return new Unit("Dark", 2, "Goblin");
            case DarkUnits.Huargo:
                return new Unit("Dark", 4, "Huargo");
            case DarkUnits.Trolls:
                return new Unit("Dark", 5, "Troll");
            default:
                return null
        }
    }

}

class Unit {

    type: string;
    name: string;
    damage: number;

    constructor(type: string, damage: number, name: string) {
        this.type = type;
        this.name = name;
        this.damage = damage;
    }

}

function Battle(Army1: Army, Army2: Army) {

    let winner: string;

    if (Army1.value == Army2.value) {
        winner = "Empate";
    } else {
        winner = Army1.value > Army2.value ? Army1.name : Army2.name;
    }
    console.log(`El resultado es: ${winner}`)

}

let army1 = new Light;
let army2 = new Dark;
army1.Random();
army2.Random();
Battle(army1,army2)

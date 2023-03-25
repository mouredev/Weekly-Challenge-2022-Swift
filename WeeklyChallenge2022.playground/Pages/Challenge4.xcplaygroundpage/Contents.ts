/*
 * Reto #4
 * ÁREA DE UN POLÍGONO
 * Fecha publicación enunciado: 24/01/22
 * Fecha publicación resolución: 31/01/22
 * Dificultad: FÁCIL
 *
 * Enunciado: Crea UNA ÚNICA FUNCIÓN (importante que sólo sea una) que sea capaz de calcular y retornar el área de un polígono.
 * - La función recibirá por parámetro sólo UN polígono a la vez.
 * - Los polígonos soportados serán Triángulo, Cuadrado y Rectángulo.
 * - Imprime el cálculo del área de un polígono de cada tipo.
 *
 * Información adicional:
 * - Usa el canal de nuestro discord (https://mouredev.com/discord) "🔁reto-semanal" para preguntas, dudas o prestar ayuda a la comunidad.
 * - Puedes hacer un Fork del repo y una Pull Request al repo original para que veamos tu solución aportada.
 * - Revisaré el ejercicio en directo desde Twitch el lunes siguiente al de su publicación.
 * - Subiré una posible solución al ejercicio el lunes siguiente al de su publicación.
 *
 */

interface Polygon {
  area(): number;
  printArea(): any;
}

class Triangle implements Polygon {
  constructor(private base: number, private height: number) {}

  area() {
    return (this.base * this.height) / 2;
  }
  printArea() {
    console.log(`El área del triángula es ${this.area()}`);
  }
}

class Rectangle implements Polygon {
  constructor(private length: number, private width: number) {}

  area() {
    return this.length * this.width;
  }
  printArea() {
    console.log(`El área del rectangulo es ${this.area()}`);
  }
}

class Square implements Polygon {
  constructor(private side: number) {}
  area() {
    return this.side * this.side;
  }
  printArea() {
    console.log(`El área del cuadrado es ${this.area()}`);
  }
}

const area = (polygon: Polygon): number => {
  polygon.printArea();
  return polygon.area();
};

let triangle = new Triangle(10, 5);
let rectangle = new Rectangle(5, 7);
let square = new Square(4);

area(triangle);
area(rectangle);
area(square);

import Alcancia from './alcancia.js';

// Creamos una nueva alcancía
const miAlcancia = new Alcancia();

miAlcancia.agregarMoneda(200);
miAlcancia.agregarMoneda(200);
miAlcancia.agregarMoneda(500);
miAlcancia.agregarMoneda(1000);

console.log("Monedas guardadas:", miAlcancia.contarMonedas());
console.log("Total ahorrado:", miAlcancia.calcularTotal());

miAlcancia.romper();
console.log("Monedas después de romper:", miAlcancia.contarMonedas());

// Importación de la función desde utilidades6.js
import { esElegibleParaPrestamo } from './utilidades6.js';

console.log(esElegibleParaPrestamo(3500000, 700));  // Elegible
console.log(esElegibleParaPrestamo(2500000, 700));  // No elegible
console.log(esElegibleParaPrestamo(4000000, 600));  // No elegible

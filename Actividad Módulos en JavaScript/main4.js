// Importación de la función desde utilidades4.js
import { nivelRiesgo } from './utilidades4.js';

console.log(nivelRiesgo(65, false)); // Alto riesgo (por edad > 60)
console.log(nivelRiesgo(50, true));  // Riesgo moderado
console.log(nivelRiesgo(25, true));  // Alto riesgo (por enfermedades)
console.log(nivelRiesgo(30, false)); // Bajo riesgo

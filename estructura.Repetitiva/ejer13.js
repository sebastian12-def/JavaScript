// Colocar un numero decimal en numero binario.
const prompt = require("prompt-sync")({ sigint: true });

let decimal = parseInt(prompt("Ingresa un número decimal: "));
let binario = decimal.toString(2); // convierte a binario
console.log(`El número ${decimal} en binario es: ${binario}`);

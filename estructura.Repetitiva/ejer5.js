// Precio de la entrada a la sala de juegos de la empresa
const prompt = require("prompt-sync")({ sigint: true });

let edad = parseInt(prompt("Ingrese su edad: "));

if (edad < 5) {
    console.log("Entrada gratis");
} else if (edad <= 17) {
    console.log("Precio de la entrada: 5000 pesos");
} else {
    console.log("Precio de la entrada: 10000 pesos");
}

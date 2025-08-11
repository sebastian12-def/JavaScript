// Repetir una frase 1 a 20 veces.
const prompt = require("prompt-sync")({ sigint: true });

let frase = prompt("Ingrese una frase: ");
let veces = parseInt(prompt("¿Cuántas veces? (1 a 20): "));

if (veces >= 1 && veces <= 20) {
    for (let i = 1; i <= veces; i++) {
        console.log(frase);
    }
} else {
    console.log("Número fuera de rango");
}

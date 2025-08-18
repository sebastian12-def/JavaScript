// Multiplos de 3
const prompt = require("prompt-sync")({ sigint: true });

let inicio = parseInt(prompt("Ingrese el número inicial: "));
let fin = parseInt(prompt("Ingrese el número final: "));

for (let i = inicio; i <= fin; i++) {
    if (i % 3 === 0) {
        console.log(i);
    }
}

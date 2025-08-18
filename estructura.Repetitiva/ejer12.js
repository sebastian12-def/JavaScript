// Suma de pares y promedio de impares.
const prompt = require("prompt-sync")({ sigint: true });

let inicio = parseInt(prompt("Ingrese el número inicial: "));
let fin = parseInt(prompt("Ingrese el número final: "));

let sumaPares = 0;
let sumaImpares = 0;
let contadorImpares = 0;

for (let i = inicio; i <= fin; i++) {
    if (i % 2 === 0) {
        sumaPares += i;
    } else {
        sumaImpares += i;
        contadorImpares++;
    }
}

console.log("Suma de números pares: " + sumaPares);
if (contadorImpares > 0) {
    console.log("Promedio de números impares: " + (sumaImpares / contadorImpares));
} else {
    console.log("No hubo números impares en el rango");
}

// Numero primo
const prompt = require("prompt-sync")({ sigint: true });

let numero = parseInt(prompt("Ingrese un número: "));
let esPrimo = true;

if (numero < 2) {
    esPrimo = false;
} else {
    for (let i = 2; i <= Math.sqrt(numero); i++) {
        if (numero % i === 0) {
            esPrimo = false;
            break;
        }
    }
}

if (esPrimo) {
    console.log(numero + " es primo");
} else {
    console.log(numero + " no es primo");
}

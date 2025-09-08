// Dia de la semana

const prompt = require("prompt-sync")({ sigint: true });

let numero = parseInt(prompt("Ingrese un número del 1 al 7: "));

let dias = ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"];

if (numero >= 1 && numero <= 7) {
    console.log(dias[numero - 1]);
} else {
    console.log("Número fuera de rango");
}

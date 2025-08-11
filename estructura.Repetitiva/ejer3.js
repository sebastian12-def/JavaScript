// votar si o no.
const prompt = require("prompt-sync")({ sigint: true });

let edad = parseInt(prompt("Ingrese su edad: "));

let tieneCedula = prompt("¿Tienes cédula? (si/no): ");
let inscritoCenso = prompt("¿Estás inscrito en el censo electoral? (si/no): ");

// Convertimos respuestas a booleanos
let cedulaOk = (tieneCedula === "si");
let inscritoOk = (inscritoCenso === "si");

// Evaluamos
if (edad >= 18 && cedulaOk && inscritoOk) {
    console.log("Puede votar.");
} else {
    console.log("No puede votar.");
}


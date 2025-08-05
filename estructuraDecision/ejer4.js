// switch
const prompt = require("prompt-sync")();

const mes = parseInt(prompt("Ingrese un mes (1-12): "));

switch (mes) {
  case 1:
    console.log("Enero");
    break;

  case 12:
    console.log("Diciembre");
    break;

  default:
    console.log("Mes no reconocido");
    break;
}

// Hacer un script que muestre una figura.
const prompt = require("prompt-sync")({ sigint: true });

let filas = parseInt(prompt("¿Cuántas filas quieres?: "));

for (let i = 1; i <= filas; i++) {
  console.log("* ".repeat(i));
}

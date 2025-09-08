// Impuesto sobre el salario
const prompt = require("prompt-sync")({ sigint: true });

let salario = parseFloat(prompt("Ingrese su salario mensual: "));

if (salario <= 2000000) {
    console.log("No paga impuesto");
} else if (salario <= 5000000) {
    console.log("Impuesto a pagar: " + (salario * 0.10));
} else {
    console.log("Impuesto a pagar: " + (salario * 0.20));
}

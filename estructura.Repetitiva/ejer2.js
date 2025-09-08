// Suma de digitos leer un numero entero y sumar sus digitos 

// Pedimos un numero al usuario
let numero = parseInt(prompt("Introduce un numero entero:"));

let numeroTexto = numero.toString();

let suma = 0;

for (let i = 0; i < numeroTexto.length; i++) {
    suma += parseInt(numeroTexto[i]);
}

console.log("La suma de los dígitos del número " + numero + " es: " + suma);








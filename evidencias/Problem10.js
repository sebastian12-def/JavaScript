// Pedimos un número al usuario
let numero = prompt("Ingresa un número:");
numero = parseInt(numero);

// Resultado booleano: true si es par, false si es impar
let esPar = numero % 2 === 0;

// Mostramos el resultado
console.log(esPar);

// Aquí pedimos al usuario un número de dos cifras
let numero = prompt("Ingresa un número de dos cifras:");

// Convertimos el valor ingresado a número (por si viene como texto)
numero = parseInt(numero);

// Calculamos las decenas (parte entera de dividir entre 10)
let decenas = Math.floor(numero / 10);

// Calculamos las unidades (residuo de dividir entre 10)
let unidades = numero % 10;

// Mostramos los resultados en la consola
console.log("Decenas: " + decenas);
console.log("Unidades: " + unidades);

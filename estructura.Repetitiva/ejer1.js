//Determinar si un numero es par o impar

// Pedimos un numero al usuario
let numero = parseInt(prompt("Introduce un número entero:"));

// Verificamos si el numero es par o impar
if (numero % 2 === 0) {
    console.log("El número " + numero + " es par.");
} else {
    console.log("El número " + numero + " es impar.");
}

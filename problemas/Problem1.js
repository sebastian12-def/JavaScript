// Aqui declaro las variables de precio e iva

let precio = 3500
let iva = 15

// Aqui Calculo el IVA y el precio total
let ivaCalculado = (precio * iva) / 100

// Aqui sumo el IVA al precio
let precioTotal = precio + ivaCalculado

// Aqui muestro el resultado en la consola
console.log("El  Total a Pagar es: " + precioTotal);
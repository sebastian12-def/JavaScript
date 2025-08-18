// Aqui solicito al usuario que ingrese los kilometros recorridos
let kilometrosRecorridos = prompt("Por favor, ingresa los kilometros recorridos:");

// Aqui solicito al usuario los litros de combustible consumidos
let litrosConsumidos = prompt("Por favor, ingresa los litros de combustible consumidos:");

// Aqui calculo el consumo de combustible por kilometros
let consumo = litrosConsumidos / kilometrosRecorridos;

// Aqui muestro el resultado del consumo en la consola
console.log("El consumo de combustible por kilometro es:" + consumo);
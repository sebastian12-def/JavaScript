// Pedimos al usuario el número de personas
let personas = prompt("¿Cuántas personas comerán torta de papa?");
personas = parseInt(personas);

// Cálculos de ingredientes
let papa = personas * 200; // en gramos
let huevos = (papa / 1000) * 5; // 5 huevos por kilo de papa
let cebolla = (papa / 1000) * 300; // 300g cebolla por kilo de papa

// Mostramos resultados
console.log("Papa (g): " + papa);
console.log("Huevos: " + huevos);
console.log("Cebolla (g): " + cebolla);

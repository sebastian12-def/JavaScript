// Aqui creo un array de productos con algunos repetidos
const productos = [ "Arroz", "Leche", "Pan", "Arroz", "Huevos", "Leche", "Carne" ];
// Utilizo un Set para eliminar los duplicados
const productosUnicos = new Set(productos);
// agrego un Map que relaciona cada producto con su precio
const precios = new Map();
precios.set("Arroz", 3900);
precios.set("Leche", 2500);
precios.set("Pan", 1500);
precios.set("Huevos", 2000);
precios.set("Carne", 12000);
// Mostrar todos los productos unicos
console.log(" lista de productos disponibles: ");
for (const producto of productosUnicos) {
    console.log(`- ${producto} `);
}
// Consultar el precio de un producto
const productoBuscado = "Leche";
const precio = precios.get(productoBuscado);

if(precio) {
    console.log(`El precio de ${productoBuscado} es: $${precio}`);
} else {
    console.log("Producto no encontrado");
}








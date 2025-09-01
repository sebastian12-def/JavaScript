class Producto {
  constructor(nombre, precio) {
    this.nombre = nombre;
    this.precio = precio;
  }
}

// Clase Pedido (contiene productos)
class Pedido {
  constructor() {
    this.productos = [];
  }

  agregarProducto(producto) {
    this.productos.push(producto);
    console.log(`Se agregó el producto: ${producto.nombre} ($${producto.precio})`);
  }

  calcularTotal() {
    let total = 0;
    for (const producto of this.productos) {
      total += producto.precio;
    }
    return total;
  }
}
const pedido1 = new Pedido();

const prod1 = new Producto("Laptop", 3000);
const prod2 = new Producto("Mouse", 100);
const prod3 = new Producto("Teclado", 200);

pedido1.agregarProducto(prod1);
pedido1.agregarProducto(prod2);
pedido1.agregarProducto(prod3);

console.log("Total del pedido: $" + pedido1.calcularTotal());
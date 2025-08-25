import 'dart:io';

class Producto {
  String nombre;
  double precio;
  int stock;
  Producto(this.nombre, this.precio, this.stock);
}

class ItemCarrito {
  Producto producto;
  int cantidad;
  ItemCarrito(this.producto, this.cantidad);
}

void main() {
  final productos = <Producto>[
    Producto('Manzanas', 2.5, 10),
    Producto('Pan', 1.2, 15),
    Producto('Leche', 3.0, 8)
  ];
  final carrito = <ItemCarrito>[];

  double calcularTotal() {
    double total = 0;
    for (var item in carrito) {
      total += item.producto.precio * item.cantidad;
    }
    return total;
  }

  while (true) {
    print('''
--- MENÚ ---
1) Ver productos
2) Agregar al carrito
3) Eliminar del carrito
4) Ver carrito
5) Confirmar compra
6) Salir
''');

    switch (stdin.readLineSync()) {
      case '1':
        print('Productos disponibles:');
        for (var i = 0; i < productos.length; i++) {
          print(
              '[$i] ${productos[i].nombre} - \$${productos[i].precio} (Stock: ${productos[i].stock})');
        }
        break;

      case '2':
        for (var i = 0; i < productos.length; i++) {
          print(
              '[$i] ${productos[i].nombre} - \$${productos[i].precio} (Stock: ${productos[i].stock})');
        }
        stdout.write('Seleccione producto: ');
        final idx = int.parse(stdin.readLineSync()!);
        stdout.write('Cantidad: ');
        final cant = int.parse(stdin.readLineSync()!);

        if (cant <= productos[idx].stock && cant > 0) {
          carrito.add(ItemCarrito(productos[idx], cant));
          print('Producto agregado al carrito');
        } else {
          print('Cantidad inválida o sin stock');
        }
        break;

      case '3':
        if (carrito.isEmpty) {
          print('Carrito vacío');
          break;
        }
        for (var i = 0; i < carrito.length; i++) {
          print(
              '[$i] ${carrito[i].producto.nombre} x${carrito[i].cantidad}');
        }
        stdout.write('Seleccione índice para eliminar: ');
        final idx = int.parse(stdin.readLineSync()!);
        carrito.removeAt(idx);
        print('Producto eliminado del carrito');
        break;

      case '4':
        if (carrito.isEmpty) {
          print('Carrito vacío');
        } else {
          print('Carrito:');
          for (var item in carrito) {
            print('${item.producto.nombre} x${item.cantidad} - \$${item.producto.precio * item.cantidad}');
          }
          print('Total: \$${calcularTotal()}');
        }
        break;

      case '5':
        if (carrito.isEmpty) {
          print('Carrito vacío');
          break;
        }
        for (var item in carrito) {
          item.producto.stock -= item.cantidad;
        }
        carrito.clear();
        print('Compra confirmada. Gracias por su compra!');
        break;

      case '6':
        print('Saliendo...');
        return;
    }
  }
}

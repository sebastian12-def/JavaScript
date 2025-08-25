import 'dart:io';

class Producto {
  String nombre;
  double precio;
  int stock;

  Producto(this.nombre, this.precio, this.stock);

  @override
  String toString() =>
      '$nombre - \$${precio.toStringAsFixed(2)} - Stock: $stock';
}

void main() {
  final inventario = <Producto>[
    Producto('Arroz', 2.0, 5),
    Producto('Azúcar', 1.5, 3),
    Producto('Aceite', 4.0, 2),
  ];

  void mostrarAlertas() {
    final alertas = inventario.where((p) => p.stock <= 3);
    if (alertas.isNotEmpty) {
      print('\n⚠ ALERTA: Productos con stock bajo:');
      alertas.forEach((p) => print(' - ${p.nombre} (Stock: ${p.stock})'));
    }
  }

  while (true) {
    print('''
--- SISTEMA DE INVENTARIO ---
1) Ver inventario
2) Agregar producto
3) Vender producto
4) Salir
''');

    switch (stdin.readLineSync()) {
      case '1':
        print('Inventario:');
        inventario.forEach((p) => print(p));
        mostrarAlertas();
        break;

      case '2':
        stdout.write('Nombre del producto: ');
        final nombre = stdin.readLineSync()!;
        stdout.write('Precio: ');
        final precio = double.parse(stdin.readLineSync()!);
        stdout.write('Cantidad en stock: ');
        final stock = int.parse(stdin.readLineSync()!);

        inventario.add(Producto(nombre, precio, stock));
        print('Producto agregado.');
        break;

      case '3':
        for (var i = 0; i < inventario.length; i++) {
          print('[$i] ${inventario[i]}');
        }
        stdout.write('Seleccione el índice del producto a vender: ');
        final idx = int.parse(stdin.readLineSync()!);

        if (idx < 0 || idx >= inventario.length) {
          print('Índice inválido.');
          break;
        }
        stdout.write('Cantidad a vender: ');
        final cantidad = int.parse(stdin.readLineSync()!);

        if (cantidad <= 0 || cantidad > inventario[idx].stock) {
          print('Cantidad inválida o sin stock suficiente.');
        } else {
          inventario[idx].stock -= cantidad;
          print('Venta realizada.');
        }
        mostrarAlertas();
        break;

      case '4':
        print('Saliendo...');
        return;
    }
  }
}

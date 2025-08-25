import 'dart:io';

class Habitacion {
  int numero;
  String tipo;
  double precio;
  bool disponible;

  Habitacion(this.numero, this.tipo, this.precio, this.disponible);
}

class Reserva {
  String cliente;
  Habitacion habitacion;
  int noches;
  double total;

  Reserva(this.cliente, this.habitacion, this.noches)
      : total = habitacion.precio * noches;

  @override
  String toString() =>
      'Cliente: $cliente | Habitación: ${habitacion.numero} (${habitacion.tipo}) | Noches: $noches | Total: \$${total.toStringAsFixed(2)}';
}

void main() {
  final habitaciones = <Habitacion>[
    Habitacion(101, 'Simple', 50, true),
    Habitacion(102, 'Doble', 80, true),
    Habitacion(103, 'Suite', 150, true)
  ];

  final reservas = <Reserva>[];

  while (true) {
    print('''
--- GESTOR DE RESERVAS ---
1) Ver habitaciones disponibles
2) Hacer reserva
3) Cancelar reserva
4) Ver reservas
5) Salir
''');

    switch (stdin.readLineSync()) {
      case '1':
        print('Habitaciones disponibles:');
        habitaciones
            .where((h) => h.disponible)
            .forEach((h) => print('Hab ${h.numero} - ${h.tipo} - \$${h.precio}/noche'));
        break;

      case '2':
        print('Ingrese su nombre:');
        final nombre = stdin.readLineSync()!;
        print('Seleccione número de habitación disponible:');
        habitaciones
            .where((h) => h.disponible)
            .forEach((h) => print('${h.numero} - ${h.tipo} - \$${h.precio}/noche'));

        final numHab = int.parse(stdin.readLineSync()!);
        final hab = habitaciones.firstWhere((h) => h.numero == numHab && h.disponible,
            orElse: () => Habitacion(0, '', 0, false));

        if (hab.numero == 0) {
          print('Habitación no disponible.');
          break;
        }

        print('¿Cuántas noches?');
        final noches = int.parse(stdin.readLineSync()!);

        final reserva = Reserva(nombre, hab, noches);
        reservas.add(reserva);
        hab.disponible = false;
        print('Reserva confirmada: $reserva');
        break;

      case '3':
        if (reservas.isEmpty) {
          print('No hay reservas.');
          break;
        }
        print('Reservas:');
        for (var i = 0; i < reservas.length; i++) {
          print('[$i] ${reservas[i]}');
        }
        print('Ingrese el índice a cancelar:');
        final idx = int.parse(stdin.readLineSync()!);
        reservas[idx].habitacion.disponible = true;
        reservas.removeAt(idx);
        print('Reserva cancelada.');
        break;

      case '4':
        reservas.isEmpty
            ? print('No hay reservas.')
            : reservas.forEach((r) => print(r));
        break;

      case '5':
        print('Saliendo...');
        return;
    }
  }
}

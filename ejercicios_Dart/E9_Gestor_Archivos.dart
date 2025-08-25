import 'dart:io';

class Archivo {
  String nombre, tipo, ruta;
  double tamaño; // en MB
  DateTime fechaCreacion;

  Archivo(this.nombre, this.tamaño, this.tipo, this.fechaCreacion, this.ruta);

  @override
  String toString() =>
      '$nombre.$tipo | ${tamaño.toStringAsFixed(2)} MB | ${fechaCreacion.toLocal()} | Ruta: $ruta';
}

double leerDouble(String txt) {
  stdout.write(txt);
  return double.parse(stdin.readLineSync()!.replaceAll(',', '.'));
}

int leerInt(String txt) {
  stdout.write(txt);
  return int.parse(stdin.readLineSync()!);
}

void main() {
  final archivos = <Archivo>[];

  while (true) {
    print('''
1) Agregar archivo
2) Listar archivos
3) Buscar por nombre o tipo
4) Calcular espacio usado
5) Organizar (1=Fecha, 2=Tamaño)
6) Transferir archivo
7) Salir
''');

    switch (stdin.readLineSync()) {
      case '1':
        stdout.write('Nombre (sin extensión): ');
        final nombre = stdin.readLineSync()!;
        final tamaño = leerDouble('Tamaño en MB: ');
        stdout.write('Tipo (ej: jpg, pdf): ');
        final tipo = stdin.readLineSync()!;
        final fecha = DateTime.now();
        stdout.write('Ruta (ej: /docs): ');
        final ruta = stdin.readLineSync()!;
        archivos.add(Archivo(nombre, tamaño, tipo, fecha, ruta));
        break;
      case '2':
        archivos.isEmpty ? print('No hay archivos') : archivos.forEach(print);
        break;
      case '3':
        stdout.write('Buscar (nombre o tipo): ');
        final q = stdin.readLineSync()!.toLowerCase();
        final r = archivos.where((a) =>
            a.nombre.toLowerCase().contains(q) || a.tipo.toLowerCase() == q);
        r.isEmpty ? print('No hay coincidencias') : r.forEach(print);
        break;
      case '4':
        final total = archivos.fold(0.0, (s, a) => s + a.tamaño);
        print('Espacio usado: ${total.toStringAsFixed(2)} MB');
        break;
      case '5':
        stdout.write('Ordenar por (1=Fecha, 2=Tamaño): ');
        final op = stdin.readLineSync();
        if (op == '1') archivos.sort((a, b) => a.fechaCreacion.compareTo(b.fechaCreacion));
        if (op == '2') archivos.sort((a, b) => a.tamaño.compareTo(b.tamaño));
        print('Archivos organizados');
        break;
      case '6':
        for (var i = 0; i < archivos.length; i++) {
          print('[$i] ${archivos[i]}');
        }
        final idx = leerInt('Índice a transferir: ');
        if (idx >= 0 && idx < archivos.length) {
          stdout.write('Nueva ruta: ');
          archivos[idx].ruta = stdin.readLineSync()!;
          print('Archivo movido a ${archivos[idx].ruta}');
        }
        break;
      case '7':
        print('Saliendo...');
        return;
    }
  }
}

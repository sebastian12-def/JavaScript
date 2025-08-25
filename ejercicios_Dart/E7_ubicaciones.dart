import 'dart:io';
import 'dart:math';

enum Categoria { casa, trabajo, restaurante, hospital }

class Ubicacion {
  String nombre;
  double latitud, longitud;
  Categoria categoria;
  String notas;

  Ubicacion(this.nombre, this.latitud, this.longitud, this.categoria, this.notas);

  @override
  String toString() =>
      '$nombre | (${latitud.toStringAsFixed(4)}, ${longitud.toStringAsFixed(4)}) | ${categoria.name} | $notas';
}

double haversine(double lat1, double lon1, double lat2, double lon2) {
  const r = 6371.0;
  double rad(double d) => d * pi / 180;
  final dLat = rad(lat2 - lat1), dLon = rad(lon2 - lon1);
  final a = sin(dLat / 2) * sin(dLat / 2) +
      cos(rad(lat1)) * cos(rad(lat2)) * sin(dLon / 2) * sin(dLon / 2);
  return r * 2 * atan2(sqrt(a), sqrt(1 - a));
}

Categoria? leerCategoria() {
  print('Categorías: 1) casa 2) trabajo 3) restaurante 4) hospital');
  final op = stdin.readLineSync() ?? '';
  if (op == '1') return Categoria.casa;
  if (op == '2') return Categoria.trabajo;
  if (op == '3') return Categoria.restaurante;
  if (op == '4') return Categoria.hospital;
  return Categoria.values.firstWhere((c) => c.name == op, orElse: () => Categoria.casa);
}

double leerDouble(String txt) {
  stdout.write(txt);
  return double.parse(stdin.readLineSync()!.replaceAll(',', '.'));
}

void main() {
  final ubicaciones = <Ubicacion>[];
  while (true) {
    print('''
1) Agregar  2) Eliminar  3) Buscar por categoría
4) Distancia entre dos  5) Listar  6) Salir
''');
    switch (stdin.readLineSync()) {
      case '1':
        stdout.write('Nombre: ');
        final nombre = stdin.readLineSync()!;
        final lat = leerDouble('Latitud: ');
        final lon = leerDouble('Longitud: ');
        final cat = leerCategoria();
        stdout.write('Notas: ');
        final notas = stdin.readLineSync()!;
        ubicaciones.add(Ubicacion(nombre, lat, lon, cat!, notas));
        break;
      case '2':
        for (var i = 0; i < ubicaciones.length; i++) {
          print('[$i] ${ubicaciones[i]}');
        }
        stdout.write('Índice a eliminar: ');
        final idx = int.parse(stdin.readLineSync()!);
        if (idx >= 0 && idx < ubicaciones.length) ubicaciones.removeAt(idx);
        break;
      case '3':
        final cat = leerCategoria();
        final r = ubicaciones.where((u) => u.categoria == cat);
        r.isEmpty ? print('No hay resultados') : r.forEach(print);
        break;
      case '4':
        for (var i = 0; i < ubicaciones.length; i++) {
          print('[$i] ${ubicaciones[i]}');
        }
        stdout.write('Índice 1: ');
        final i1 = int.parse(stdin.readLineSync()!);
        stdout.write('Índice 2: ');
        final i2 = int.parse(stdin.readLineSync()!);
        if (i1 != i2 && i1 >= 0 && i2 >= 0 && i1 < ubicaciones.length && i2 < ubicaciones.length) {
          final a = ubicaciones[i1], b = ubicaciones[i2];
          print('Distancia: ${haversine(a.latitud, a.longitud, b.latitud, b.longitud).toStringAsFixed(2)} km');
        }
        break;
      case '5':
        ubicaciones.isEmpty ? print('No hay ubicaciones') : ubicaciones.forEach((u) => print(u));
        break;
      case '6':
        print('Saliendo...');
        return;
    }
  }
}

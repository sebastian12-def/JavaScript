import 'dart:io';

class Reseña {
  String usuario, comentario;
  int calificacion, utilidad;
  DateTime fecha;

  Reseña(this.usuario, this.calificacion, this.comentario, this.fecha, this.utilidad);

  @override
  String toString() =>
      '$usuario | $calificacion | "$comentario" | Utilidad: $utilidad | ${fecha.toLocal()}';
}

int leerInt(String txt) {
  stdout.write(txt);
  return int.parse(stdin.readLineSync()!);
}

void main() {
  final reseñas = <Reseña>[];

  while (true) {
    print('''
1) Agregar reseña
2) Calcular promedio de calificaciones
3) Filtrar por estrellas
4) Mostrar reseñas más útiles
5) Ver estadísticas
6) Listar todas
7) Salir
''');

    switch (stdin.readLineSync()) {
      case '1':
        stdout.write('Usuario: ');
        final u = stdin.readLineSync()!;
        final c = leerInt('Calificación (1-5): ');
        stdout.write('Comentario: ');
        final com = stdin.readLineSync()!;
        final util = leerInt('Puntaje de utilidad (0-100): ');
        reseñas.add(Reseña(u, c, com, DateTime.now(), util));
        break;
      case '2':
        if (reseñas.isEmpty) {
          print('No hay reseñas');
        } else {
          final prom = reseñas.fold(0, (s, r) => s + r.calificacion) / reseñas.length;
          print('Promedio de calificaciones: ${prom.toStringAsFixed(1)}');
        }
        break;
      case '3':
        final estrellas = leerInt('¿Filtrar por cuántas estrellas? ');
        final r = reseñas.where((x) => x.calificacion == estrellas);
        r.isEmpty ? print('Sin resultados') : r.forEach(print);
        break;
      case '4':
        if (reseñas.isEmpty) {
          print('No hay reseñas');
        } else {
          final top = [...reseñas]..sort((a, b) => b.utilidad.compareTo(a.utilidad));
          print('Top reseñas útiles:');
          top.take(3).forEach(print);
        }
        break;
      case '5':
        if (reseñas.isEmpty) {
          print('No hay reseñas');
        } else {
          final total = reseñas.length;
          final cincoEstrellas = reseñas.where((r) => r.calificacion == 5).length;
          print('Total: $total | 5 estrellas: $cincoEstrellas | Más útil: ${reseñas.reduce((a, b) => a.utilidad > b.utilidad ? a : b).usuario}');
        }
        break;
      case '6':
        reseñas.isEmpty ? print('No hay reseñas') : reseñas.forEach(print);
        break;
      case '7':
        print('Saliendo...');
        return;
    }
  }
}

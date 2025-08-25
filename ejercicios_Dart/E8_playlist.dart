import 'dart:io';
import 'dart:math';

class Cancion {
  String titulo, artista, genero;
  double duracion;
  int calificacion; // 1 a 5

  Cancion(this.titulo, this.artista, this.duracion, this.genero, this.calificacion);

  @override
  String toString() =>
      '$titulo - $artista | $genero | ${duracion.toStringAsFixed(2)} min | $calificacion';
}

class Playlist {
  String nombre;
  List<Cancion> canciones = [];

  Playlist(this.nombre);

  void agregar(Cancion c) => canciones.add(c);
  void eliminar(int i) => (i >= 0 && i < canciones.length) ? canciones.removeAt(i) : null;
  void reproducirAleatoria() {
    if (canciones.isEmpty) {
      print('No hay canciones');
    } else {
      final c = canciones[Random().nextInt(canciones.length)];
      print('▶ Reproduciendo: $c');
    }
  }

  double duracionTotal() => canciones.fold(0, (s, c) => s + c.duracion);
  List<Cancion> filtrarPorGenero(String g) =>
      canciones.where((c) => c.genero.toLowerCase() == g.toLowerCase()).toList();
  void estadisticas() {
    if (canciones.isEmpty) {
      print('No hay canciones');
      return;
    }
    final prom = canciones.fold(0, (s, c) => s + c.calificacion) / canciones.length;
    print('Canciones: ${canciones.length} | Duración total: ${duracionTotal().toStringAsFixed(2)} min | Promedio ⭐: ${prom.toStringAsFixed(1)}');
  }
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
  stdout.write('Nombre de la playlist: ');
  final playlist = Playlist(stdin.readLineSync()!);

  while (true) {
    print('''
1) Agregar canción
2) Eliminar canción
3) Reproducir aleatoria
4) Duración total
5) Filtrar por género
6) Ver estadísticas
7) Listar canciones
8) Salir
''');

    switch (stdin.readLineSync()) {
      case '1':
        stdout.write('Título: ');
        final t = stdin.readLineSync()!;
        stdout.write('Artista: ');
        final a = stdin.readLineSync()!;
        final d = leerDouble('Duración (min): ');
        stdout.write('Género: ');
        final g = stdin.readLineSync()!;
        final c = leerInt('Calificación (1-5): ');
        playlist.agregar(Cancion(t, a, d, g, c));
        break;
      case '2':
        for (var i = 0; i < playlist.canciones.length; i++) {
          print('[$i] ${playlist.canciones[i]}');
        }
        final idx = leerInt('Índice a eliminar: ');
        playlist.eliminar(idx);
        break;
      case '3':
        playlist.reproducirAleatoria();
        break;
      case '4':
        print('Duración total: ${playlist.duracionTotal().toStringAsFixed(2)} min');
        break;
      case '5':
        stdout.write('Género a filtrar: ');
        final g = stdin.readLineSync()!;
        final r = playlist.filtrarPorGenero(g);
        r.isEmpty ? print('No hay canciones de ese género') : r.forEach(print);
        break;
      case '6':
        playlist.estadisticas();
        break;
      case '7':
        playlist.canciones.isEmpty ? print('No hay canciones') : playlist.canciones.forEach(print);
        break;
      case '8':
        print('Saliendo...');
        return;
    }
  }
}

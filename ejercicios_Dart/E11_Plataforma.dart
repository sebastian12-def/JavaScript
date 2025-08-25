import 'dart:io';

class Leccion {
  String titulo, contenido;
  Leccion(this.titulo, this.contenido);
}

class Curso {
  String nombre, descripcion;
  List<Leccion> lecciones = [];
  Curso(this.nombre, this.descripcion);
}

class Usuario {
  String nombre;
  Map<String, Set<int>> progreso = {}; // curso -> índices completados
  Usuario(this.nombre);
}

int leerInt(String txt) {
  stdout.write(txt);
  return int.parse(stdin.readLineSync()!);
}

void main() {
  final cursos = <Curso>[];
  final usuarios = <Usuario>[];

  while (true) {
    print('''
1) Crear curso
2) Agregar lección a curso
3) Registrar usuario
4) Inscribir usuario a curso
5) Completar lección
6) Ver progreso
7) Listar cursos
8) Salir
''');

    switch (stdin.readLineSync()) {
      case '1':
        stdout.write('Nombre del curso: ');
        final nombre = stdin.readLineSync()!;
        stdout.write('Descripción: ');
        final desc = stdin.readLineSync()!;
        cursos.add(Curso(nombre, desc));
        break;

      case '2':
        if (cursos.isEmpty) {
          print('No hay cursos');
          break;
        }
        for (var i = 0; i < cursos.length; i++) {
          print('[$i] ${cursos[i].nombre}');
        }
        final idx = leerInt('Curso: ');
        stdout.write('Título de la lección: ');
        final t = stdin.readLineSync()!;
        stdout.write('Contenido: ');
        final c = stdin.readLineSync()!;
        cursos[idx].lecciones.add(Leccion(t, c));
        break;

      case '3':
        stdout.write('Nombre del usuario: ');
        usuarios.add(Usuario(stdin.readLineSync()!));
        break;

      case '4':
        if (usuarios.isEmpty || cursos.isEmpty) {
          print('Debe haber usuarios y cursos');
          break;
        }
        for (var i = 0; i < usuarios.length; i++) print('[$i] ${usuarios[i].nombre}');
        final u = leerInt('Usuario: ');
        for (var i = 0; i < cursos.length; i++) print('[$i] ${cursos[i].nombre}');
        final c = leerInt('Curso: ');
        usuarios[u].progreso[cursos[c].nombre] = {};
        print('${usuarios[u].nombre} inscrito en ${cursos[c].nombre}');
        break;

      case '5':
        if (usuarios.isEmpty) {
          print('No hay usuarios');
          break;
        }
        for (var i = 0; i < usuarios.length; i++) print('[$i] ${usuarios[i].nombre}');
        final u = leerInt('Usuario: ');
        final cursosUser = usuarios[u].progreso.keys.toList();
        if (cursosUser.isEmpty) {
          print('Usuario no inscrito en cursos');
          break;
        }
        for (var i = 0; i < cursosUser.length; i++) print('[$i] ${cursosUser[i]}');
        final cIdx = leerInt('Curso: ');
        final cursoSel = cursos.firstWhere((x) => x.nombre == cursosUser[cIdx]);
        for (var i = 0; i < cursoSel.lecciones.length; i++) print('[$i] ${cursoSel.lecciones[i].titulo}');
        final l = leerInt('Lección completada: ');
        usuarios[u].progreso[cursoSel.nombre]!.add(l);
        print('Lección marcada como completada');
        break;

      case '6':
        for (var i = 0; i < usuarios.length; i++) {
          final user = usuarios[i];
          print('${user.nombre}:');
          user.progreso.forEach((curso, comp) {
            final total = cursos.firstWhere((x) => x.nombre == curso).lecciones.length;
            print('- $curso: ${comp.length}/$total completadas');
          });
        }
        break;

      case '7':
        cursos.isEmpty
            ? print('No hay cursos')
            : cursos.forEach((c) => print('${c.nombre} (${c.lecciones.length} lecciones)'));
        break;

      case '8':
        print('Saliendo...');
        return;
    }
  }
}

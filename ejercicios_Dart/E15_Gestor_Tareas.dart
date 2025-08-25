import 'dart:io';

class Tarea {
  String descripcion;
  bool completada;

  Tarea(this.descripcion) : completada = false;

  @override
  String toString() =>
      '[${completada ? "✔" : "✗"}] $descripcion';
}

void main() {
  final tareas = <Tarea>[];

  while (true) {
    print('''
--- GESTOR DE TAREAS ---
1) Ver tareas
2) Agregar tarea
3) Marcar tarea como completada
4) Eliminar tarea
5) Salir
''');

    switch (stdin.readLineSync()) {
      case '1':
        tareas.isEmpty
            ? print('No hay tareas.')
            : tareas.asMap().forEach((i, t) => print('[$i] $t'));
        break;

      case '2':
        stdout.write('Descripción de la tarea: ');
        tareas.add(Tarea(stdin.readLineSync()!));
        print('Tarea agregada.');
        break;

      case '3':
        if (tareas.isEmpty) {
          print('No hay tareas.');
          break;
        }
        tareas.asMap().forEach((i, t) => print('[$i] $t'));
        stdout.write('Ingrese el índice a marcar: ');
        final idx = int.parse(stdin.readLineSync()!);
        if (idx >= 0 && idx < tareas.length) {
          tareas[idx].completada = true;
          print('Tarea completada.');
        } else {
          print('Índice inválido.');
        }
        break;

      case '4':
        if (tareas.isEmpty) {
          print('No hay tareas.');
          break;
        }
        tareas.asMap().forEach((i, t) => print('[$i] $t'));
        stdout.write('Ingrese el índice a eliminar: ');
        final idx = int.parse(stdin.readLineSync()!);
        if (idx >= 0 && idx < tareas.length) {
          tareas.removeAt(idx);
          print('Tarea eliminada.');
        } else {
          print('Índice inválido.');
        }
        break;

      case '5':
        print('Saliendo...');
        return;
    }
  }
}

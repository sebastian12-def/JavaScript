import 'dart:io'; // Para entrada/salida
import 'dart:core'; // Para DateTime

//  Definimos la clase Notificacion
class Notificacion {
  String titulo;
  String mensaje;
  String tipo; // info, advertencia, error
  DateTime fecha;
  bool leida;

  // Constructor
  Notificacion(this.titulo, this.mensaje, this.tipo)
    : fecha = DateTime.now(),
      leida = false;

  // Método para marcar como leída
  void marcarLeida() {
    leida = true;
  }

  // Método para mostrar la notificación en texto
  void mostrar() {
    print(
      "[$tipo] $titulo - $mensaje (${fecha.toLocal()}) [${leida ? "Leída" : "No leída"}]",
    );
  }
}

//  Función principal
void main() {
  print("=== Sistema de Notificaciones Push ===");

  // Lista para almacenar las notificaciones
  List<Notificacion> bandeja = [];

  // Crear algunas notificaciones de ejemplo
  bandeja.add(Notificacion("Bienvenida", "Gracias por usar la app", "info"));
  bandeja.add(Notificacion("Alerta", "Batería baja", "advertencia"));
  bandeja.add(
    Notificacion("Error", "No se pudo conectar al servidor", "error"),
  );

  // Mostrar todas
  print("\n--- Todas las notificaciones ---");
  for (var n in bandeja) {
    n.mostrar();
  }

  // Marcar la segunda como leída
  bandeja[1].marcarLeida();

  // Filtrar por tipo "error"
  print("\n--- Solo notificaciones de tipo ERROR ---");
  for (var n in bandeja.where((n) => n.tipo == "error")) {
    n.mostrar();
  }

  // Estadísticas
  int total = bandeja.length;
  int leidas = bandeja.where((n) => n.leida).length;
  int noLeidas = total - leidas;

  print("\n--- Estadísticas ---");
  print("Total: $total");
  print("Leídas: $leidas");
  print("No leídas: $noLeidas");
}

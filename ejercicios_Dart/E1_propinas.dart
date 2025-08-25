import 'dart:io';

void main() {
  // --- Calculadora de Propinas para Delivery ---
  print("=== Calculadora de Propinas ===");

  // Entrada: valor del pedido
  stdout.write("Ingrese el valor del pedido: ");
  double valorPedido = double.parse(stdin.readLineSync()!);

  // Entrada: tipo de servicio
  stdout.write("Ingrese el tipo de servicio (comida, farmacia, supermercado): ");
  String servicio = stdin.readLineSync()!;

  // Entrada: calidad del servicio
  stdout.write("Ingrese la calidad del servicio (excelente, bueno, regular): ");
  String calidad = stdin.readLineSync()!;

  // Determinar porcentaje según la calidad
  double porcentaje = 0;
  if (calidad == "excelente") {
    porcentaje = 0.20;
  } else if (calidad == "bueno") {
    porcentaje = 0.15;
  } else if (calidad == "regular") {
    porcentaje = 0.10;
  } else {
    print("Opción no válida, se usará 10% por defecto.");
    porcentaje = 0.10;
  }

  // Calcular propina y total
  double propina = valorPedido * porcentaje;
  double total = valorPedido + propina;

  // Salida
  print("\n--- Resumen ---");
  print("Servicio: $servicio");
  print("Calidad: $calidad");
  print("Propina: \$${propina.toStringAsFixed(2)}");
  print("Total a pagar: \$${total.toStringAsFixed(2)}");

  
  if (calidad == "excelente") {
    print("¡Gracias por tu generosidad! Excelente servicio reconocido.");
  } else if (calidad == "bueno") {
    print("Buen servicio, ¡gracias por apoyar al repartidor!");
  } else {
    print("Gracias por tu pedido, seguiremos mejorando.");
  }
}

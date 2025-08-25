import 'dart:io';

void main() {
  print("=== Calculadora de Tiempo de Viaje Urbano ===");

  //  Entrada de distancia en kilómetros
  stdout.write("Ingrese la distancia entre origen y destino (km): ");
  double distancia = double.parse(stdin.readLineSync()!);

  //  Entrada del medio de transporte
  stdout.write(
    "Ingrese el medio de transporte (pie, bicicleta, carro, publico): ",
  );
  String transporte = stdin.readLineSync()!.toLowerCase();

  //  Entrada de hora del día
  stdout.write("Ingrese la hora del día (pico o normal): ");
  String hora = stdin.readLineSync()!.toLowerCase();

  //  Velocidades promedio en km/h
  double velocidad = 0;
  double costo = 0;

  if (transporte == "pie") {
    velocidad = 5; // caminar ~5 km/h
  } else if (transporte == "bicicleta") {
    velocidad = 15; // bici promedio
  } else if (transporte == "carro") {
    velocidad = 40; // carro promedio
    costo = distancia * 500; // costo estimado gasolina/peaje
  } else if (transporte == "publico") {
    velocidad = 25; // bus promedio
    costo = distancia * 200; // costo estimado pasaje
  } else {
    print("Medio de transporte no válido.");
    return; // Salimos del programa
  }

  //  Ajuste por hora pico
  if (hora == "pico") {
    velocidad *= 0.7; // reducimos velocidad un 30%
  }

  //  Cálculo del tiempo en horas y minutos
  double tiempoHoras = distancia / velocidad;
  int horas = tiempoHoras.floor();
  int minutos = ((tiempoHoras - horas) * 60).round();

  //
  print("\n--- Resultados ---");
  print("Distancia: ${distancia.toStringAsFixed(2)} km");
  print("Medio de transporte: $transporte");
  print("Hora del día: $hora");
  print("Tiempo estimado: ${horas}h ${minutos}min");

  if (costo > 0) {
    print("Costo estimado: \$${costo.toStringAsFixed(0)}");
  }

  print("\n¡Buen viaje!");
}

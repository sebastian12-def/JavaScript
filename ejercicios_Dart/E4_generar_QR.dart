import 'dart:io';

void main() {
  print("=== Generador de QR para WiFi ===");

  //  Entrada: nombre de la red WiFi
  stdout.write("Ingrese el nombre de la red (SSID): ");
  String ssid = stdin.readLineSync()!;

  //  Entrada: tipo de seguridad
  stdout.write(
    "Ingrese el tipo de seguridad (WPA, WEP, abierta): ",
  ); // WPA significa WiFi Protected Access y WEP es Wired Equivalent Privacy
  String seguridad = stdin.readLineSync()!.toUpperCase();

  //  Entrada: contraseña (si no es red abierta)
  String contrasena = "";
  if (seguridad != "ABIERTA") {
    stdout.write("Ingrese la contraseña de la red: ");
    contrasena = stdin.readLineSync()!;

    // Validar seguridad de la contraseña
    if (contrasena.length < 8) {
      print(
        "\n La contraseña debe tener al menos 8 caracteres para ser segura.",
      );
      return;
    }
  }

  //  Construcción del string QR
  String qr = "WIFI:T:$seguridad;S:$ssid;P:$contrasena;;";

  //  Resultados
  print("\n--- Código QR generado (en texto) ---");
  print(qr);

  //  Instrucciones de uso
  print("\n--- Instrucciones ---");
  print("1. Copia el texto QR en un generador de códigos QR online.");
  print("2. Escanea el QR con tu celular.");
  print("3. El dispositivo se conectará automáticamente a la red $ssid.");
  print("\n¡QR generado con éxito!");
}

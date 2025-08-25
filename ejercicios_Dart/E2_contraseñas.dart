import 'dart:io';

void main() {
  print("=== Verificador de Contraseñas Seguras ===");

  //  Pedimos al usuario que escriba una contraseña
  // stdout.write muestra el mensaje en la misma línea
  stdout.write("Ingrese una contraseña: ");
  String contrasena = stdin
      .readLineSync()!; // Aquí se guarda lo que escribió el usuario

  //  Verificamos las condiciones que debe cumplir la contraseña
  // Cada variable es un "filtro" que puede ser verdadero (true) o falso (false)
  bool longitud = contrasena.length >= 8; // ¿Tiene al menos 8 caracteres?
  bool mayuscula = contrasena.contains(
    RegExp(r'[A-Z]'),
  ); // ¿Tiene alguna letra mayúscula?
  bool minuscula = contrasena.contains(
    RegExp(r'[a-z]'),
  ); // ¿Tiene alguna letra minúscula?
  bool numero = contrasena.contains(RegExp(r'[0-9]')); // ¿Tiene algún número?
  bool especial = contrasena.contains(
    RegExp(r'[!@#\$%^&*(),.?":{}|<>]'),
  ); // ¿Tiene algún carácter especial?

  //  Contamos cuántas reglas cumple la contraseña
  int puntos = 0;
  if (longitud) puntos++; // Suma un punto si cumple la longitud mínima
  if (mayuscula) puntos++; // Suma un punto si tiene mayúscula
  if (minuscula) puntos++; // Suma un punto si tiene minúscula
  if (numero) puntos++; // Suma un punto si tiene número
  if (especial) puntos++; // Suma un punto si tiene caracter especial

  //  Según el puntaje total, asignamos un nivel de seguridad
  String nivel = "";
  if (puntos <= 2) {
    nivel = "Débil"; // Cumple 2 o menos condiciones
  } else if (puntos == 3) {
    nivel = "Media"; // Cumple 3 condiciones
  } else if (puntos == 4) {
    nivel = "Fuerte"; // Cumple 4 condiciones
  } else {
    nivel = "Muy fuerte"; // Cumple las 5 condiciones
  }

  //  Mostramos los resultados al usuario
  print("\n--- Resultados ---");
  print("Contraseña: $contrasena"); // Mostramos la contraseña que ingresó
  print("Nivel de seguridad: $nivel"); // Mostramos el nivel calculado

  //  Sugerencias de mejora
  print("\nSugerencias de mejora:");
  if (!longitud) print("- Usa al menos 8 caracteres.");
  if (!mayuscula) print("- Incluye al menos una letra mayúscula (A-Z).");
  if (!minuscula) print("- Incluye al menos una letra minúscula (a-z).");
  if (!numero) print("- Incluye al menos un número (0-9).");
  if (!especial) print("- Incluye un carácter especial (!, @, #, etc).");

  print("\nVerificación completada.");
}

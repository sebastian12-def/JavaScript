import 'dart:io';

void main() {
  print("=== Calculadora de Descuentos por Volumen ===");

  //  Entrada: monto de compra
  stdout.write("Ingrese el monto de la compra: ");
  double monto = double.parse(stdin.readLineSync()!);

  //  Determinar el porcentaje de descuento según el rango
  double porcentaje = 0;
  if (monto <= 50) {
    porcentaje = 0.0; // sin descuento
  } else if (monto <= 100) {
    porcentaje = 0.05; // 5%
  } else if (monto <= 200) {
    porcentaje = 0.10; // 10%
  } else {
    porcentaje = 0.15; // 15%
  }

  //  Calcular descuento, subtotal y total con IVA
  double descuento = monto * porcentaje; // valor descontado
  double subtotal = monto - descuento; // monto después del descuento
  double iva = subtotal * 0.19; // IVA del 19%
  double totalFinal = subtotal + iva; // total a pagar

  //
  print("\n--- Resumen ---");
  print("Monto original: \$${monto.toStringAsFixed(2)}");
  print("Descuento aplicado: ${(porcentaje * 100).toStringAsFixed(0)}%");
  print("Ahorro: \$${descuento.toStringAsFixed(2)}");
  print("Subtotal (con descuento): \$${subtotal.toStringAsFixed(2)}");
  print("IVA (19%): \$${iva.toStringAsFixed(2)}");
  print("TOTAL a pagar: \$${totalFinal.toStringAsFixed(2)}");

  print("\n¡Gracias por su compra!");
}

// Función que calcula el precio final aplicando descuento
export function calcularDescuento(precio) {
  if (precio > 1000) {
    return precio - (precio * 0.20); // 20% de descuento
  } else if (precio >= 500 && precio <= 1000) {
    return precio - (precio * 0.10); // 10% de descuento
  } else {
    return precio; // sin descuento
  }
}

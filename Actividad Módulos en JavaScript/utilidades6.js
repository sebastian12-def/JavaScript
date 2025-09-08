// Función que determina si una persona es elegible para un préstamo
export function esElegibleParaPrestamo(salario, puntaje) {
  if (salario > 3000000 && puntaje > 650) {
    return "Elegible para préstamo";
  } else {
    return "No elegible para préstamo";
  }
}

// Función que determina el nivel de riesgo según edad y enfermedades
export function nivelRiesgo(edad, enfermedades) {
  if (edad > 60 || enfermedades === true) {
    return "Alto riesgo";
  } else if (edad >= 40 && edad <= 60 && enfermedades === true) {
    return "Riesgo moderado";
  } else {
    return "Bajo riesgo";
  }
}

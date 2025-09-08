// Función que clasifica el IMC en categorías
export function categoriaIMC(imc) { 
  if (imc < 18.5) { 
    return "Bajo peso"; // Bajo peso
  } else if (imc >= 18.5 && imc <= 24.9) { 
    return "Normal"; // Normal
  } else if (imc >= 25 && imc <= 29.9) {
    return "Sobrepeso"; // Sobrepeso
  } else {
    return "Obesidad"; // Obesidad
  }
}

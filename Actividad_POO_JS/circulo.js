class Circulo {
  /**
   * Constructor de la clase
   * @param {float} radio
   */
  constructor(radio) {
    this.radio = radio;
  }

  /**
   * Método que calcula el área
   * del círculo
   * @returns area
   */
  calcularArea() {
    return Math.PI * this.radio * this.radio;
  }
}

const radio = 5;
const circulo = new Circulo(radio);
const areaCirculo = circulo.calcularArea();

console.log(`El área del círculo de radio ${radio} es: ${areaCirculo.toFixed(2)}`);
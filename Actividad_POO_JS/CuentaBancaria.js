class CuentaBancaria {
  /**
   * Definición de la propiedad saldo como privada
   */
  #saldo;

  /**
   * @param {string} titular
   * @param {number} saldoInicial
   */
  constructor(titular, saldoInicial) {
    this.titular = titular;
    this.#saldo = saldoInicial;
  }

  /**
   * Método que permite realizar el proceso
   * de depositar un valor a la cuenta
   * @param {number} monto
   */
  depositar(monto) {
    if (monto > 0) {
      this.#saldo += monto;
      console.log(`Se depositaron $${monto}. Saldo actual: $${this.#saldo}`);
    } else {
      console.log("El monto debe ser mayor que cero.");
    }
  }

  /**
   * Método que permite retirar dinero
   * siempre y cuando no supere el saldo
   * @param {number} monto
   */
  retirar(monto) {
    if (monto > 0 && monto <= this.#saldo) {
      this.#saldo -= monto;
      console.log(`Se retiraron $${monto}. Saldo actual: $${this.#saldo}`);
    } else {
      console.log("Fondos insuficientes o monto inválido.");
    }
  }

  /**
   * Método que retorna el saldo actual
   * @returns {number}
   */
  obtenerSaldo() {
    return this.#saldo;
  }
}

// ==========================
// Implementación y pruebas
// ==========================
const cuenta = new CuentaBancaria("Sebastian", 2500000);

console.log(cuenta); // Muestra el objeto con titular

cuenta.depositar(500000);             // Deposita 500000
console.log(cuenta.obtenerSaldo());   // Muestra: 3000000

cuenta.retirar(1000000);              // Retira 1000000
console.log(cuenta.obtenerSaldo());   // Muestra: 2000000

console.log(cuenta.titular);          // "Sebastian"
console.log(cuenta.saldo);            // undefined (porque es privado)

class Animal {
  constructor(nombre) {
    this.nombre = nombre;
  }

  hacerSonido() {
    console.log(`${this.nombre} hace un sonido genérico.`);
  }
}

// Subclase Perro
class Perro extends Animal {
  constructor(nombre) {
    super(nombre);
  }

  hacerSonido() {
    console.log(`${this.nombre} ladra: ¡Guau guau!`);
  }
}

// Subclase Gato
class Gato extends Animal {
  constructor(nombre) {
    super(nombre);
  }

  hacerSonido() {
    console.log(`${this.nombre} maúlla: ¡Miau miau!`);
  }
}

const perro1 = new Perro("Max");
const gato1 = new Gato("Michi");

perro1.hacerSonido();
gato1.hacerSonido();

class Persona {
  constructor(identificacion, nombre, correo) {
    this.identificacion = identificacion;
    this.nombre = nombre;
    this.correo = correo;
  }
}

// Subclase Aprendiz
class Aprendiz extends Persona {
  constructor(identificacion, nombre, correo, puntajeIcfes) {
    super(identificacion, nombre, correo);
    this.puntajeIcfes = puntajeIcfes;
  }

  info() {
    console.log(`Aprendiz:
      ID: ${this.identificacion}
      Nombre: ${this.nombre}
      Correo: ${this.correo}
      Puntaje ICFES: ${this.puntajeIcfes}`);
  }
}

// Subclase Instructor
class Instructor extends Persona {
  constructor(identificacion, nombre, correo, especialidad) {
    super(identificacion, nombre, correo);
    this.especialidad = especialidad;
  }

  info() {
    console.log(`Instructor:
      ID: ${this.identificacion}
      Nombre: ${this.nombre}
      Correo: ${this.correo}
      Especialidad: ${this.especialidad}`);
  }
}

const aprendiz1 = new Aprendiz("123", "Sebastián", "sebas@mail.com", 350);
const instructor1 = new Instructor("456", "Carlos", "carlos@mail.com", "POO");

aprendiz1.info();
instructor1.info();

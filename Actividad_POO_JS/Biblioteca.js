class Autor {
  constructor(nombre, nacionalidad) {
    this.nombre = nombre;
    this.nacionalidad = nacionalidad;
  }
}

// Clase Editorial
class Editorial {
  constructor(nombre, ciudad) {
    this.nombre = nombre;
    this.ciudad = ciudad;
  }
}

// Clase Libro (compuesta por Autor y Editorial)
class Libro {
  constructor(titulo, anio, autor, editorial) {
    this.titulo = titulo;
    this.anio = anio;
    this.autor = autor;
    this.editorial = editorial;
  }

  info() {
    return `Libro: "${this.titulo}" (${this.anio})
    Autor: ${this.autor.nombre} - ${this.autor.nacionalidad}
    Editorial: ${this.editorial.nombre}, ${this.editorial.ciudad}`;
  }
}

const autor1 = new Autor("Gabriel García Márquez", "Colombiano");
const editorial1 = new Editorial("Sudamericana", "Buenos Aires");

const libro1 = new Libro("Cien años de soledad", 1967, autor1, editorial1);

console.log(libro1.info());
class Estudiante {
  /**
   * @param {string} nombre
   * @param {string[]} materias
   */
  constructor(nombre, materias = []) {
    this.nombre = nombre;
    this.materias = materias;
  }

  /**
   * Lista las materias del estudiante
   */
  listarMaterias() {
    console.log(`Materias de ${this.nombre}: ${this.materias.join(", ")}`);
  }
}
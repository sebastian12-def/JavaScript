import libros from './libros.json' with { type: 'json' };

// Filtra libros cuyo título contenga la palabra clave
export function consultarLibrosPorPalabraClaveTitulo(palabra) {
  return libros.filter(libro =>
    libro.titulo.toLowerCase().includes(palabra.toLowerCase())
  );
}

// Retorna un arreglo con título y número de páginas
export function consultarLibrosPaginas() {
  return libros.map(libro => ({
    titulo: libro.titulo,
    numeroPaginas: libro.numeroPaginas
  }));
}

import { consultarLibrosPorPalabraClaveTitulo, consultarLibrosPaginas } from './utilidades7.js';

console.log(" Libros con 'JavaScript' en el título:");
console.log(consultarLibrosPorPalabraClaveTitulo("JavaScript"));
console.log("\n Lista de libros con sus páginas:");
console.log(consultarLibrosPaginas());

function nombresMayusculas(nombres) {
    return nombres.map(nombre => nombre.toUpperCase());
}

console.log(nombresMayusculas(['Pedro','juan','MARTA'])); // ['PEDRO','JUAN','MARTA']

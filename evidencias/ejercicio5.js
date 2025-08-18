function contadorPalabras(texto) {
    let palabras = texto.trim().split(/\s+/);
    return palabras.length;
}

console.log(contadorPalabras("Hola mundo buenos dias")); // 4

function contarVocales(texto) {
    const vocales = 'aeiouáéíóú';
    let contador = 0;

    for (let i = 0; i < texto.length; i++) {
        let caracter = texto[i].toLowerCase();
        if (vocales.includes(caracter)) {
            contador++;
        }
    }

    return contador;
}

console.log(contarVocales("Hola mundo")); // Debería imprimir 4

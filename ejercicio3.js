function contadorPares(arreglo) {
    let contador = 0;
    for (let i = 0; i < arreglo.length; i++) {
        if (arreglo[i] % 2 === 0) {
            contador++;
        }
    }
    return contador;
}

console.log(contadorPares([1, 2, 3, 4, 5, 6])); // Debería imprimir 3

function invertirArreglo(arreglo) {
    let arregloInvertido = [];
    for (let i = arreglo.length - 1; i >= 0; i--) {
        arregloInvertido.push(arreglo[i]);
    }
    return arregloInvertido;
}

console.log(invertirArreglo([10, 22, 33, 44])); // Debería imprimir [4, 3, 2, 1]
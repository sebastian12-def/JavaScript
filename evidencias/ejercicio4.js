function sumaYpromedio(arreglo) {
    let suma = 0;
    for (let i = 0; i < arreglo.length; i++) {
        suma += arreglo[i];
    }
    let promedio = suma / arreglo.length;
    return {
        suma: suma,
        promedio: promedio
    };
}

console.log(sumaYpromedio([2, 4, 6, 8])); // Debería imprimir { suma: 20, promedio: 5 }
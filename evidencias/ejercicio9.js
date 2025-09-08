function indiceDe_for(valor, arreglo) {
    for (let i = 0; i < arreglo.length; i++) {
        if (arreglo[i] === valor) {
            return i; // lo encontró → devuelve la posición
        }
    }
    return -1; 
}

// 
console.log(indiceDe_for('b', ['a','b','c'])); // -> 1  (sí existe)
console.log(indiceDe_for('x', ['a','b','c'])); // -> -1 (no existe)
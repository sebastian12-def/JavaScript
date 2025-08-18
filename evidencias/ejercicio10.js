function reemplazar(arreglo, viejo, nuevo) {
    for (let i = 0; i < arreglo.length; i++) {
        if (arreglo[i] === viejo) {
            arreglo[i] = nuevo; // reemplazo
            break;              // detengo ciclo
        }
    }
    return arreglo;
}

let numeros = [10, 20, 30];
console.log(reemplazar(numeros, 20, 99));
// Explicación:
// i=0 → arreglo[0] = 10 (no es 20)
// i=1 → arreglo[1] = 20 (sí es 20) → reemplazo con 99
// arreglo final → [10, 99, 30]

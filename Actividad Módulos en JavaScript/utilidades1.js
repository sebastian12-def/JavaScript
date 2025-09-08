// Funcion que verifica si un numero esta entre el rango de 10 y 50.

export function enRango(numero) {
    if (numero >= 10 && numero <= 50) {
        return "Esta en el rango";
    } else {
        return "No esta en el rango";
    }
}
const mayusculas = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
const minusculas = "abcdefghijklmnopqrstuvwxyz";
const numeros = "0123456789";
const simbolos = "!@#$%^&?¿¡*()_+[]{}|;:'\",.<>/`~";

function obtenerAletorios(cadena, cantidad) {
    let resultado = "";
    for (let i = 0; i < cantidad; i++) {
        const indice = Math.floor(Math.random() * cadena.length);
        resultado += cadena[indice];
    }
    return resultado;
}

let contrasena = "";
contrasena += obtenerAletorios(mayusculas, 2);
contrasena += obtenerAletorios(minusculas, 2);
contrasena += obtenerAletorios(numeros, 2);
contrasena += obtenerAletorios(simbolos, 2);

contrasena = contrasena
    .split('')
    .sort(() => Math.random() - 0.5)
    .join('');

console.log("Contraseña generada:", contrasena);
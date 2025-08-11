const prompt = require("prompt-sync")();

function menu() {
    let opcion = 0;

    do {
        console.clear();
        console.log("MENU DE OPCIONES");
        console.log("1. Área del círculo");
        console.log("2. Adivinar un número entre 1 y 100");
        console.log("3. Salir\n");

        opcion = parseInt(prompt("Ingrese una opción: "));

        switch (opcion) {
            case 1:
                // Sigue con ejecutarConIntentos
                ejecutarConIntentos(() => {
                    const radio = parseFloat(prompt("Ingrese el radio del círculo: "));
                    if (!isNaN(radio) && radio > 0) {
                        const area = Math.PI * Math.pow(radio, 2);
                        console.log("El área del círculo es: " + area.toFixed(2));
                        return true; // éxito
                    } else {
                        console.log("Entrada inválida. Debe ser un número positivo.");
                        return false; // fallo
                    }
                });
                break;

            case 2:
                
                console.log("\n--- Adivinar un número entre 1 y 100 ---");
                const numeroSecreto = Math.floor(Math.random() * 100) + 1;
                let intentos = 0;
                let adivinado = false;

                while (intentos < 5 && !adivinado) {
                    console.log(`Intento ${intentos + 1} de 5`);
                    const intento = parseInt(prompt("Adivine el número: "));

                    if (isNaN(intento)) {
                        console.log("Entrada inválida. Ingrese un número entero.");
                    } else if (intento === numeroSecreto) {
                        console.log("¡Correcto! El número era " + numeroSecreto);
                        adivinado = true;
                    } else if (intento < numeroSecreto) {
                        console.log("El número es mayor.");
                    } else {
                        console.log("El número es menor.");
                    }
                    intentos++;
                }

                if (!adivinado) {
                    console.log("Has agotado los intentos. El número era: " + numeroSecreto);
                }
                break;

            case 3:
                console.log("\nSaliendo del programa...");
                break;

            default:
                console.log("\nOpción no válida.");
        }

        if (opcion !== 3) prompt("\nPresione Enter para continuar...");
    } while (opcion !== 3);
}

// Esta función es la que maneja 5 intentos. 
function ejecutarConIntentos(accion) {
    let intentos = 0;
    while (intentos < 5) {
        console.log(`Intento ${intentos + 1} de 5`);
        if (accion()) return; // éxito → salir
        intentos++;
    }
    console.log("Has agotado los 5 intentos.");
}

menu();

// Objeto elecciones
let elecciones = {
    totalAptos: 50,
    votosEmitidos: 0,
    candidato1: 0,
    candidato2: 0,
    candidato3: 0,
    blanco: 0,
    cerrada: false,
    clave: "1234",

    // Método para votar
    votar: function(opcion) {
        if (this.cerrada) {
            console.log("Elecciones cerradas.");
            return;
        }

        if (opcion === 1) {
            this.candidato1++;
        } else if (opcion === 2) {
            this.candidato2++;
        } else if (opcion === 3) {
            this.candidato3++;
        } else if (opcion === 4) {
            this.blanco++;
        } else {
            console.log("Opción inválida.");
            return;
        }

        this.votosEmitidos++;

        if (this.votosEmitidos >= this.totalAptos) {
            this.cerrada = true;
            console.log("Se alcanzaron los 50 votos. Elecciones cerradas.");
        }
    },

    // Método para cierre manual
    cerrarElecciones: function(claveIngresada) {
        if (claveIngresada === this.clave) {
            this.cerrada = true;
            console.log("Elecciones cerradas manualmente.");
        } else {
            console.log("Clave incorrecta.");
        }
    },

    // Método para reporte
    reporte: function() {
        console.log("----- REPORTE FINAL -----");
        console.log("Personas que votaron:", this.votosEmitidos);
        console.log("Candidato 1:", this.candidato1);
        console.log("Candidato 2:", this.candidato2);
        console.log("Candidato 3:", this.candidato3);
        console.log("Votos en blanco:", this.blanco);
    }
};

// Mostrar menú y permitir votar
while (!elecciones.cerrada) {
    let opcion = parseInt(prompt(
`MENÚ ELECCIONES
1. Votar Candidato 1
2. Votar Candidato 2
3. Votar Candidato 3
4. Votar en Blanco
5. Cerrar elecciones
Ingrese opción:`));

    if (opcion >= 1 && opcion <= 4) {
        elecciones.votar(opcion);
    } else if (opcion === 5) {
        let claveIngresada = prompt("Ingrese clave:");
        elecciones.cerrarElecciones(claveIngresada);
    } else {
        console.log("Opción inválida.");
    }
}


elecciones.reporte();

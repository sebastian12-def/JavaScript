// Banco - Ejercicio 15


let banco = {
    cuentas: new Map(),
    consecutivo: 1,

    // Generar código: año-consecutivo
    generarCodigo: function() {
        let year = new Date().getFullYear();
        let codigo = year + "-" + this.consecutivo;
        this.consecutivo++;
        return codigo;
    },

    // 1. Crear cuenta
    crearCuenta: function() {
        let codigo = this.generarCodigo();
        let cuenta = {
            codigo: codigo,
            fechaCreacion: new Date(),
            saldo: 0
        };
        this.cuentas.set(codigo, cuenta);
        console.log("Cuenta creada:", cuenta);
        return codigo; // retorno el código para usarlo
    },

    // 2. Consignar
    consignar: function(codigo, monto) {
        let cuenta = this.cuentas.get(codigo);
        if (!cuenta) {
            console.log("La cuenta no existe.");
            return;
        }
        if (monto <= 0) {
            console.log("Monto inválido.");
            return;
        }
        cuenta.saldo += monto;
        console.log("Consignación realizada. Nuevo saldo:", cuenta.saldo);
    },

    // 3. Retirar
    retirar: function(codigo, monto) {
        let cuenta = this.cuentas.get(codigo);
        if (!cuenta) {
            console.log("La cuenta no existe.");
            return;
        }
        if (monto <= 0) {
            console.log("Monto inválido.");
            return;
        }
        if (monto > cuenta.saldo) {
            console.log("Fondos insuficientes.");
            return;
        }
        cuenta.saldo -= monto;
        console.log("Retiro realizado. Nuevo saldo:", cuenta.saldo);
    },

    // 4. Consultar cuenta por código
    consultar: function(codigo) {
        let cuenta = this.cuentas.get(codigo);
        if (!cuenta) {
            console.log("La cuenta no existe.");
            return;
        }
        console.log("Datos de la cuenta:", cuenta);
    },

    // 6. Listar cuentas
    listar: function() {
        console.log("----- LISTADO DE CUENTAS -----");
        for (let cuenta of this.cuentas.values()) {
            console.log(cuenta);
        }
    }
};


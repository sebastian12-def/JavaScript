const prompt = require(" prompt-sync")()

const numero = prompt("Ingrese un numero:")

if((numero>=10 && numero<=99)  (numero>=-99 && numero<=-10)){
    console.log("El numero ${numero} tiene dos digitos")
}else{
    console.log("El numero ${numero} no tiene dos digitos")
}
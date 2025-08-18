function capitalDe(pais) {
    const paises = new Map();
    paises.set("Colombia", "Bogotá");
    paises.set("Argentina", "Buenos Aires");
    paises.set("Chile", "Santiago");
    paises.set("Perú", "Lima");
    paises.set("México", "Ciudad de México");
    paises.set("España", "Madrid");
    paises.set("Francia", "París");
    paises.set("Alemania", "Berlín");
    paises.set("Venezuela", "Caracas");
    paises.set("Brasil", "Brasilia");

    const capital = paises.get(pais);

    if (capital) {
        return capital;
    } else {
        return "Pais no registrado.";
    }

}

console.log(capitalDe("Colombia")); // Bogotá
console.log(capitalDe("Argentina")); // Buenos Aires    
console.log(capitalDe("Alemania")); // Berlín
console.log(capitalDe("Italia")); // Pais no registrado.
console.log(capitalDe("España")); // Madrid
console.log(capitalDe("Francia")); // París
console.log(capitalDe("Chile")); // Santiago
console.log(capitalDe("Perú")); // Lima
console.log(capitalDe("México")); // Ciudad de México
console.log(capitalDe("Venezuela")); // Caracas
console.log(capitalDe("Brasil")); // Brasilia
console.log(capitalDe("Japon")); // Pais no registrado.    
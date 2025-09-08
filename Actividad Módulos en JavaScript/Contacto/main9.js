import Contacto from './contacto9.js';


let contactos = [
  new Contacto("123", "Juan", "Torres", "juantorres45@gmail.com", "30012233"),
  new Contacto("6345789", "Camila", "Gómez", "camilAgomez34@gmail.com", "31045566")
];


mostrarContactos();

// Agregar contacto
window.agregarContacto = function () {
  const id = document.getElementById("id").value;
  const nombre = document.getElementById("nombre").value;
  const apellido = document.getElementById("apellido").value;
  const correo = document.getElementById("correo").value;
  const celular = document.getElementById("celular").value;

  if (contactos.some(c => c.id === id)) {
    alert("Ya existe un contacto con esta identificación");
    return;
  }

  const nuevo = new Contacto(id, nombre, apellido, correo, celular);
  contactos.push(nuevo);
  mostrarContactos();
  limpiarFormulario();
};

// Consultar contacto por identificación
window.consultarContacto = function () {
  const id = document.getElementById("id").value;
  const contacto = contactos.find(c => c.id === id);

  if (contacto) {
    document.getElementById("nombre").value = contacto.nombre;
    document.getElementById("apellido").value = contacto.apellido;
    document.getElementById("correo").value = contacto.correo;
    document.getElementById("celular").value = contacto.celular;
  } else {
    alert("No se encontró el contacto");
  }
};

// Actualizar contacto
window.actualizarContacto = function () {
  const id = document.getElementById("id").value;
  const contacto = contactos.find(c => c.id === id);

  if (contacto) {
    contacto.nombre = document.getElementById("nombre").value;
    contacto.apellido = document.getElementById("apellido").value;
    contacto.correo = document.getElementById("correo").value;
    contacto.celular = document.getElementById("celular").value;
    mostrarContactos();
    limpiarFormulario();
    alert("Contacto actualizado");
  } else {
    alert("No se encontró el contacto");
  }
};

// Eliminar contacto
window.eliminarContacto = function () {
  const id = document.getElementById("id").value;
  contactos = contactos.filter(c => c.id !== id);
  mostrarContactos();
  limpiarFormulario();
  alert("Contacto eliminado");
};

// Mostrar todos los contactos en la tabla
function mostrarContactos() {
  const tbody = document.getElementById("tablaContactos");
  tbody.innerHTML = "";

  contactos.forEach(c => {
    const fila = `<tr>
      <td>${c.id}</td>
      <td>${c.nombre}</td>
      <td>${c.apellido}</td>
      <td>${c.correo}</td>
      <td>${c.celular}</td>
    </tr>`;
    tbody.innerHTML += fila;
  });
}

// Limpiar formulario
function limpiarFormulario() {
  document.getElementById("id").value = "";
  document.getElementById("nombre").value = "";
  document.getElementById("apellido").value = "";
  document.getElementById("correo").value = "";
  document.getElementById("celular").value = "";
}

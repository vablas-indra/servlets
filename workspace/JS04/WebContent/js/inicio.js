// Estructura básica del objeto Factura
var factura = {
  empresa: {
    nombre:    "Nombre de la empresa",
    direccion: "Dirección de la empresa",
    telefono:  "900900900",
    nif:       ""
  },
  cliente: {
    nombre:    "Nombre del cliente",
    direccion: "Dirección del cliente",
    telefono:  "600600600",
    nif:       "XXXXXXXXX"
  },
  elementos: [
    { descripcion: "Producto 1", cantidad: 1, precio: 10 },
    { descripcion: "Producto 2", cantidad: 2, precio: 20 },
    { descripcion: "Producto 3", cantidad: 4, precio: 5 }
  ],
  informacion: {
    baseImponible:  0,
    iva:            21,
    total:          0,
    formaPago:      "contado"
  }
};

// Métodos de cálculo del total y de visualización del total
factura.calculaTotal = function() {
  for(var i=0; i<this.elementos.length; i++) {
    this.informacion.baseImponible += this.elementos[i].cantidad * this.elementos[i].precio;
  }
  var importeIva = (1 + (this.informacion.iva/100));
  this.informacion.total = (this.informacion.baseImponible * importeIva).toFixed(2);
}

factura.muestraTotal = function() {
  this.calculaTotal();
  alert("TOTAL = " + this.informacion.total + " euros");
}

factura.muestraTotal();
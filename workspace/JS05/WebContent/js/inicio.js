function descargaArchivo() {
	// Obtener la instancia del objeto XMLHttpRequest
	if(window.XMLHttpRequest) {
		peticion_http = new XMLHttpRequest();
	}
	else if(window.ActiveXObject) {//Navegadores obsoletos
		peticion_http = new ActiveXObject("Microsoft.XMLHTTP");
	}

	// Preparar la funcion de respuesta
	peticion_http.onreadystatechange = muestraContenido;

	// Realizar peticion HTTP
	peticion_http.open('GET', 'http://localhost:8080/JS05/holamundo.txt', true);
	peticion_http.send(null);

	function muestraContenido() {
		if(peticion_http.readyState == 4) {
			if(peticion_http.status == 200) {
				alert(peticion_http.responseText);
			}
		}
	}
}

window.onload = descargaArchivo;
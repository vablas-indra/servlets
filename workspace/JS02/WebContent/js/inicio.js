/**
 * 
 */

function creaNodo(){
	var parrafo = document.createElement("p");
	var contenido = document.createTextNode("Parrafo creado");
	parrafo.appendChild(contenido);
	document.body.appendChild(parrafo); 
}

function eliminaNodo(){
	var parrafo = document.getElementById("eliminable");
	parrafo.parentNode.removeChild(parrafo)

}

function getParrafos(){
	var parrafos = document.getElementsByTagName("p");
	for(var i=0; i<parrafos.length; i++) {
		  alert(parrafos[i].innerHTML);
		}
}

function getRadioButton(){
	var radioButton = document.getElementsByName("felicidad");
	for(var i=0; i<radioButton.length; i++) {
		  alert(radioButton[i].value);
		}
	for(var i=0; i<radioButton.length; i++) {
		if(radioButton[i].checked){
			alert("El radio button seleccionado es:"
					+radioButton[i].value)
		}
	}
	
}
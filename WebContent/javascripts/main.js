function alertaDE (){

	var alerta = 	document.createElement("div");
	alerta.className += "alert alert-danger";
		alerta.setAttribute ("role" , "alert");
		alerta.innerText += "Error de datos";''
		
		return alerta;
}
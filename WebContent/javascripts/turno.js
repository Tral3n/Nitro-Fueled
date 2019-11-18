$(document).ready(function() {
	
	
	//Funcion crear turno nuevo
	$("#CrearTurno").click(function(e){
		e.preventDefault();
		
		
	
		
		var datos =	$("#Turno").serialize();
		
		$.post("../ControladorTurno?"+ datos, function (res,est,jqXHR){
			
			console.log (res);
			if (res == "true") {

				alert("Se cambio la 'Vuelta' exitosamente");
				document.location.reload(true);
			} else {

				alert("no se hizo nada");

			}
			
			
			
		});
		
	
	

		
		
	});
	
	
	
	
	
	
	
	
	
});



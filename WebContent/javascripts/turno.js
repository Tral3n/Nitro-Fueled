$(document).ready(function() {
	
	
	//Funcion crear turno nuevo
	$("#CrearTurno").click(function(e){
		e.preventDefault();
		
		
	
		
		var datos =	$("#Turno").serialize();
		$.post("../ControladorTurno?"+ datos, function (res,est,jqXHR){
			
			console.log (res);
			var json = JSON.parse(res);
			if (json.turno && json.cliente) {

				alert("Se creo turno y cliente");
				document.location.reload(true);
			} else if (json.turno && !json.cliente){

				alert("Se creo el turno , la placa ya existe");
				document.location.reload(true);

			}else if((!json.turno && !json.cliente)){
				
				alert("No se hizo nada");
			}
			
			
			
		});
		
	
	

		
		
	});
	
	
	
	// Funcion para cancelar turno

	$("#Buscar_T").click(function(e) {
		
		
		e.preventDefault();

		var datos = $(this).closest("#Cancelar").serialize();

	

		$.ajax({ url: '../ControladorTurno?'+ datos ,type : 'put', success: function (res)  {

			if (res == "true") {

				alert("Se cambio la 'Vuelta' exitosamente");
				document.location.reload(true);
			} else {

				alert("no se hizo nada");

			}
		}
		});

	});
	
	
	
	
	
});



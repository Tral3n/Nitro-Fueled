$(document).ready(function() {

	// Funcion para la edicion de detalle de servicios

	$(".Editar_m").click(function(e) {

		e.preventDefault();
	
		var datos = $(this).closest("form").serialize();

//		alert(datos);
		
		$.ajax({ url: '../ControladorServicio?'+ datos ,type : 'put', success: function (res){

			if (res == "true") {

				alert("Se cambio la 'Vuelta' exitosamente");
				document.location.reload(true);
			} else {

				alert("no se hizo nada");

			}	
		}
		});


	});

	//funciion elimminar servicio
	
	$(".Eliminar_s").click(function(e) {

		e.preventDefault();

		var datos = $(this).closest("form").serialize();

		console.log(datos);
		
		$.ajax({
			
		    url: '../ControladorServicio?'+ datos ,
		    type: 'DELETE',
		    success: function(res) {
		    	if (res == "true") {

					alert("Se cambio la 'Vuelta' exitosamente");
					document.location.reload(true);
				} else {

					alert("no se hizo nada");

				}
		    }
		});



	});
	
	
	
	//Funcion crear servicio nuevo
	$(".Crear_s").click(function(e){
		e.preventDefault();
		
		
	
		
		var datos =	$(".Crear").serialize();
		
		$.post("../ControladorServicio?"+ datos, function (res,est,jqXHR){
			
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


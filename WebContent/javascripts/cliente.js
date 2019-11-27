$(document).ready(function() {

	// Funcion para la edicion de cliente

	$(".Editar_m").click(function(e) {
		

		e.preventDefault();

		var datos = $(this).closest("form").serialize();



		$.ajax({ url: '../ControladorCliente?'+ datos ,type : 'put', success: function (res)  {

			if (res == "true") {

				alert("Se cambio la 'Vuelta' exitosamente");
				document.location.reload(true);
			} else {

				alert("no se hizo nada");

			}
		}
		});

	});

	
	//Funcion crear cliente nuevo
	$("#Cliente_m").click(function(e){
		e.preventDefault();
		
		
	
		
		var datos =	$("#Crear").serialize();

		
		$.post("../ControladorCliente?"+ datos, function (res,est,jqXHR){
			
			console.log (res);
			if (res == "true") {

				alert("Se cambio la 'Vuelta' exitosamente");
				document.location.reload(true);
			} else {

				alert("no se hizo nada");

			}
			
			
			
		});
		
	
	

		
		
	});
	
//funciion elimminar cliente
	
	$(".Eliminar_c").click(function(e) {

		e.preventDefault();

		var datos = $(this).closest("form").serialize();

		console.log(datos);
		
		$.ajax({
			
		    url: '../ControladorCliente?'+ datos ,
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
	
	
	
});
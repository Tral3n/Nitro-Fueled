$(document).ready(function() {

	// Funcion para la edicion de detalle de servicios

	$(".Editar_m").click(function(e) {

		e.preventDefault();
	
		var datos = $(this).closest("form").serialize();



		$.post("../ControladorServicio", datos, function(res, est, jqXHR) {

			if (res == "true") {

				alert("Se cambio la 'Vuelta' exitosamente");
				document.location.reload(true);
			} else {

				alert("no se hizo nada");

			}

		});

	});

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

});


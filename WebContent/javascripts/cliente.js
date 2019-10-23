$(document).ready(function() {

	// Funcion para la edicion de cliente

	$(".Editar_m").click(function(e) {
		e.preventDefault();

		var datos = $(this).closest("form").serialize();



		$.post("../ControladorCliente", datos, function(res, est, jqXHR) {

			if (res == "true") {

				alert("Se cambio la 'Vuelta' exitosamente");
				document.location.reload(true);
			} else {

				alert("no se hizo nada");

			}

		});

	});

});
$(document).ready(function() {

	$("#modificar").click(function() {

		$("#Cantidad").prop("disabled", false);
		$("#Porcentaje").prop("disabled", false);
		$("#Guardar").css("visibility", "visible");

	});

	$("#btnsi").click(function() {

		var datos = $("#FConf").serialize();

		console.log(datos);
		
		$('#modal').modal('toggle');
		//enviar datos al servelet
		$.post("../ControladorConfiguracion", datos, function(res, est, jqXHR) {
		

			if (res == "true") {

				alert("Se cambio la 'Vuelta' exitosamente");
				document.location.reload(true);
			} else {

				alert("no se hizo nada");

			}
			
		});
		
			
		

		

	});
});
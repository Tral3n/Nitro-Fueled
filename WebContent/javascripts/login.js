$(document).ready(function() {

	
	
	//Funcion para el error de logian cuando los datos son incorrectos
	
	
	$("#login_m").click(function() {
		


		 
		
		
		var datos = $( "#login" ).serialize();
		
		$.post("Login", datos , function( res, est, jqXHR ){
			
			if (res == "true") {
				window.location = "sites/menu.jsp";
			}else{
				
//				document.getElementById("alerta").appenChild();
				document.body.appendChild(alertaDE());
				
			}
			
		
		}  );
		
		
	});
	
});

$(document).ready(function() {

	
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

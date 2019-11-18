<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

 <jsp:include page="../templetes/head.jsp"></jsp:include>
  <jsp:include page="../templetes/topbar.jsp"></jsp:include>
  <script src="../javascripts/turno.js" type="text/javascript"></script>
<title>Turnos</title>
</head>
<body>

<br>
<div class="container">
  <div class="row justify-content-md-center">
    <div class="col col-lg-2">
     
    </div>
    <div class="col-md-auto">
      
    </div>
    <div class="col col-lg-2">
     
    </div>
  </div>
  <div class="row">
    <div class="col">
    
    </div>
    <div class="col-md-auto">
     
    </div>
    <div class="col col-lg-2">
    <input type="text" class="form-control" id="formGroupExampleInput2" disabled="disabled" value="<%=    ">
    </div>
  </div>
</div>
<div class="jumbotron">


 
<form name="Turno"id="Turno">
<center><h3>Creación de turno</h3></center>

  <div class="form-group">
    <label for="formGroupExampleInput">Cedula</label>
    <input name="Cedula" type="number" class="form-control" id="formGroupExampleInput" placeholder="Cedula">
 
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">Placa</label>
    <input name="Placa" type="text" class="form-control" id="formGroupExampleInput2" placeholder="Placa">
  </div>
  
  <label for="formGroupExampleInput2">Tipo de auto</label>
   <select  name="Tipo_Auto"  class="form-control" id="exampleFormControlSelect1">
     <option value = "1">Automovil</option>
      <option value = "2">Moto</option>
      <option value = "3">Campero</option>
      <option value = "4">Bus</option>
    
    </select>
    <br>
      <label for="formGroupExampleInput2">Hora de entrada</label>
       <input type= "text" id="fecha"  class="form-control" disabled="disabled" >
<script>
	 document.getElementById('fecha').value = Date(Date.now()).toString().substr(16, 8);
	 </script>
	
 
 
 <br>
    <div class="col-md-2 	">

				<a class="text-decoration-none" href="../sites/liquidar.jsp">
					<button class="btn btn-success">
						
						<div class=" text-center ">
							Volver
							
							
						</div>
						
						</button>
						</a>
						
						<button class="btn btn-success" type = "submit" id="CrearTurno">
						
						<div class=" text-center ">
							Crear
							
							
						</div>
						
						</button>
						
</div> 

  
</form>

	</div>
	
	<div>
	

	
	
	</div>
 


</body>
</html>
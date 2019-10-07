<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

 <jsp:include page="../templetes/head.jsp"></jsp:include>
  <jsp:include page="../templetes/topbar.jsp"></jsp:include>
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
    <input type="text" class="form-control" id="formGroupExampleInput2" disabled="disabled" value="Turno #1">
    </div>
  </div>
</div>
<div class="jumbotron">


 
<form>
<center><h3>Creacion de turno</h3></center>

  <div class="form-group">
    <label for="formGroupExampleInput">Nombre</label>
    <input type="text" class="form-control" id="formGroupExampleInput" placeholder="Nombre">
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">Placa</label>
    <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="Placa">
  </div>
  
  <label for="formGroupExampleInput2">Tipo de auto</label>
   <select class="form-control" id="exampleFormControlSelect1">
      <option>Automovil</option>
      <option>Moto</option>
      <option>Campero</option>
      <option>Bus</option>
    
    </select>
    <br>
      <label for="formGroupExampleInput2">Hora de entrada</label>
   <input type="time" id="picker" class="form-control " >
 
 
 
     

  
</form>

	</div>
	
	<div>
	
<div class="col-md-2 	">

				<a class="text-decoration-none" href="../sites/liquidar.jsp">
					<button class="btn btn-success">
						
						<div class=" text-center ">
							Volver
							
							
						</div>
						
						</button>
						</a>
						
						<button class="btn btn-success">
						
						<div class=" text-center ">
							Crear
							
							
						</div>
						
						</button>
						
</div>
	
	
	</div>
 


</body>
</html>
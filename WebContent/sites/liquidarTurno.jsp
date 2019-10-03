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
<div class="jumbotron">
<form>
<center><h3>Liquidar</h3></center>
<div>
<button type="button" class="btn btn-secondary"  data-toggle="modal" data-target="#modal"> Importar  Turno *
								<span data-toggle="modal" data-target="#modal"
									class="fa  fa-file-import" aria-hidden="true"></span>
							</button> <!-- Modal -->
							
							<div class="modal fade" id="modal" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Numero de turno</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<form class="Editar">
											<div class="modal-body">
												<!-- body del formulario -->

												<div class="form-group row">
													<label for="Precio_nuevo"
														class="col-sm-2 col-form-label col-form-label-sm">Turno</label>
													<div class="col-sm-10">
													
													<input   name="Precio_nuevo" type="number" value=""
															class="form-control form-control-sm" id="Precio_nuevo"
															placeholder="Numero de turno">
														
															
													
														
													</div>
												</div>

											</div>
											
											
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Cancelar</button>
												<button   type="submit" class="btn btn-primary Editar_m">Buscar</button>
											</div>
										</form>
									</div>
								</div>
							</div>
</div>
<div>
<br>
<br>
<div class="container">
  <div class="row">
    <div class="col"><label for="inputPassword" class="col-sm-2 col-form-label">CC</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputPassword" placeholder="CC" disabled="disabled">
    </div></div>
    <div class="col"><label for="inputPassword" class="col-sm-2 col-form-label">Nombres</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputPassword" placeholder="Nombres" disabled="disabled">
    </div></div>
    <div class="col"><label for="inputPassword" class="col-sm- col-form-label">Tipo</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputPassword" placeholder="Tipo auto" disabled="disabled">
    </div></div>
    <div class="col"><label for="inputPassword" class="col-sm-2 col-form-label">Placa</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputPassword" placeholder="Placa" disabled="disabled">
    </div></div>
  </div>





</div>

<br>
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
     <button type="button" class="btn btn-secondary"> Agregar servicio
								<span data-toggle="modal" data-target="#modal"
									class="fa  fa-plus" aria-hidden="true"></span>
							</button> <!-- Modal -->
    </div>
  </div>
</div>

<table class="table">
  <thead>
    <tr>
      <th scope="col">Codigo</th>
      <th scope="col">Servicio</th>
      <th scope="col">Precio</th>
      
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
     
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Larry</td>
      <td>the Bird</td>
      
    </tr>
  </tbody>
</table>

 
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
							Totalizar
							
							
						</div>
						
						</button>
						
</div>
	
	
	</div>
 


</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="../templetes/head.jsp"></jsp:include>
  <jsp:include page="../templetes/topbar.jsp"></jsp:include>
  
  
<title>Reportes</title>
</head>
<body>
<br> <br>



<div class="jumbotron">

		<div class="row justify-content-center -w100" >
			<div class="col-md-3">
			
			
					<button class="btn btn-outline-primary" data-toggle="modal" data-target="#modal">
						<div class=" p-3 h1 ">
							<span data-toggle="modal" data-target="#modal"  class="fa  fa-clipboard-list" aria-hidden="true"></span>
						</div>
						<div class=" text-center mt-3">
							<h4>Servicios Realizados</h4>
						</div>
						<div class=" text-center mt-2">
							<h1>9332</h1>
						</div>
					</button>
				<div class="modal fade" id="modal" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Parametros</h5>
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
														class="col-sm-2 col-form-label col-form-label-sm">Desde la fecha</label>
													<div class="col-sm-10">
													
													<input   name="Precio_nuevo" type="datetime" value=""
															class="form-control form-control-sm" id="Precio_nuevo"
															placeholder="">												
													</div>
													<label for="Precio_nuevo"
														class="col-sm-2 col-form-label col-form-label-sm">Desde la fecha</label>
													<div class="col-sm-10">
													
													<input   name="Precio_nuevo" type="datetime" value=""
															class="form-control form-control-sm" id="Precio_nuevo"
															placeholder="">												
													</div>
												</div>

											</div>
											
											
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Cancelar</button>
												<button   type="submit" class="btn btn-primary Editar_m">Generar</button>
											</div>
										</form>
									</div>
								</div>
							</div>
			</div>
			
				
			
			
			
			
			
			
			</div>
			<div>
	<a class="text-decoration-none" href="../sites/menu.jsp">
					<button class="btn btn-success">
						
						<div class=" text-center ">
							Volver
							
							
						</div>
						
						</button>
						</a>
	</div>	
			</div>
			
	
 
</body>
</html>
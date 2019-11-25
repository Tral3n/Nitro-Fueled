<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

 <jsp:include page="../templetes/head.jsp"></jsp:include>
  <jsp:include page="../templetes/topbar.jsp"></jsp:include>
<title>Liquidación</title>
</head>
<body>




<div class="jumbotron">
		<div class="row justify-content-center -w100" >
			<div class="col-md-3">
				<a class="text-decoration-none" href="turnos.jsp">
					<button class="btn btn-outline-primary btn-block">
						<div class=" p-3 h1 ">
							<span class="fa  fa-ticket-alt" aria-hidden="true"></span>
						</div>
						<div class=" text-center mt-3">
							<h4>Turnos</h4>
						</div>
						<div class=" text-center mt-2">
							<h1>9332</h1>
						</div>
					</button>
				</a>
			</div>
			<div class="col-md-3">
				<a class="text-decoration-none" href="liquidarTurno.jsp">
					<button class="btn btn-outline-success btn-block">
						<div class=" p-3 h1 ">
							<span class="fa  fa-calculator" aria-hidden="true"></span>
						</div>
						<div class=" text-center mt-3">
							<h4>Liquidar</h4>
						</div>
						<div class=" text-center mt-2">
							<h1>9332</h1>
						</div>
					</button>
				</a>
			</div>
			<div class="col-md-3">
				<a class="text-decoration-none" >
					<button class="btn btn-outline-danger btn-block" data-toggle="modal"
					data-target="#modal">
						<div class=" p-3 h1 ">
							<span class="fa  fa-calculator" aria-hidden="true" data-toggle="modal" data-target="#modal"></span>
						</div>
						<div class=" text-center mt-3">
							<h4>Cancelar Turno</h4>
						</div>
						<div class=" text-center mt-2">
							<h1>9332</h1>
						</div>
					</button>
				</a>
				
				<!-- Modal -->

				<div class="modal fade" id="modal" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Numero de
									turno</h5>
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

											<input name="NROTURN" type="number" value=""
												class="form-control form-control-sm" id="NROTURN"
												placeholder="Numero de turno">



										</div>
									</div>

								</div>


								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Cancelar</button>
									<button id="Buscar_T" type="submit" class="btn btn-primary Buscar_T">Buscar</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			</div>
			
			</div>
			
	<div class="col-md-2 	">

				<a class="text-decoration-none" href="../sites/menu.jsp">
					<button class="btn btn-success">
						
						<div class=" text-center ">
							Volver
							
							
						</div>
						
						</button>
						</a>
</div>



</body>
</html>
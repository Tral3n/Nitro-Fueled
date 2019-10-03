<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <jsp:include page="../templetes/head.jsp"></jsp:include>
 
 <jsp:include page="../templetes/topbar.jsp"></jsp:include>
<title>Menu</title>

</head>

<body 	>


<!--menus -->
	<div class="jumbotron">
		<div class="row w-100">
			<div class="col-md-3">
				<a class="text-decoration-none" href="liquidar.jsp">
					<button class="btn btn-outline-primary btn-block">
						<div class=" p-3 h1 ">
							<span class="fa  fa-calculator" aria-hidden="true"></span>
						</div>
						<div class=" text-center mt-3">
							<h4>Liquidación</h4>
						</div>
						<div class=" text-center mt-2">
							<h1>9332</h1>
						</div>
					</button>
				</a>
			</div>
			<div class="col-md-3">
				<a class="text-decoration-none" href="clientes.jsp">
					<button class="btn btn-outline-success btn-block">
						<div class=" p-3 h1 ">
							<span class="fa  fa-car" aria-hidden="true"></span>
						</div>
						<div class=" text-center mt-3">
							<h4>Clientes</h4>
						</div>
						<div class=" text-center mt-2">
							<h1>9332</h1>
						</div>
					</button>
				</a>
			</div>
			<div class="col-md-3">
				<a class="text-decoration-none" href="servicio.jsp">
					<button class="btn btn-outline-danger btn-block">
						<div class=" p-3 h1 ">
							<span class="fa  fa-male" aria-hidden="true"></span>
						</div>
						<div class=" text-center mt-3">
							<h4>Servicios</h4>
						</div>
						<div class=" text-center mt-2">
							<h1>9332</h1>
						</div>
					</button>
				</a>
			</div>
			<div class="col-md-3">
				<a class="text-decoration-none" href="reportes.jsp">
					<button class="btn btn-outline-warning btn-block">
						<div class=" p-3 h1 ">
							<span class="fa  fa-file-signature" aria-hidden="true"></span>
						</div>
						<div class=" text-center mt-3">
							<h4>Reportes</h4>
						</div>
						<div class=" text-center mt-2">
							<h1>9332</h1>
						</div>
					</button>
				</a>
			</div>
		</div>
		<br> <br>

		<div class="row w-100">
			<div class="col-md-3">
				<a class="text-decoration-none" href="configuracion.jsp">
					<button class="btn btn-outline-warning btn-block">
						<div class=" p-3 h1 ">
							<span class="fa  fa-gear" aria-hidden="true"></span>
						</div>
						<div class=" text-center mt-3">
							<h4>Configución</h4>
						</div>
						<div class=" text-center mt-2">
							<h1>9332</h1>
						</div>
					</button>
				</a>
			</div>
		</div>
		
		</div>
</body>
</html>
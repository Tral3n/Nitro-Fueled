<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.ArrayList ,model.* ,include.*"%>

<%
	ModeloConfiguracion mc = new ModeloConfiguracion();
	//System.out.println(ms.GetServicio(1));
	Configuracion configuracion = mc.GetConfig();
	mc.cerrarConexion();
%>
<!DOCTYPE html>
<html>
<head>



<jsp:include page="../templetes/head.jsp"></jsp:include>
 <jsp:include page="../templetes/topbar.jsp"></jsp:include>
<script src="../javascripts/configuracion.js" type="text/javascript"></script>
<title>Configuracion</title>
</head>
<body>

	<div class="jumbotron">
<center><h3>Creacion de turno</h3></center>	

		<div class="row">


			<br> <br>
			<div class="col-md-12">


				<form  id="FConf" class="mt-1">

					<div class="form-group row">
						<label class="col-sm-2 col-form-label">Parametrización
							Cantidad de servicios para descuento :</label>
						<div class="col-sm-10">
							<input  name="Cantidad" disabled="disabled" type="number" class="form-control"
								id="Cantidad"
								placeholder="Cantidad de servicios para el descuento"
								value="<%=configuracion.getCANTIDAD()%>">
						</div>
					</div>
					<div class="form-group row">
						<label for="inputPassword" class="col-sm-2 col-form-label">Parametrización
							Porcentaje de descuento:</label>
						<div class="col-sm-10">
							<input name="Porcentaje" disabled="disabled" type="number" class="form-control"
								id="Porcentaje" placeholder="Porcentaje de descuento"
								value="<%=configuracion.getPORCENTAJE()%>">
						</div>
					</div>


				</form>

				<div class="row">
			

				<a class="text-decoration-none" href="../sites/menu.jsp">
					<button class="btn btn-success">
						
						<div class=" text-center ">
							Volver
							
							
						</div>
						
						</button>
						</a>

					<div class="col-md-2	">


						<button data-toggle="modal" data-target="#modal" id="Guardar"
							style="visibility: hidden" class="btn btn-success">

							<div class=" text-center">Guardar</div>


						</button>
						<div class="modal fade" id="modal" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Confirmación</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<form class="Editar">
										<div class="modal-body">
											<!-- body del formulario -->

											<p>¿Esta seguro?	</p>

										</div>


										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">NO</button>
											<button  id="btnsi" type="submit" class="btn btn-primary Editar_m">SI</button>
										</div>
									</form>
								</div>
							</div>
						</div>

					</div>


					<div class="col-md-2	">

						<a class="text-decoration-none" href="#">
							<button id="modificar" class="btn btn-success">

								<div class=" text-center">Modificar</div>
							</button>
						</a>
					</div>
				</div>
			</div>

		</div>


	</div>

</body>
</html>
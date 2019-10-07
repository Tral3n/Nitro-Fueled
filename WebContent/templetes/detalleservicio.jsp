<%@ page import="java.util.ArrayList ,model.* ,include.*"%>

<%
	ModeloServicio ms = new ModeloServicio();
	//System.out.println(ms.GetServicio(1));

	int id = Integer.parseInt(request.getParameter("id"));
	ArrayList<Precio> ListaServ = ms.GetDetalServ(id);
	ms.cerrarConexion();
%>

<!DOCTYPE html>
<html lang="en">
<head>


<jsp:include page="../templetes/head.jsp"></jsp:include>

<script src = "../javascripts/servicio.js">

</script>
<title>Detalle Servicios</title>

</head>


<body>


	<jsp:include page="../templetes/topbar.jsp"></jsp:include>


<br>
<br>

	<div class="container">


		<div class="row">
			<table class="table">
				<thead class="thead-dark">


					<tr>


						<th scope="col">Codigo</th>
						<th scope="col">Tipo de auto</th>
						<th scope="col">Acciones</th>
						<th scope="col">Precio</th>
					</tr>


				</thead>


				<tbody>
					<%
						for (Precio s : ListaServ) {
					%>

					<tr>

						<td><%=s.getID()%></td>
						<td><%=s.getTIPOAUTO()%></td>
						<td>
							<!-- boton modal de editar -->
							<button type="button" class="btn btn-primary">
								<span data-toggle="modal" data-target="#modal<%=s.getID()%>"
									class="fa  fa-pencil-alt" aria-hidden="true"></span>
							</button> <!-- Modal -->
							<div class="modal fade" id="modal<%=s.getID()%>" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Editar</h5>
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
														class="col-sm-2 col-form-label col-form-label-sm">Precio</label>
													<div class="col-sm-10">
													
													<input   name="Precio_nuevo" type="number" value="<%=s.getPRECIO()%>"
															class="form-control form-control-sm" id="Precio_nuevo"
															placeholder="Precio nuevo">
														<input   style="visibility: hidden" name="ID_Precio" type="text" value="<%=s.getID()%>"
															class="form-control form-control-sm" id="ID_Precio"
															placeholder="Precio nuevo">
															
															
													
														
													</div>
												</div>

											</div>
											
											
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Cancelar</button>
												<button   type="submit" class="btn btn-primary Editar_m">Guardar
													cambios</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</td>
						<td><%=s.getPRECIO()%></td>


					</tr>

					<%
						}
					%>
				</tbody>

			</table>


		</div>
		<div class="col-md-2	">

			<a class="text-decoration-none" href="../sites/servicio.jsp">
				<button class="btn btn-success">
					
					<div class=" text-center">Volver</div>
					</button>
					</a>
		</div>
		
	</div>





</body>
</html>

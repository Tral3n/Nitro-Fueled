<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import ="java.util.ArrayList ,model.* ,include.*" 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<jsp:include page="../templetes/head.jsp"></jsp:include>
<jsp:include page="../templetes/topbar.jsp"></jsp:include>
<% ModeloTurno mt = new ModeloTurno();
Turno turno = null;
if(request.getParameter("NROTURN")!= null){
	
	  turno = mt.GetTurnoActivo(Integer.parseInt(request.getParameter("NROTURN")));

	}




%>
<title>Liquidar</title>
</head>
<body>
<%=turno %>

	
	<div class="container">
		<div class="row justify-content-md-center">
			<div class="col col-lg-2"></div>
			<div class="col-md-auto"></div>
			<div class="col col-lg-2"></div>
		</div>
		<div class="row">
			<div class="col"></div>
			<div class="col-md-auto"></div>
			<div class="col col-lg-2">
				<input type="text" class="form-control" id="formGroupExampleInput2"
					disabled="disabled" value="Factura #1">
			</div>
		</div>
	</div>
	<div class="jumbotron">
		<form>
			<center>
				<h3>Liquidar</h3>
			</center>
			<div>
				<button type="button" class="btn btn-secondary" data-toggle="modal"
					data-target="#modal">
					Importar Turno * <span data-toggle="modal" data-target="#modal"
						class="fa  fa-file-import" aria-hidden="true"></span>
				</button>
			<% 
    if (request.getParameter("NROTURN") != null) {
        if (turno == null) { 
%>
            <div class="alert alert-danger" role="alert">
                El turno no existe!!
            </div>
<%
        } else {
            if (turno.isCANCEL()) {
%>
                <div class="alert alert-danger" role="alert">
                    El turno  ya fue liquidado!!
                </div>
<%
            }

        }

    } 
%>
						
				
				
				
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

			<br> <br>
			<div class="container">
				<div class="row">
					<div class="col">
						<label for="inputPassword" class="col-sm-1 col-form-label">CC</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputPassword"
								placeholder="CC" disabled="disabled">
						</div>
					</div>
					<div class="col">
						<label for="inputPassword" class="col-sm-1 col-form-label">Nombres</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputPassword"
								placeholder="Nombres" disabled="disabled">
						</div>
					</div>
					<div class="col">
						<label for="inputPassword" class="col-sm- col-form-label">Tipo</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputPassword"
								placeholder="Tipo auto" disabled="disabled">
						</div>
					</div>
					<div class="col">
						<label for="inputPassword" class="col-sm-1 col-form-label">Placa</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputPassword"
								placeholder="Placa" disabled="disabled">
						</div>
					</div>
				</div>





			</div>

			<br> <br>
			<div class="container">
				<div class="row justify-content-md-center">
					<div class="col col-lg-2"></div>
					<div class="col-md-auto"></div>
					<div class="col col-lg-2"></div>
				</div>
				<div class="row">
					<div class="col"></div>
					<div class="col-md-auto">
						<button disabled="disabled" type="button" class="btn btn-secondary"
							data-toggle="modal2" data-target="#modal2">
							Agregar servicio <span data-toggle="modal2" data-target="#modal2"
								class="fa  fa-plus" aria-hidden="true"></span>
								
						</button>
						
</div>


					
					</div>
					<br>
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th scope="col">Codigo</th>
								<th scope="col">Servicio</th>
								<th scope="col">Precio</th>

							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row"></th>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row"></th>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<th scope="row"></th>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
		</form>

	</div>

	<div>

		<div class="col-md-3	">

			<a class="text-decoration-none" href="../sites/liquidar.jsp">
				<button class="btn btn-success">

					<div class=" text-center ">Volver</div>

				</button>
			</a>

			<button class="btn btn-success">

				<div class=" text-center ">Totalizar	</div>

			</button>

		</div>


	</div>

</div>

</body>
</html>
    <%mt.cerrarConexion(); %> 
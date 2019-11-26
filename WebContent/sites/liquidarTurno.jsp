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
<script src="../javascripts/liquidarTurno.js" type="text/javascript"></script>
<% ModeloTurno mt = new ModeloTurno();
ModeloLiquidar ml = new ModeloLiquidar();
Turno turno = null;
ArrayList <Liquidar> Lista = null;
if(request.getParameter("NROTURN")!= null){
	
	  turno = mt.GetTurnoActivo(Integer.parseInt(request.getParameter("NROTURN")));
	  if(turno != null) {
	   Lista = ml.GetListaServLiq(turno.getID_TIPOAUTO()) ;
		  
	  }
	  
	  
	}


%>
<title>Liquidar</title>
</head>
<body>

	
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
					disabled="disabled" value="Factura#: <%=ml.getLastId()+1 %>">
			</div>
		</div>
	</div>
	<div class="jumbotron">
	
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
    if (request.getParameter("NROTURN" )  != null) {
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
                    El turno "<%=turno.getNROTURN()%>"  ya fue liquidado!!
                </div>
<%
            }

        }

    } 
%>
		
				<!-- Modal  Buscar turno-->

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
							<form class="" id="Buscar">
								<div class="modal-body">
									<!-- body del formulario -->

									<div class="form-group row">
										<label for="Precio_nuevo"
											class="col-sm-2 col-form-label col-form-label-sm">Turno</label>
										<div class="col-sm-10">

											<input name="NROTURN" type="number" value="<%=   (turno!=null)?request.getParameter("NROTURN"):""        %>"
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
				<form id="CrearLiquidar">
			<div class="container">
				<div class="row">
					<div class="col">
						<label for="inputPassword" class="col-sm-1 col-form-label">CC</label>
						<div class="col-sm-10">
							<input name="Cedula" type="text" class="form-control" id="Cedula"
								placeholder="CC" readonly value="<%=   (turno!=null)?turno.getCEDULA():""        %>">
						</div>
					</div>
					<div class="col">
						<label for="inputPassword" class="col-sm-1 col-form-label">Nombres</label>
						<div class="col-sm-10">
							<input name="Nombre" type="text" class="form-control" id="Nombre"
								placeholder="Nombre" readonly value="<%=   (turno!=null)?turno.getNOMBRE():""%>">
						</div>
						
					</div>
					<div class="col">
						<label for="inputPassword" class="col-sm- col-form-label">Tipo</label>
						<div class="col-sm-10">
							<input name="Tipoauto" type="text" class="form-control" id="Tipoauto"
								placeholder="Tipo auto" readonly value="<%=   (turno!=null)?mt.TipoAutoname(turno.getID_TIPOAUTO()):""        %>">
						</div>
					</div>
					<div class="col">
						<label for="inputPassword" class="col-sm-1 col-form-label">Placa</label>
						<div class="col-sm-10">
							<input  name="Placa" type="text" class="form-control" id="Placa"
								placeholder="Placa" readonly value="<%=   (turno!=null)?turno.getPLACA():""        %>">
						</div>
					</div>
				</div>
</div>
	</form>




			</div>


			<div class="container">
				<div class="row justify-content-md-center">
					<div class="col col-lg-2"></div>
					<div class="col-md-auto"></div>
					<div class="col col-lg-2"></div>
				</div>
				<div class="row">
					<div class="col"></div>
					<div class="col-md-auto">
					
					<!-- BOTON AGREGAR SERVICIO -->
						<button <%= turno == null ? "disabled" : turno.isCANCEL() ? "disabled" : "" %> type="button" class="btn btn-success"
							data-toggle="modal" data-target="#addserv">
							Agregar servicio <span data-toggle="modal2" data-target="#modal2"
								class="fa  fa-plus" aria-hidden="true"></span>
								
						</button>
						
</div>
<div class="modal fade" id="addserv" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="">Servicios</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
     <table id ="servm" class="table table-hover">
  <thead class="thead-dark">
    <tr>
    <th scope="col">Id</th>
        <th scope="col">Servicio</th>
      <th scope="col">Precio</th>
   
      
    </tr>
  </thead>
  <tbody >
     <%
     if (Lista!=null){
    	 
     
       for(Liquidar l: Lista) {

 %>        
  <tr class ="itemprecio">

      <td   scope="row"><%=l.getID_SERVICIO() %> </td>

      <td   scope="row"><%=l.getNOMBRE() %> </td>
      <td class="VoySumar" ><%=l.getPRECIO() %> </td>
	
     <%}} %>
    </tr>
    </tbody>
    </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
    
      </div>
    </div>
  </div>
</div>

					
					</div>
					<br>
					<table class="table table-hover"  id ="TablaGrande">
						<thead class="thead-dark">
							<tr>
									<th scope="col">id</th>
								<th scope="col">Servicio</th>
								<th scope="col">Precio</th>

							</tr>
						</thead>
						<tbody id="carrito">
						
						
			
						</tbody>
					</table>
	
	</div>

	<div>

		<div class="col-md-3	">

			<a class="text-decoration-none" href="../sites/liquidar.jsp">
				<button class="btn btn-success">

					<div class=" text-center ">Volver</div>

				</button>
			</a>

		<button disabled="disabled" type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal" id="Totalizar">
 Totalizar
</button>

													
													

<!-- Modal total -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Totalizacion</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <br>
  <div class="form-group row">
													<label for="Precio_nuevo"
														class="col-sm-2 col-form-label col-form-label-sm">Total</label>
													<div class="col-sm-10">
													
													<input   name="Total" type="number" value="0"
															class="form-control form-control-sm " id="Total"
															placeholder="">		
</div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button id="TotalTotal"type="button" class="btn btn-primary">Aceptar</button>
      </div>
    </div>
  </div>
</div>
			
			

		</div>


	</div>



</body>
</html>
    <%mt.cerrarConexion(); %> 
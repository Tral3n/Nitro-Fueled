<%@ page import ="java.util.ArrayList ,model.* ,include.*" 

%>

<%

ModeloCliente c = new ModeloCliente();
//System.out.println(ms.GetServicio(1));
 ArrayList <Cliente> ListaClient = c.GetListaClient() ;
 c.cerrarConexion();

%>

<!DOCTYPE html>
<html lang="en">
<head>
 <jsp:include page="../templetes/head.jsp"></jsp:include>
  <jsp:include page="../templetes/topbar.jsp"></jsp:include>
  <script src = "../javascripts/cliente.js"> </script>
<title>Clientes</title>

</head>


<body>






<div class = "container">

<center><h3>Clientes</h3></center>
<div class = "row">
<table class="table mt-4" >
  <thead class="thead-dark">

    <tr>
    
 
      <th scope="col">Codigo</th>
      <th scope="col">Cedula</th>
      <th scope="col">Nombres</th>
        <th scope="col">Apellidos</th>
          <th scope="col">Tipo-Auto</th>
           <th scope="col">Placa</th>
           <th scope="col">Acciones</th>
    </tr>
 
 
  </thead>
         
     
  <tbody>
       <%  
       for(Cliente s: ListaClient) {

 %>              
     
    <tr>
     	
      <td><%= s.getID()  %></td>
      <td><%= s.getCC() %></td>
       <td><%= s.getNOMBRES() %></td>
        <td><%= s.getAPELLIDOS() %></td>
         <td><%= s.getTIPOAUTO() %></td>
          <td><%= s.getPLACA() %></td>
      <td>
      <!-- boton modal eliminar -->
     <button data-toggle="modal" data-target="#eliminar<%=s.getID()%>" id="Eliminar"
							 class="btn btn-danger fa  fa-times-circle"> 

							


						</button>
						<div class="modal fade" id="eliminar<%=s.getID() %>" tabindex="-1"
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
								
										<div class="modal-body">
											<!-- body del formulario -->

											<p>¿Esta seguro de eliminar el cliente :"<%= s.getNOMBRES()  %> "?	</p>
											
											
										</div>

      
										<div class="modal-footer">
											<form class="Eliminar">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">NO</button>
												
											<button  id="btnsi" type="submit" class="btn btn-primary Eliminar_c">SI</button>
											<input   style="visibility: hidden" name="ID" type="text" value="<%=s.getID()%>"
															class="form-control form-control-sm" id="ID"
															placeholder="">
												
											</form>	
										</div>
									
								</div>
							</div>
						</div>
						
							<!-- boton modal de editar -->
							<button type="button" class=" fa  fa-pencil-alt btn btn-primary" data-toggle="modal" data-target="#editar<%=s.getID()%>">
							
							</button> <!-- Modal -->
							<div class="modal fade" id="editar<%=s.getID()%>" tabindex="-1"
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
													<label for="Cedula_nueva">Cedula</label>
													
													
													<input   name="Cedula_nueva" type="number" value="<%=s.getCC()%>"
															class="form-control form-control-sm" id="Precio_nuevo"
															placeholder="Cedula nueva">
															
															<label for="Nombres_nuevo">Nombres</label>
													
																		<input   name="Nombres_nuevo" type="text" value="<%=s.getNOMBRES()%>"
															class="form-control form-control-sm" id="Nombres_nuevo"
															placeholder="Nombres nuevo">
															
															<label for="Apellidos_nuevo">Apellidos</label>
													
															
															<input   name="Apellidos_nuevo" type="text" value="<%=s.getAPELLIDOS()%>"
															class="form-control form-control-sm" id="Apellidos_nuevo"
															placeholder="Apellidos nuevo">
															
															
														
														
															
													<label for="formGroupExampleInput2">Tipo de auto</label>
   <select  name="Tipo_auto_nuevo" class="form-control"  id="exampleFormControlSelect1">

      <option value = "1">Automovil</option>
      <option value = "2">Moto</option>
      <option value = "3">Campero</option>
      <option value = "4">Bus</option>
      
    
    </select>
															
															
															<label for="Placa_nueva">Placa</label>
															
															<input   name="Placa_nueva" type="text" value="<%=s.getPLACA()%>"
															class="form-control form-control-sm" id="Placa_nueva"
															placeholder="Placa nueva">
															
															
															
														<input   style="visibility: hidden" name="ID" type="text" value="<%=s.getID()%>"
															class="form-control form-control-sm" id="ID"
															placeholder="">
															
															
												
														
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
    
    </tr>
    
           	 <%  	
}	
 %> 
  </tbody>
 
</table>


	</div>
 <div class="col-md-2">

				<a class="text-decoration-none" href="../sites/menu.jsp">
					<button class="btn btn-success">
						
						<div class=" text-center ">
							Volver
							
							
						</div>
						
						</button>
						</a>
									<!-- boton modal de crear -->
 <button id="Crear" type="button" class=" btn btn-success" data-toggle="modal" data-target="#aqui">
							Crear
							</button> <!-- Modal -->
							<div class="modal fade" id="aqui" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Crear cliente nuevo</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<form class="Crear" id="Crear">
										<div class="modal-body">
												<!-- body del formulario -->

												<div class="form-group row">
													<label for="Cedula">Cedula</label>
													
													
													<input   name="Cedula" type="number" value=""
															class="form-control form-control-sm" id="Cedula"
															placeholder="Cedula" required>
															
															<label for="Nombres_nuevo">Nombres</label>
													
																		<input   name="Nombres" type="text" value=""
															class="form-control form-control-sm" id="Nombres"
															placeholder="Nombres" required>
															
															<label for="Apellidos">Apellidos</label>
													
															
															<input   name="Apellidos" type="text" value=""
															class="form-control form-control-sm" id="Apellidos"
															placeholder="Apellidos">
															
															
														
														
															
													<label for="formGroupExampleInput2">Tipo de auto</label>
   <select  name="Tipo_auto" class="form-control"  id="exampleFormControlSelect1">

      <option value = "1">Automovil</option>
      <option value = "2">Moto</option>
      <option value = "3">Campero</option>
      <option value = "4">Bus</option>
      
    
    </select>
															
															
															<label for="Placa">Placa</label>
															
															<input   name="Placa" type="text" value=""
															class="form-control form-control-sm" id="Placa"
															placeholder="Placa">
															
															
															
														<input   style="visibility: hidden" name="ID" type="text" value=""
															class="form-control form-control-sm" id="ID"
															placeholder="">
															
															
												
														
													</div>
												</div>

											
																						
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Cancelar</button>
												<button  id="Cliente_m"  type="submit" class="btn btn-primary Cliente_m">Crear</button>
											</div>
									</form>
											
											</div>
									
									</div>
									</div> 
								</div>


        
	
</div>

</body>
</html>                                		                            
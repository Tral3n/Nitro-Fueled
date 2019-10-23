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
<title>Clientes</title>

</head>


<body>


`



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
         <td><%= s.getID_TIPOAUTO() %></td>
          <td><%= s.getPLACA() %></td>
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
   <select class="form-control" selectedIndex="<%=s.getID_TIPOAUTO()%>" id="exampleFormControlSelect1">
      <option>1</option>
      <option>2</option>
      <option>3</option>
      <option>4</option>
    
    </select>
															
															
															<label for="Placa_nueva">Placa</label>
															
															<input   name="Placa_nueva" type="text" value="<%=s.getPLACA()%>"
															class="form-control form-control-sm" id="Placa_nueva"
															placeholder="Placa nueva">
															
															
															
														<input   style="visibility: hidden" name="ID_Cliente" type="text" value="<%=s.getID()%>"
															class="form-control form-control-sm" id="ID_Cliente"
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
 <jsp:include page="../templetes/btnVolver.jsp"></jsp:include>
</div> 

        
	


</body>
</html>                                		                            
<%@ page import ="java.util.ArrayList ,model.* ,include.*" 

%>

<%

ModeloServicio ms = new ModeloServicio();
//System.out.println(ms.GetServicio(1));
 ArrayList <Servicio> ListaServ = ms.GetListaServ() ;
 ms.cerrarConexion();	

%>

<!DOCTYPE html>
<html lang="en">
<head>
 <jsp:include page="../templetes/head.jsp"></jsp:include>
  <jsp:include page="../templetes/topbar.jsp"></jsp:include>
  <script src = "../javascripts/servicio.js"></script>
<title>Servicios</title>

</head>


<body>


<br>

<center><h3>Servicios</h3></center>

<div class = "container">



<div class = "row justify-content-center -w100">
<div class = "col-md-12">
<table class="table">
 <thead class="thead-dark">

    <tr>
    
 
      <th scope="col">Codigo</th>
      <th scope="col">Servicio</th>
      <th scope="col"></th>
      <th scope="col">Ver</th>
    </tr>
 
 
  </thead>
         
     
  <tbody>
       <%  
for(Servicio s: ListaServ) {

 %>              
     
    <tr>
     	
      <td><%= s.getID()  %></td>
      <td><%= s.getNOMBRE()  %></td>
      <td>
						<button data-toggle="modal" data-target="#modal<%=s.getID() %>" id="Eliminar"
							 class="btn btn-danger fa  fa-times-circle"> 

							


						</button>
						<div class="modal fade" id="modal<%=s.getID() %>" tabindex="-1"
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

											<p>¿Esta seguro de eliminar el servicio "<%= s.getNOMBRE() %>"?	</p>
											
											
										</div>

      
										<div class="modal-footer">
											<form class="Eliminar">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">NO</button>
												
											<button  id="btnsi" type="submit" class="btn btn-primary Eliminar_s">SI</button>
											<input   style="visibility: hidden" name="ID_Servicio" type="text" value="<%=s.getID()%>"
															class="form-control form-control-sm" id="ID_Servicio"
															placeholder="">
												
											</form>	
										</div>
									
								</div>
							</div>
						</div>
						
						
								 
						</td>
						
						
         <td> <a href="../templetes/detalleservicio.jsp?id=<%=s.getID()  %>" class="h6"> <span class="fa  fa-eye" aria-hidden="true"></span> </a> </td>
    
    </tr>
    
           	 <%  	
}	
 %> 
  </tbody>
 
</table>


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
						
						<button type="button" class=" btn btn-success" data-toggle="modal" data-target="#modal">
							Crear
							</button> <!-- Modal -->
							<div class="modal fade" id="modal" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Crear servicio nuevo</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<form class="Editar">
										<div class="modal-body">
												<!-- body del formulario -->

												<div class="form-group row">
													<label for="Servicio">Servicio Nuevo</label>
													
													
													<input   name="Servicio" type="text" value=""
															class="form-control form-control-sm" id="Servicio"
															placeholder="Nombre del servicio nuevo">
															
															
											</div>
																						
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Cancelar</button>
												<button   type="submit" class="btn btn-primary Crear">Crear</button>
											</div>
									</form>
											
											</div>
									</div>
									</div>
								</div>
					
						
						
						
</div>
</div> 

        
	


</body>
</html>                                		                            
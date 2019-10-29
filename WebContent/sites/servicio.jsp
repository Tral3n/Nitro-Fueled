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
						<button data-toggle="modal" data-target="#modal" id="Guardar"
							 class="btn btn-danger fa  fa-times-circle"> 

							


						</button>
						<div class="modal fade" id="modal" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Confirmaci�n</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<form class="Editar">
										<div class="modal-body">
											<!-- body del formulario -->

											<p>�Esta seguro de eliminar el servicio?	</p>

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
						
						
					
						
						
						
</div>
</div> 

        
	


</body>
</html>                                		                            
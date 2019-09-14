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
<title>Servicios</title>

</head>


<body>


<jsp:include page="../templetes/topbar.jsp"></jsp:include>



<div class = "container">


<div class = "row">
<table class="table">
  <thead class="bg-danger">

    <tr>
    
      <th scope="col">#</th>
      <th scope="col">First</th>
      <th scope="col">Last</th>
      <th scope="col">Handle</th>
    </tr>
 
 
  </thead>
         
     
  <tbody>
       <%  
for(Servicio s: ListaServ) {

 %>              
     
    <tr>
      <th scope="row">1</th>
      <td><%= s.getID()  %></td>
      <td><%= s.getNOMBRE()  %></td>
    
    </tr>
    
           	 <%  	
}
 %> 
  </tbody>
 
</table>


	</div>
<div class="col-md-2	">

				<a class="text-decoration-none" href="../sites/menu.jsp">
					<button class="btn btn-success">
						<div class=" p-1  ">
							
						</div>
						<div class=" text-center mt-1">
							Volver
							
							
						</div>
						
						
</div>
</div> 

        
	


</body>
</html>                                		                            
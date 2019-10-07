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
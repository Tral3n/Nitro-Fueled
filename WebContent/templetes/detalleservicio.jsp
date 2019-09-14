<%@ page import ="java.util.ArrayList ,model.* ,include.*" 

%>

<%

ModeloServicio ms = new ModeloServicio();
//System.out.println(ms.GetServicio(1));

 int id = Integer.parseInt(request.getParameter("id"));
 ArrayList <Precio> ListaServ = ms.GetDetalServ(id) ;
 ms.cerrarConexion();

%>

<!DOCTYPE html>
<html lang="en">
<head>
 <jsp:include page="../templetes/head.jsp"></jsp:include>
<title> Detalle Servicios</title>

</head>


<body>


<jsp:include page="../templetes/topbar.jsp"></jsp:include>



<div class = "container">


<div class = "row">
<table class="table">
  <thead class="bg-danger">

    <tr>
    
 
      <th scope="col">Codigo</th>
      <th scope="col">Tipo de auto</th>
      <th scope="col">Precio</th>
    </tr>
 
 
  </thead>
         
     
  <tbody>
       <%  
       for(Precio s: ListaServ) {

    	   %>              
    	       
    	      <tr>
    	       	
    	        <td><%= s.getID()  %></td>
    	        <td><%= s.getTIPOAUTO()  %></td>
    	             <td><%= s.getPRECIO()  %></td>
    	           
    	      
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
						<div class=" p-1  ">
							
						</div>
						<div class=" text-center mt-1">
							Volver
							
							
						</div>
						
						
</div>
</div> 

        
	


</body>
</html>                                		                            
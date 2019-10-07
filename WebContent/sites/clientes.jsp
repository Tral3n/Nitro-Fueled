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
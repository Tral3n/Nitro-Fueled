<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.util.ArrayList ,model.* ,include.*" %>
<%
	ModeloLiquidar ml = new ModeloLiquidar();
	Factura factura = null;
	if(request.getParameter("id_factura") != null) {
		int id_factura = Integer.parseInt(request.getParameter("id_factura"));
		factura = ml.getFactura(id_factura);
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div  id="factura_imprimir">
<%
	if(factura != null) {
%>
	<h1>Id factura: <%= factura %></h1>
<%
	}
%>
</div>
<script type="text/javascript">
	
	window.print();
	//window.location = "http://localhost:8080/NitroFueled/sites/liquidarTurno.jsp";
</script>
</body>
</html>
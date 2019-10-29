
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModeloCliente;


@WebServlet(asyncSupported = true, urlPatterns = { "/ControladorCliente" })
public class ControladorCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
ModeloCliente mse = new ModeloCliente();

System.out.println(request.getParameter("Tipo_auto_nuevo"));
		int CCN =Integer.parseInt(request.getParameter("Cedula_nueva"));
		String NombresN =request.getParameter("Nombres_nuevo");
		String ApellidosN =request.getParameter("Apellidos_nuevo");
	int Tipo_autoN =Integer.parseInt(request.getParameter("Tipo_auto_nuevo"));
		String PlacaN =request.getParameter("Placa_nueva");
		int ID =Integer.parseInt(request.getParameter("ID"));
		
		
		
boolean loQueAmiMeEntra  = mse.updateCliente(  CCN, NombresN, ApellidosN, Tipo_autoN, PlacaN,ID )	;
		mse.cerrarConexion();
		
		response.getWriter().print(loQueAmiMeEntra);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
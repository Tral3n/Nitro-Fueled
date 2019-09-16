package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import include.User;
import model.ModeloServicio;

/**
 * Servlet implementation class ControladorServicio
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/ControladorServicio" })
public class ControladorServicio extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ModeloServicio mse = new ModeloServicio();
		
		int Precio_nuevo =Integer.parseInt(request.getParameter("Precio_nuevo"));
		int ID =Integer.parseInt(request.getParameter("ID_Precio"));
	
		

		
		boolean loQueAmiMeEntra  = mse.updatePrecioDetalleServ(ID , Precio_nuevo);
		
		mse.cerrarConexion();
		
		response.getWriter().print(loQueAmiMeEntra);
		
		
		
		
				
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}

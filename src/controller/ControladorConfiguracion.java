package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModeloConfiguracion;
import model.ModeloServicio;

/**
 * Servlet implementation class ControladorConfiguracion
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/ControladorConfiguracion" })
public class ControladorConfiguracion extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		ModeloConfiguracion msc = new ModeloConfiguracion();
		
		byte Cantidad =Byte.parseByte(request.getParameter("Cantidad"));
		byte Porcentaje =Byte.parseByte(request.getParameter("Porcentaje"));
		
		
		boolean LoQueAmiMeEntra = msc.updateConfig(Cantidad, Porcentaje);
		
		msc.cerrarConexion();
		
		response.getWriter().print(LoQueAmiMeEntra);
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

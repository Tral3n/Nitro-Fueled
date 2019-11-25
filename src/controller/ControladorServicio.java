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
 
	protected void doPut(HttpServletRequest  request, HttpServletResponse response) throws ServletException, IOException {
		
		ModeloServicio mse = new ModeloServicio();
		
		int Precio_nuevo =Integer.parseInt(request.getParameter("Precio_nuevo"));
		boolean Activo = Boolean.parseBoolean((request.getParameter("Activo"))) ;
		int ID =Integer.parseInt(request.getParameter("ID_Precio"));
	
		

		
		boolean loQueAmiMeEntra  = mse.updatePrecioDetalleServ(ID , Precio_nuevo , Activo);
		
		mse.cerrarConexion();
		
		response.getWriter().print(loQueAmiMeEntra);
		
		
	
				
			
		
	}
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)throws ServletException,   IOException
            {
		
		System.out.println(request.getParameter("ID_Servicio"));
		ModeloServicio mse = new ModeloServicio();
		int ID =Integer.parseInt(request.getParameter("ID_Servicio"));
		
		boolean loQueAmiMeEntra =mse.DeleteServ(ID)	;
				
       mse.cerrarConexion();
		
		response.getWriter().print(loQueAmiMeEntra);
            }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
			
		
		System.out.println(request.getParameter("Servicio"));
  ModeloServicio mse = new ModeloServicio();
		
		String Nombre =request.getParameter("Servicio");


		
		boolean loQueAmiMeEntra  = mse.InsertServicio(Nombre);
		
		mse.cerrarConexion();
		
		response.getWriter().print(loQueAmiMeEntra);
		
		
	
				
			
		
	}
		
		
	}



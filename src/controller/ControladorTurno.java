package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import include.Turno;
import model.ModeloServicio;
import model.ModeloTurno;

/**
 * Servlet implementation class ControladorTurno
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/ControladorTurno" })
public class ControladorTurno extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
      
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
		
		ModeloTurno mse = new ModeloTurno();
		
	      int CEDULA =Integer.parseInt(request.getParameter("Cedula"));
	      String NOMBRE =request.getParameter("Nombre");
	        String PLACA =request.getParameter("Placa");
	        int TipoAuto =Integer.parseInt(request.getParameter("Tipo_Auto"));
	        
	        String loQueAmiMeEntra  = mse.InsertTurno(new Turno(0, CEDULA,NOMBRE, PLACA, TipoAuto , null, false)) ;
	        int lastTurno = mse.UltimoTurno();
	        mse.generarPDFturn(lastTurno-1);
	        
			mse.cerrarConexion();
			
			response.getWriter().print(loQueAmiMeEntra);
	
		
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   
		doGet(request, response);
	}
	
	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModeloTurno mse = new ModeloTurno();
		
		int NROTURN = Integer.parseInt(request.getParameter("NROTURN"));
		
		System.out.println(request.getParameter("NROTURN"));
		System.out.println(request.getQueryString());
		boolean flag= mse.CancelarTurno(NROTURN);
		
		response.getWriter().print(flag);
		

	}

}

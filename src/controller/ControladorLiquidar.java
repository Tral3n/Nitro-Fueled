package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import include.Configuracion;
import include.Factura;
import model.ModeloCliente;
import model.ModeloConfiguracion;
import model.ModeloLiquidar;
import model.ModeloTurno;
import include.Detalle_fact;
/**
 * Servlet implementation class ControladorLiquidar
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/ControladorLiquidar" })
public class ControladorLiquidar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorLiquidar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     
		ModeloConfiguracion mc = new ModeloConfiguracion();
		
		Configuracion configuracion = mc.GetConfig();
		
		ModeloTurno mt = new ModeloTurno();
		ModeloLiquidar ml = new ModeloLiquidar();
		
		int CC =Integer.parseInt(request.getParameter("Cedula"));
		String NOMBRE =request.getParameter("Nombre");
		String TIPO_AUTO =request.getParameter("Tipoauto");
		String PLACA =request.getParameter("Placa");
		int NroTurn =Integer.parseInt(request.getParameter("NROTURN"));
		String [] ListaIds = request.getParameterValues("Servicio");
		ArrayList<Detalle_fact> listaDetalle = new ArrayList<Detalle_fact>();
		for (int i = 0; i < ListaIds.length; i++) {
			listaDetalle.add(ml.getPreciodetal(Integer.parseInt(ListaIds[i])));
		}
		
		float SUBTOTAL = 0;
		float DESCUENTO = 0;
		float TOTALFACTURA = 0;
		
		for (Detalle_fact detalle_fact : listaDetalle) {
			SUBTOTAL += detalle_fact.getPRECIO();
		}
		System.out.println(configuracion.getCANTIDAD());
		System.out.println(ListaIds.length);
		if(ListaIds.length >= configuracion.getCANTIDAD()) {
			System.out.println(  configuracion.getPORCENTAJE() /100);
			DESCUENTO =( (float) configuracion.getPORCENTAJE() /100 )*SUBTOTAL;			
		}
		
		TOTALFACTURA = SUBTOTAL - DESCUENTO;
		
		Factura fac = new Factura(0,CC,NOMBRE,TIPO_AUTO,PLACA,SUBTOTAL,DESCUENTO,TOTALFACTURA,null,listaDetalle);
		
		boolean flag = ml.InsertarFactura(fac);
		mt.CancelarTurno(NroTurn);
		
		ml.cerrarConexion();
		mc.cerrarConexion();
		mt.cerrarConexion();
		
		System.out.println(fac);
		
		response.getWriter().print(flag);
	}

}

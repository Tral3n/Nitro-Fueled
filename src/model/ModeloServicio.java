package model;

import include.Servicio;
import java.sql.*;
import java.util.ArrayList;
public class ModeloServicio  extends Conexion {
 
	
	public ArrayList <Servicio> GetListaServ (){
		 ArrayList <Servicio> ListaServ = new ArrayList <>() ;
		 PreparedStatement objSta = null;
	        ResultSet tabla = null;
	        
	        try {
				String SQL = "SELECT * FROM servicio ";
				objSta = getConnection().prepareStatement(SQL);
				
				
						
				tabla = objSta.executeQuery();
				
				while (tabla.next()) {
					int ID = tabla.getInt("ID");
					String NOMBRE = tabla.getString("NOMBRE");
				ListaServ.add( new Servicio (ID,NOMBRE));
				}
				
				objSta.close();
			} catch (Exception e) {
	e.printStackTrace();
	System.out.println(e.getMessage());
			}
		 return ListaServ;
		 
	}
	
	public Servicio GetServicio ( int ID) {
		Servicio servicio = null;
		PreparedStatement objSta = null;
        ResultSet tabla = null;
        
        try {
			String SQL = "SELECT * FROM servicio WHERE ID = ? ";
			objSta = getConnection().prepareStatement(SQL);
			objSta.setInt(1, ID);
			
					
			tabla = objSta.executeQuery();
			
			while (tabla.next()) {
			
				String NOMBRE = tabla.getString("NOMBRE");
				servicio = new Servicio(ID,NOMBRE);
			}
			
			objSta.close();
		} catch (Exception e) {
e.printStackTrace();
System.out.println(e.getMessage());
		}
		return servicio;
		
	}
	public static void main(String[] args ) {
	ModeloServicio ms = new ModeloServicio();
//		System.out.println(ms.GetServicio(1));
		 ArrayList <Servicio> ListaServ = ms.GetListaServ() ;
		 
		 for (Servicio servicio : ListaServ) {
			System.out.println(servicio);
		}
	}
}

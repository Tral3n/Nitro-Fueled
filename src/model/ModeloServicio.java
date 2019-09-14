package model;

import include.Precio;
import include.Servicio;
import include.User;

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
	
	public ArrayList <Precio> GetDetalServ (int ID) {
		
		 ArrayList <Precio> ListaServ = new ArrayList <>() ;
		 PreparedStatement objSta = null;
	        ResultSet tabla = null;
	        
	        try {
				String SQL = "SELECT pre.ID , tipo.TIPOAUTO , pre.PRECIO\r\n" + 
						"FROM precio as pre\r\n" + 
						"INNER JOIN servicio as serv\r\n" + 
						"ON pre.ID_SERVICIO = serv.ID\r\n" + 
						"INNER JOIN tipoauto as tipo\r\n" + 
						"ON pre.ID_TIPOAUTO = tipo.ID\r\n" + 
						"\r\n" + 
						"WHERE pre.ID_SERVICIO = ?";
				objSta = getConnection().prepareStatement(SQL);
				objSta.setInt(1, ID);
				
						
				tabla = objSta.executeQuery();
				
				while (tabla.next()) {
					int IDd = tabla.getInt("ID");
					int PRECIO = tabla.getInt("PRECIO");
					String TIPOAUTO = tabla.getString("TIPOAUTO");
				ListaServ.add( new Precio (IDd,PRECIO,TIPOAUTO));
				}
				
				objSta.close();
			} catch (Exception e) {
	e.printStackTrace();
	System.out.println(e.getMessage());
			}
		 return ListaServ;
	}
	
	
	public static void main(String[] args ) {
	ModeloServicio ms = new ModeloServicio();
//		System.out.println(ms.GetServicio(1));
		 ArrayList <Precio> ListaServ = ms.GetDetalServ(1) ;

		
		 for (Precio precio : ListaServ) {
			System.out.println(precio);
			
				
			}
		}
	}
	


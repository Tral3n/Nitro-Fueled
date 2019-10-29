package model;

import include.Precio;
import include.Servicio;


import java.sql.*;
import java.util.ArrayList;
public class ModeloServicio  extends Conexion {
 
	
	
	// El creacion de la lista
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
	
	
	//obtecion de los servicios (select)
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
	
	
	//obtecion de los detallesservicios (select)
	public ArrayList <Precio> GetDetalServ (int ID) {
		
		 ArrayList <Precio> ListaServ = new ArrayList <>() ;
		 PreparedStatement objSta = null;
	        ResultSet tabla = null;
	        
	        try {
				String SQL = "SELECT pre.ID , tipo.TIPOAUTO , pre.PRECIO , pre.ACTIVO\r\n" + 
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
					boolean ACTIVO = tabla.getBoolean("ACTIVO");
				ListaServ.add( new Precio (IDd,PRECIO,TIPOAUTO,ACTIVO));
				}
				
				objSta.close();
			} catch (Exception e) {
	e.printStackTrace();
	System.out.println(e.getMessage());
			}
		 return ListaServ;
	}
	
	
	//Edicion de precios (update)
	 public boolean updatePrecioDetalleServ ( int ID ,int PrecioN , boolean Activo ) {

		    boolean flag = false;

		    PreparedStatement objSta = null;
		

		    try {

		        String sql = "UPDATE precio SET PRECIO= ? ,  ACTIVO= ? WHERE ID = ?  ";
		        objSta = getConnection().prepareStatement(sql);
		       
		        objSta.setInt(1, PrecioN);
		        objSta.setBoolean(2, Activo);
		        objSta.setInt(3, ID);
		



		 

      flag = objSta.executeUpdate()==1;

		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        try {
		            if (objSta != null) {
		                objSta.close();
		            }
		        } catch (Exception e) {
		             e.printStackTrace();
		        }
		    }

		    return flag;
		    }
	 
	//Eliminar servicios (update)
		 public boolean DeleteServ ( int ID ) {

			    boolean flag = false;

			    PreparedStatement objSta = null;
			

			    try {

			        String sql = "\n" + 
			        		"DELETE FROM `precio` WHERE precio.ID_SERVICIO = ?  ;\n" + 
			        		"\n" + 
			        		"DELETE FROM `servicio` WHERE servicio.ID = ?   ; ";
			        objSta = getConnection().prepareStatement(sql);
			       
			        objSta.setInt(1, ID);
			



			 

	      flag = objSta.executeUpdate()==1;

			    } catch (Exception e) {
			        e.printStackTrace();
			    } finally {
			        try {
			            if (objSta != null) {
			                objSta.close();
			            }
			        } catch (Exception e) {
			             e.printStackTrace();
			        }
			    }

			    return flag;
			    }
	 
	
	public static void main(String[] args ) {
	ModeloServicio ms = new ModeloServicio();
	
	System.out.println(ms.DeleteServ(3));
//		System.out.println(ms.GetServicio(1));

	


		
		
	

	
	}
}


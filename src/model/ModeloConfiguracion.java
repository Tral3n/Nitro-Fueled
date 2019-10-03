package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import include.Configuracion;


public class ModeloConfiguracion  extends Conexion {

	//obtecion de la configuracion (select)
		public Configuracion GetConfig ( ) {
			Configuracion configuracion = null;
			PreparedStatement objSta = null;
	        ResultSet tabla = null;
	        
	        try {
				String SQL = "SELECT * FROM configuracion  ";
				objSta = getConnection().prepareStatement(SQL);
			
				
						
				tabla = objSta.executeQuery();
				
				while (tabla.next()) {
				
					byte ID = tabla.getByte("ID");
					byte CANTIDAD = tabla.getByte("CANTIDAD");
				    byte PORCENTAJE = tabla.getByte("PORCENTAJE")	;	
					
					configuracion = new Configuracion (ID,CANTIDAD,PORCENTAJE);
				}
				
				objSta.close();
			} catch (Exception e) {
	e.printStackTrace();
	System.out.println(e.getMessage());
			}
			return configuracion;
			
		}
		
		//modificar los parametros
		
		 public boolean updateConfig ( byte CANTIDAD, byte PORCENTAJE ) {

			    boolean flag = false;

			    PreparedStatement objSta = null;
			

			    try {

			        String sql = "UPDATE configuracion SET CANTIDAD= ?, PORCENTAJE = ? WHERE ID  = 1  ";
			        objSta = getConnection().prepareStatement(sql);
			       
			        objSta.setByte(1, CANTIDAD);
			        objSta.setByte(2, PORCENTAJE);
			       
			



			 

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

		 public static void main(String[] args) {
			 ModeloConfiguracion mc = new ModeloConfiguracion();
			 
			 mc.updateConfig((byte)8, (byte)9);
			 
			 
		}
		 
		 
}




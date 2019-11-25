package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Calendar;

import javax.xml.ws.soap.MTOM;

import include.Cliente;
import include.Configuracion;
import include.Turno;

public class ModeloTurno extends Conexion {

	
	//Insertar Turnos (inserta cliente si no existe)
	 public boolean InsertTurno( Turno turno ) {

		    boolean flag = false;

		    PreparedStatement objSta = null;
		

		    try {

		        String sql = "INSERT turno SET CEDULA= ?,PLACA=? , ID_TIPOAUTO=? ,HORA_EN=NOW() ";
		        objSta = getConnection().prepareStatement(sql);
		       
		        objSta.setInt(1,turno.getCEDULA());
		        objSta.setString(2,turno.getPLACA());
		        objSta.setInt(3,turno.getID_TIPOAUTO());
		        
		        
		       // Object Param = new Timestamp (turno.getHORA_EN().getTime().getTime());
		       
		         //objSta.setObject(4, Param);
		         
		       



		 

     flag = objSta.executeUpdate()==1;

ModeloCliente ms = new ModeloCliente ();  

if (ms.VerificarExistCliente(turno.getPLACA())) {
	return false;
	
}else {
	ms.InsertCliente(turno.getCEDULA(), "", "", turno.getID_TIPOAUTO(), turno.getPLACA());
}

;     
     
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
	 
	//obtener el ultimo turno 
	 
	 public int UltimoTurno () {

		    int flag = 0 ;
		     ResultSet tabla = null;
		    PreparedStatement objSta = null;
		    try {

		        String sql = "SELECT (NROTURN) FROM turno ORDER BY NROTURN DESC LIMIT 1";
		        objSta = getConnection().prepareStatement(sql);
		        
		 
		        tabla =objSta.executeQuery();
		        
		        
		        while (tabla.next()) {
			
					 flag = tabla.getInt("NROTURN");
					
					
				
				}
	 

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

	    return flag +1;
	    }
	 
	//Select de turnos activos
			public Turno GetTurnoActivo (int Nr) {
				Turno turno = null;
				PreparedStatement objSta = null;
		        ResultSet tabla = null;
		        
		        try {
					String SQL = "SELECT * FROM turno WHERE NROTURN= ? ";
					objSta = getConnection().prepareStatement(SQL);
				
					Calendar calendar = Calendar.getInstance();
					  objSta.setInt(1,Nr);
							
					tabla = objSta.executeQuery();
					
					while (tabla.next()) {
					
							int NROTURN = tabla.getInt("NROTURN");
							int CEDULA = tabla.getInt("CEDULA");
							String PLACA = tabla.getString("PLACA");
							int ID_TIPOAUTO = tabla.getInt("ID_TIPOAUTO");
							boolean CANCEL = tabla.getBoolean("CANCEL");
							 calendar.setTimeInMillis(tabla.getTimestamp("HORA_EN").getTime());
				
					
						turno = new Turno(NROTURN, CEDULA, PLACA, ID_TIPOAUTO,calendar,CANCEL);
						
					
					}
					
					objSta.close();
				} catch (Exception e) {
		e.printStackTrace();
		System.out.println(e.getMessage());
				}
				return turno;
				
			}
			
		public String TipoAutoname (int tipo) {
		
			if (tipo == 1) {
				
			  return  "Automovil";
			}else if (tipo == 2){
				
				  return  "Moto";
				
			}else if (tipo == 3){
				
				  return  "Campero";
				
			}else if (tipo == 4){
				
				  return  "Bus";
				
			}
			
			
			
			
			return  "";
		}
			
			
			
			
	 
	 public static void main(String[] args) {
			ModeloTurno mt = new ModeloTurno();
	//		Turno turno = new Turno( 3, 452452, "te45g", 3,Calendar.getInstance(), false);
//System.out.println(mt.InsertTurno(turno));
			
			//System.out.println(mt.UltimoTurno());

			
		}
}


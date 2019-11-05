package model;

import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.util.Calendar;

import include.Turno;

public class ModeloTurno extends Conexion {

	
	//Insertar Turnos
	 public boolean InsertTurno( Turno turno ) {

		    boolean flag = false;

		    PreparedStatement objSta = null;
		

		    try {

		        String sql = "INSERT turno SET CEDULA= ?,PLACA=? , ID_TIPOAUTO=? ,HORA_EN=? ";
		        objSta = getConnection().prepareStatement(sql);
		       
		        objSta.setInt(1,turno.getCEDULA());
		        objSta.setString(2,turno.getPLACA());
		        objSta.setInt(3,turno.getID_TIPOAUTO());
		        
		        
		        Object Param = new Timestamp (turno.getHORA_EN().getTime().getTime());
		       
		         objSta.setObject(4, Param);
		         
		       



		 

     flag = objSta.executeUpdate()==1;

ModeloCliente ms = new ModeloCliente ();   
ms.InsertCliente(turno.getCEDULA(), "", "", turno.getID_TIPOAUTO(), turno.getPLACA())
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
	 
	 public static void main(String[] args) {
			ModeloTurno mt = new ModeloTurno();
			Turno turno = new Turno( 2, 5675, "odr231", 3,Calendar.getInstance(), false);
System.out.println(mt.InsertTurno(turno));
		}
}


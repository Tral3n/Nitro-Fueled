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

		    boolean flag = false;

		    PreparedStatement objSta = null;
		    try {

		        String sql = "SELECT `AUTO_INCREMENT`\n" + 
		        		"FROM  nitrofueled.turno\n" + 
		        		"WHERE TABLE_SCHEMA = 'DatabaseName'\n" + 
		        		"AND   TABLE_NAME   = 'TableName';";
		        objSta = getConnection().prepareStatement(sql);
		 
	 }
	 
	 public static void main(String[] args) {
			ModeloTurno mt = new ModeloTurno();
	//		Turno turno = new Turno( 3, 452452, "te45g", 3,Calendar.getInstance(), false);
//System.out.println(mt.InsertTurno(turno));
		}
}


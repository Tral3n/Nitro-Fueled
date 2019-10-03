package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import include.Cliente;


public class ModeloCliente extends Conexion{

	// El creacion de la lista
		public ArrayList <Cliente> GetListaClient (){
			 ArrayList <Cliente> ListaClient = new ArrayList <>() ;
			 PreparedStatement objSta = null;
		        ResultSet tabla = null;
		        
		        try {
					String SQL = "SELECT * FROM cliente" ;
					objSta = getConnection().prepareStatement(SQL);
					
					
							
					tabla = objSta.executeQuery();
					
					while (tabla.next()) {
						int ID = tabla.getInt("ID");
						int CC = tabla.getInt("CC");
						String NOMBRES = tabla.getString("NOMBRES");
						String APELLIDOS = tabla.getString("APELLIDOS");
						int ID_TIPOAUTO = tabla.getInt("ID_TIPOAUTO");
						String PLACA = tabla.getString("PLACA");
						
						
					ListaClient.add( new Cliente(ID, CC, NOMBRES, APELLIDOS, ID_TIPOAUTO, PLACA) );
					}
					
					objSta.close();
				} catch (Exception e) {
		e.printStackTrace();
		System.out.println(e.getMessage());
				}
			 return ListaClient;
			 
		}
		
		
		
		
	
}

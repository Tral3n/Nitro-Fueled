package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import include.Cliente;
import include.Liquidar;

public class ModeloLiquidar  extends Conexion{
	
	// modelo agregar servicip
			public ArrayList <Liquidar> GetListaServLiq (int ID_TIPOAUTO){
				 ArrayList <Liquidar> ListaSevrLiq = new ArrayList <>() ;
				 PreparedStatement objSta = null;
			        ResultSet tabla = null;
			        
			        try {
						String SQL = "SELECT serv.NOMBRE , pre.PRECIO \r\n" + 
								"FROM precio pre\r\n" + 
								"INNER JOIN servicio serv\r\n" + 
								"ON PRE.ID_SERVICIO = serv.ID\r\n" + 
								"WHERE ID_TIPOAUTO= ?\r\n" + 
								"and pre.ACTIVO = 1" ;
						objSta = getConnection().prepareStatement(SQL);
						 objSta.setInt(1,ID_TIPOAUTO);
						
								
						tabla = objSta.executeQuery();
						
						while (tabla.next()) {
							
						
							String NOMBRE = tabla.getString("NOMBRE");
							int PRECIO = tabla.getInt("PRECIO");
							
							
							
							
							ListaSevrLiq.add( new Liquidar( NOMBRE, PRECIO) );
						}
						
						objSta.close();
					} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
					}
				 return ListaSevrLiq;
				 
			}
	
			 public static void main(String[] args) {
					ModeloLiquidar ml = new ModeloLiquidar();
					
					System.out.println(ml.GetListaServLiq(3));
			 }
}

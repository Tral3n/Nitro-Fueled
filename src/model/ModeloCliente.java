package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;

import include.Cliente;
import include.Turno;


public class ModeloCliente extends Conexion{

	// El creacion de la lista
		public ArrayList <Cliente> GetListaClient (){
			 ArrayList <Cliente> ListaClient = new ArrayList <>() ;
			 PreparedStatement objSta = null;
		        ResultSet tabla = null;
		        
		        try {
					String SQL = "SELECT cli.ID, cli.CC , cli.NOMBRES , cli.APELLIDOS , cli.ID_TIPOAUTO , tipo.TIPOAUTO , cli.PLACA\n" + 
							"FROM cliente as cli\n" + 
							"inner join tipoauto as tipo on cli.ID_TIPOAUTO = tipo.ID" ;
					objSta = getConnection().prepareStatement(SQL);
					
					
							
					tabla = objSta.executeQuery();
					
					while (tabla.next()) {
						int ID = tabla.getInt("ID");
						int CC = tabla.getInt("CC");
						String NOMBRES = tabla.getString("NOMBRES");
						String APELLIDOS = tabla.getString("APELLIDOS");
						int ID_TIPOAUTO = tabla.getInt("ID_TIPOAUTO");
						String TIPOAUTO = tabla.getString ("TIPOAUTO");
						String PLACA = tabla.getString("PLACA");
						
						
						ListaClient.add( new Cliente(ID, CC, NOMBRES, APELLIDOS, ID_TIPOAUTO,TIPOAUTO, PLACA) );
					}
					
					objSta.close();
				} catch (Exception e) {
		e.printStackTrace();
		System.out.println(e.getMessage());
				}
			 return ListaClient;
			 
		}
		
		
		//Edicion de clientes (update)
		 public boolean updateCliente ( int CCN, String NombresN , String ApellidosN,int Tipo_autoN, String PlacaN, int ID  ) {

			    boolean flag = false;

			    PreparedStatement objSta = null;
			

			    try {

			        String sql = "UPDATE cliente SET CC= ? ,NOMBRES= ?,APELLIDOS=? , ID_TIPOAUTO=? ,PLACA=? WHERE ID = ?  ";
			        objSta = getConnection().prepareStatement(sql);
			       
			        objSta.setInt(1, CCN);
			        objSta.setString(2,NombresN);
			        objSta.setString(3,ApellidosN);
			        objSta.setInt(4,Tipo_autoN);
			        objSta.setString(5,PlacaN);
			        objSta.setInt(6, ID);
			



			 

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
		
		
		//INSERT de clientes (INSERT)
		 public boolean InsertCliente ( int CCN, String NombresN , String ApellidosN,int Tipo_autoN, String PlacaN  ) {

			    boolean flag = false;

			    PreparedStatement objSta = null;
			

			    try {

			        String sql = "INSERT cliente SET CC= ? ,NOMBRES= ?,APELLIDOS=? , ID_TIPOAUTO=? ,PLACA=?  ";
			        objSta = getConnection().prepareStatement(sql);
			       
		
					
			        objSta.setInt(1, CCN);
			        objSta.setString(2,NombresN);
			        objSta.setString(3,ApellidosN);
			        objSta.setInt(4,Tipo_autoN);
			        objSta.setString(5,PlacaN);
			 



			 

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
				ModeloCliente mc = new ModeloCliente();
boolean comoquiera				  = mc.InsertCliente(1, "jojo", "bizarre", 3, "joj413");
System.out.println(comoquiera);
			}
	
}

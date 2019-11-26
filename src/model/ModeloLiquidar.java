package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import include.Cliente;
import include.Configuracion;
import include.Detalle_fact;
import include.Factura;
import include.Liquidar;
import include.Servicio;

public class ModeloLiquidar  extends Conexion{
	
	// modelo agregar servicip
			public ArrayList <Liquidar> GetListaServLiq (int ID_TIPOAUTO){
				 ArrayList <Liquidar> ListaSevrLiq = new ArrayList <>() ;
				 PreparedStatement objSta = null;
			        ResultSet tabla = null;
			        
			        try {
						String SQL = "SELECT pre.ID, serv.NOMBRE , pre.PRECIO \r\n" + 
								"FROM precio pre\r\n" + 
								"INNER JOIN servicio serv\r\n" + 
								"ON PRE.ID_SERVICIO = serv.ID\r\n" + 
								"WHERE ID_TIPOAUTO= ?\r\n" + 
								"and pre.ACTIVO = 1" ;
						objSta = getConnection().prepareStatement(SQL);
						 objSta.setInt(1,ID_TIPOAUTO);
						
								
						tabla = objSta.executeQuery();
						
						while (tabla.next()) {
							
							int ID_SERVICIO = tabla.getInt("ID");
							String NOMBRE = tabla.getString("NOMBRE");
							int PRECIO = tabla.getInt("PRECIO");
							
							
							
							
							ListaSevrLiq.add( new Liquidar( ID_SERVICIO,NOMBRE, PRECIO) );
						}
						
						objSta.close();
					} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
					}
				 return ListaSevrLiq;
				 
			}
			
			
			 public Detalle_fact getPreciodetal (int ID) {
				 
				Detalle_fact Detalle_fact  = null;
				 
			 
				PreparedStatement objSta = null;
				ResultSet tabla = null;

				try {
					String SQL = "SELECT serv.ID ,serv.NOMBRE,  pre.PRECIO\r\n" + 
							"FROM SERVICIO as serv\r\n" + 
							"INNER JOIN precio as pre\r\n" + 
							"ON serv.ID = pre.ID_SERVICIO\r\n" + 
							"where  pre.ID = ? ";
					objSta = getConnection().prepareStatement(SQL);
					objSta.setInt(1, ID);

					tabla = objSta.executeQuery();

					while (tabla.next()) {

						String NOMBRE = tabla.getString("NOMBRE");
						int PRECIO = tabla.getInt("PRECIO");
						Detalle_fact = new Detalle_fact(0, NOMBRE, PRECIO);
					}

					objSta.close();
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println(e.getMessage());
				}
			
				 
				 return Detalle_fact;
			 }
			

				//Insertar factura
			
			public boolean InsertarFactura (Factura f) {
				
				boolean flag = false;

			    PreparedStatement objSta = null;
			
			   
			    
			    try {

			        String sql = "INSERT INTO `factura` (`ID_FACTURA`, `CC`, `NOMBRE`, `TIPOAUTO`, `PLACA`, `SUBTOTAL`, `DESCUENTO`, `TOTALFACTURA`, `FECHA`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, NOW());";
			        objSta = getConnection().prepareStatement(sql);
			       
			        objSta.setInt(1, f.getCC());
			        objSta.setString(2, f.getNOMBRE());
			        objSta.setString(3, f.getTIPO_AUTO());
			        objSta.setString(4, f.getPLACA());
			        objSta.setFloat(5, f.getSUBTOTAL());
			        objSta.setFloat(6, f.getDESCUENTO());
			        objSta.setFloat(7, f.getTOTAL_FACTURA());
			        flag = objSta.executeUpdate()==1;
			        int lastId = getLastId();
			        for (Detalle_fact detalle : f.getDetalleFact()) {
			        	sql = "INSERT INTO `detalle_fact`(`ID_FACTURA`, `SERVICIO`, `PRECIO`) VALUES (?,?,?)";
			        	objSta = getConnection().prepareStatement(sql);
			        	objSta.setInt(1, lastId);
			        	objSta.setString(2, detalle.getSERVICIO());
			        	objSta.setInt(3, detalle.getPRECIO());
			        	flag = objSta.executeUpdate()==1;
						
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

			    return flag;
				
				
				
			}	
			
	public int getLastId() {
		
		ResultSet table = null;
		PreparedStatement objSta = null;
		int lastId = -1;
		try {
			
			String sql = "SELECT (ID_FACTURA) FROM factura ORDER BY ID_FACTURA DESC LIMIT 1";
			objSta = getConnection().prepareStatement(sql);
			table = objSta.executeQuery();
			table.next();
			lastId = table.getInt("ID_FACTURA");
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return lastId;
	}
	
			 public static void main(String[] args) {
					ModeloLiquidar ml = new ModeloLiquidar();
					System.out.println(ml.getPreciodetal(7));
					System.out.println(ml.getLastId());
					
			 }
}

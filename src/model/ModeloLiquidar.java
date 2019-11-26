package model;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

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
			        	objSta.setFloat(3, detalle.getPRECIO());
			        	flag = objSta.executeUpdate()==1;
						
					}
			        
			        
			        generarPDF(lastId);


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
			
			//select dde factura para el pdf
public Factura getFactura (int id_factura) {
				
				boolean flag = false;

			    PreparedStatement objSta = null;
			    ResultSet tabla = null;
			   
			    Factura factura = null;
			    ArrayList<Detalle_fact> listaDetalles = new ArrayList<Detalle_fact>();
			    try {

			        String sql = "SELECT `ID_FACTURA`, `CC`, `NOMBRE`, `TIPOAUTO`, `PLACA`, `SUBTOTAL`, `DESCUENTO`, `TOTALFACTURA`, `FECHA` FROM `factura` WHERE ID_FACTURA= ?";
			        objSta = getConnection().prepareStatement(sql);
			        objSta.setInt(1, id_factura);
			       
			        tabla = objSta.executeQuery();
					Calendar FECHA = Calendar.getInstance();
			        while (tabla.next()) {
			        	
			        	int iD_FACTURA = tabla.getInt("ID_FACTURA");
			        	int cC = tabla.getInt("CC");
			        	String nOMBRE= tabla.getString("NOMBRE");
			        	String tIPO_AUTO = tabla.getString("TIPOAUTO");
			        	String pLACA = tabla.getString("PLACA");
			        	float sUBTOTAL = tabla.getFloat("SUBTOTAL");
			        	float dESCUENTO = tabla.getFloat("DESCUENTO");
			        	float tOTAL_FACTURA = tabla.getFloat("TOTALFACTURA");
			        	 FECHA.setTimeInMillis(tabla.getTimestamp("FECHA").getTime());
			        	
			        	  factura = new Factura(iD_FACTURA, cC, nOMBRE, tIPO_AUTO, pLACA, sUBTOTAL, dESCUENTO, tOTAL_FACTURA, FECHA, listaDetalles);
			        	  
					}
			        
			       sql = "SELECT `ID_FACTURA`, `SERVICIO`, `PRECIO` FROM `detalle_fact` WHERE ID_FACTURA= ? ";
					objSta = getConnection().prepareStatement(sql);
					objSta.setInt(1, id_factura);

					tabla = objSta.executeQuery();
			       
			       while(tabla.next()) {
			    	   
			    	   String sERVICIO = tabla.getString("SERVICIO");
			    	   float pRECIO = tabla.getFloat("PRECIO");
			    	   Detalle_fact detalle = new Detalle_fact(id_factura, sERVICIO, pRECIO);
			    	   listaDetalles.add(detalle);
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

			    return factura;
				
				
				
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
	
public void generarPDF (int id_factura) {
		
		Document document = new Document();
		
		try {
			PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("C:\\Users\\Tralen\\Documents\\Eclipse Proyects\\Factura"+id_factura+".pdf"));
			document.open();
			document.add(new Paragraph("Nitrofueled"));
			document.add(new Paragraph(getFactura(id_factura).toString()));
			document.close();
			writer.close();
;			
		}
		catch(DocumentException e) {
			e.printStackTrace();
		}
		catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	
	 public static void main(String[] args) {
			ModeloLiquidar ml = new ModeloLiquidar();
			ml.generarPDF(3);
			
	 }
}

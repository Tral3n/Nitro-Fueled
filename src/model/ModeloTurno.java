package model;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Calendar;

import javax.xml.ws.soap.MTOM;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import include.Cliente;
import include.Configuracion;
import include.Turno;

public class ModeloTurno extends Conexion {

	
	//Insertar Turnos (inserta cliente si no existe)
	 public String InsertTurno( Turno turno ) {

		    String resp = "";
		    boolean turnoC = false;
		    boolean clienteC  =false;
		    PreparedStatement objSta = null;
		

		    try {

		        String sql = "INSERT turno SET CEDULA= ?,NOMBRE=?,PLACA=? , ID_TIPOAUTO=? ,HORA_EN=NOW() ";
		        objSta = getConnection().prepareStatement(sql);
		       
		        objSta.setInt(1,turno.getCEDULA());
		        objSta.setString(2,turno.getNOMBRE());
		        objSta.setString(3,turno.getPLACA());
		        objSta.setInt(4,turno.getID_TIPOAUTO());
		        
		        
		       // Object Param = new Timestamp (turno.getHORA_EN().getTime().getTime());
		       
		         //objSta.setObject(4, Param);
		         
		       



		 

		        turnoC = objSta.executeUpdate()==1;

				ModeloCliente ms = new ModeloCliente ();  
				
				if (!ms.VerificarExistCliente(turno.getPLACA())) {
					clienteC=	ms.InsertCliente(turno.getCEDULA(), turno.getNOMBRE(), "", turno.getID_TIPOAUTO(), turno.getPLACA());	
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

		    return "{\"turno\": "+turnoC+", \"cliente\": "+ clienteC +"  }";
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
							String NOMBRE = tabla.getString("NOMBRE");
							String PLACA = tabla.getString("PLACA");
							int ID_TIPOAUTO = tabla.getInt("ID_TIPOAUTO");
							boolean CANCEL = tabla.getBoolean("CANCEL");
							 calendar.setTimeInMillis(tabla.getTimestamp("HORA_EN").getTime());
				
					
						turno = new Turno(NROTURN, CEDULA,NOMBRE, PLACA, ID_TIPOAUTO,calendar,CANCEL);
						
					
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
			
			// CANCELAR TURNO
		public boolean CancelarTurno(int NroTurno) {

			boolean flag = false;

			PreparedStatement objSta = null;

			try {

				String sql = "UPDATE turno SET CANCEL= 1 WHERE NROTURN = ?  ";
				objSta = getConnection().prepareStatement(sql);

				objSta.setInt(1, NroTurno);
				

				flag = objSta.executeUpdate() == 1;

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
		
		public void generarPDFturn (int NROTURN) {
			
			Document document = new Document();
			
			ModeloTurno mt = new ModeloTurno();
			Turno turno = mt.GetTurnoActivo(NROTURN);
			
			try {
				PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("C:\\Users\\Tralen\\Documents\\Eclipse Proyects\\Turno"+NROTURN+".pdf"));
				document.open();
				document.add(new Paragraph("Nitrofueled"));
//				document.add(new Paragraph(turno.toString()));
				document.add(new Paragraph("NUMERO DE TURNO :"+turno.getNROTURN()));
				document.add(new Paragraph("Cedula:"+turno.getCEDULA()));
				document.add(new Paragraph("Nombre:"+turno.getNOMBRE()));
				document.add(new Paragraph("Placa:"+turno.getPLACA()));
				document.add(new Paragraph("Id tipo auto:"+turno.getID_TIPOAUTO()));
				
			
				document.add(new Paragraph("Hora de entrada:"+turno.getHORA_EN().getTime().toString()));
				
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
			ModeloTurno mt = new ModeloTurno();
	
			
	//		Turno turno = new Turno( 3, 452452, "te45g", 3,Calendar.getInstance(), false);
//System.out.println(mt.InsertTurno(turno));
			
			//System.out.println(mt.UltimoTurno());
			
			mt.generarPDFturn(21);
			
			System.out.println(mt.UltimoTurno());
			
		}
}


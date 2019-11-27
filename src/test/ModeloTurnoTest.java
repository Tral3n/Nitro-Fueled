package test;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import include.Turno;
import model.ModeloCliente;
import model.ModeloTurno;

public class ModeloTurnoTest {
	ModeloTurno mse ;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		
		mse = new ModeloTurno();
	}

	@After
	public void tearDown() throws Exception {
		
		mse.cerrarConexion();
	}

	@Test
	public void inserarturnoConcliente() {
	
		String actual =mse.InsertTurno(new Turno(0,1000,"lolo","532dre",4,null,false));
		String expected = "{\"turno\": true, \"cliente\": true  }";
		assertEquals(expected, actual);
		
		
	}
	@Test
	public void inserarturnoSolo() {
	
		String actual =mse.InsertTurno(new Turno(0,1000,"lolo","234tyr",4,null,false));
		String expected = "{\"turno\": true, \"cliente\": false  }";
		assertEquals(expected, actual);
		
		
	}
	@Test
	public void ultimoturno() {
	
int actual =mse.UltimoTurno();
		
	assertEquals(48 , actual-1);
		
		
	}
	@Test
	public void GetTurnoexistente() {
	
		assertNotNull(mse.GetTurnoActivo(31));
		
	
		
		
	}
	@Test
	public void GetTurnoNoexistente() {
	
		assertNull(mse.GetTurnoActivo(10000));
		
	
		
		
	}
	@Test
	public void tipodeautos() {
	
		String actual1 = mse.TipoAutoname(1);
	    String actual2 = mse.TipoAutoname(2);
	    String actual3 = mse.TipoAutoname(3);
	    String actual4 = mse.TipoAutoname(4);
	    
	    assertEquals("Automovil", actual1);
	    assertEquals("Moto", actual2);
	    assertEquals("Campero", actual3);
	    assertEquals("Bus", actual4);
	
	}
	
	@Test
	public void Cancelarturno() {
			

			
			boolean actual  = mse.CancelarTurno(38);
					
			
			assertTrue(actual);
			
		}
	@Test
	public void CancelarturnoNoexistente() {
	
						
			boolean actual  = mse.CancelarTurno(10000);
					
			
			assertFalse(actual);
			
		}
	
	@Test
	public void Generarpdf() {
	
			try {
				mse.generarPDFturn(39);				
			} catch (Exception e) {
				assertEquals("Número turno no existe", e.getMessage());;				
			}
					
			
			
		}

}

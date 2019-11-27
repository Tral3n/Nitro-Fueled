package test;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import model.ModeloCliente;
import model.ModeloConfiguracion;

public class ModeloConfiguracionTest {
	ModeloConfiguracion mse ;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		
		mse = new ModeloConfiguracion();
	}

	@After
	public void tearDown() throws Exception {
		mse.cerrarConexion();
	}

	@Test
	public void Getconfig() {
	
		assertNotNull(mse.GetConfig()	);
		
		
	}

	@Test
	public void ModificarConfig() {
	//	fail("Not yet implemented"); 
		

		
		boolean actual  = mse. updateConfig(3, 2);
				
		
		assertTrue(actual);
		
	}
	
}

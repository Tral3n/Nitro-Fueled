package test;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import model.ModeloCliente;

public class ModeloClienteTest {
ModeloCliente mse ;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	
		
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
			mse=new ModeloCliente ();
	}

	@After
	public void tearDown() throws Exception {
		
		mse.cerrarConexion();
	}

	@Test
	public void modificarclienteexisnte() {
	//	fail("Not yet implemented"); 
		

		
		boolean actual  = mse.updateCliente(4, "4324", "dgdgd", 3, "fdsff3", 5);
		
		assertTrue(actual);
		
	}
	
	@Test
	public void modificarclientenoexistente() {
	//	fail("Not yet implemented"); 
		

		
		boolean actual  = mse.updateCliente(4, "4324", "dgdgd", 3, "fdsff3", 6);
		
		assertFalse(actual);
		
	}

}

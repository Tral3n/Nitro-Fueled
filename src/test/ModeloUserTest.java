package test;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import include.User;
import model.ModeloUser;

public class ModeloUserTest {

	ModeloUser mse;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		mse=new ModeloUser();
	}

	@After
	public void tearDown() throws Exception {
		mse.cerrarConexion();
	}

	@Test
	public void Validarcorrecto() {

		
		
		boolean actual= mse.validar(new User("admin", "123"));
		
		assertTrue(actual);
	}
	@Test
	public void Validarincorrecto() {

		
		
		boolean actual= mse.validar(new User("admi343n", "1212413"));
		
		assertFalse(actual);
	}

}

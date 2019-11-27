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
	public void inserarturno() {
	
		boolean actual =mse.InsertTurno(new Turno(0,1000,"lolo","234tyr",4,null,false));
		
		assertTrue(actual);
		
		
	}
	@Test
	public void ultimoturno() {
	
int actual =mse.UltimoTurno();
		
	assertEquals(26, actual);
		
		
	}

}

package test;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import include.Servicio;
import model.ModeloServicio;

public class ModeloServicioTest {
	ModeloServicio mse ;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		
		mse=new ModeloServicio();
	}

	@After
	public void tearDown() throws Exception {
		
		mse.cerrarConexion();
	}

	@Test
	public void Getlista() {
		assertNotNull(mse.GetListaServ()	);
	}
	@Test
	public void GetServicioExistente() {
	 
		Servicio actual= mse.GetServicio(1);
		assertNotNull(actual);
		
	}
	@Test
	public void GetServicioNoExistente() {
	 
		Servicio actual= mse.GetServicio(100);
		assertNull(actual);
		
	}
	
	@Test
	public void GetlistaDetalleExis() {
		assertNotNull(mse.GetDetalServ(1)	);
	}
	
	@Test
	public void GetlistaDetalleNOExis() {
		assertEquals(0, (mse.GetDetalServ(100).size()	));
	}
	@Test
	public void editarprecios() {
		boolean actual = mse.updatePrecioDetalleServ(1, 122, true);
		assertTrue(actual);
	}
	
	@Test
	public void editarpreciosnoexistente() {
		boolean actual = mse.updatePrecioDetalleServ(100, 122, true);
		assertFalse(actual);
	}
	@Test
	public void eliminarserv() {
		boolean actual = mse.DeleteServ(12);
		assertTrue(actual);
	}
	@Test
	public void eliminarservNoexistente() {
		boolean actual = mse.DeleteServ(1000);
		assertFalse(actual);
	}
	
	@Test
	public void Crearservicio() {
		boolean actual = mse.InsertServicio("pruebaunitaria");
		assertTrue(actual);
	}
}

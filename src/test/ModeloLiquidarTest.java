package test;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import include.Factura;
import model.ModeloLiquidar;
import model.ModeloTurno;

public class ModeloLiquidarTest {
	ModeloLiquidar mse;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		mse = new ModeloLiquidar();
	}

	@After
	public void tearDown() throws Exception {
		mse.cerrarConexion();
	}

	@Test
	public void buscarserviciosactivos() {

		assertNotEquals(0, mse.GetListaServLiq(1).size());
	}
	@Test
	public void buscarserviciosactivosNoexite() {

		assertEquals(0, mse.GetListaServLiq(900).size());
	}
	@Test
	public void traerpreciodetalle() {

		assertNotNull(mse.getPreciodetal(1));
	}
	@Test
	public void traerpreciodetalleNoexiste() {

		assertNull(mse.getPreciodetal(9000));
	}
	@Test
	public void Hacerfactura() {

	 boolean actual = mse.InsertarFactura(
			 new Factura(1, 123141423, "pepito", "hola", "efe123", 342424, 111, 224242, null, null),
			 false,
			 -1
		);
	 
	 
	}
	@Test
	public void buscarfactura() {

		assertNotNull( mse.getFactura(14));
	}
	@Test
	public void buscarfacturaNoExsitente() {

		assertNull( mse.getFactura(9999));
	}
	@Test
	public void GenerarpdfFacturaNoExistente() {
		
		try {
			mse.generarPDFfac(9999);			
		} catch(Exception e) {
			
			assertEquals("Factura no existe", e.getMessage());;			
		}
				
		
		
	}
}

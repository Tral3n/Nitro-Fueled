package include;

public class Detalle_fact {

	private int ID_FACTURA;
	private String SERVICIO;
	private int PRECIO;
	public Detalle_fact(int iD_FACTURA, String sERVICIO, int pRECIO) {
		super();
		ID_FACTURA = iD_FACTURA;
		SERVICIO = sERVICIO;
		PRECIO = pRECIO;
	}
	public int getID_FACTURA() {
		return ID_FACTURA;
	}
	@Override
	public String toString() {
		return "Detalle_fact [ID_FACTURA=" + ID_FACTURA + ", SERVICIO=" + SERVICIO + ", PRECIO=" + PRECIO + "]";
	}
	public void setID_FACTURA(int iD_FACTURA) {
		ID_FACTURA = iD_FACTURA;
	}
	public String getSERVICIO() {
		return SERVICIO;
	}
	public void setSERVICIO(String sERVICIO) {
		SERVICIO = sERVICIO;
	}
	public int getPRECIO() {
		return PRECIO;
	}
	public void setPRECIO(int pRECIO) {
		PRECIO = pRECIO;
	}
	
	
}

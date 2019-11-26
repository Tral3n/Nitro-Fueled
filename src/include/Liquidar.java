package include;

public class Liquidar {
	 private int ID_SERVICIO; 
	 private String NOMBRE;
	 private int PRECIO;
	 
	 
	public Liquidar(int iD_SERVICIO, String nOMBRE, int pRECIO) {
		super();
		ID_SERVICIO = iD_SERVICIO;
		NOMBRE = nOMBRE;
		PRECIO = pRECIO;
	}
	public Liquidar( String nOMBRE, int pRECIO) {
		super();
	
		NOMBRE = nOMBRE;
		PRECIO = pRECIO;
	}
	public int getID_SERVICIO() {
		return ID_SERVICIO;
	}
	public void setID_SERVICIO(int iD) {
		ID_SERVICIO  = iD;
	}
	public String getNOMBRE() {
		return NOMBRE;
	}
	public void setNOMBRE(String nOMBRE) {
		NOMBRE = nOMBRE;
	}
	public int getPRECIO() {
		return PRECIO;
	}
	public void setPRECIO(int pRECIO) {
		PRECIO = pRECIO;
	}
	@Override
	public String toString() {
		return "Liquidar [ID_SERVICIO=" + ID_SERVICIO + ", NOMBRE=" + NOMBRE + ", PRECIO=" + PRECIO + "]";
	}
	
	 
	 
	 
}

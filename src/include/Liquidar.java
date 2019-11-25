package include;

public class Liquidar {
	 private int ID; 
	 private String NOMBRE;
	 private int PRECIO;
	 
	 
	public Liquidar(int iD, String nOMBRE, int pRECIO) {
		super();
		ID = iD;
		NOMBRE = nOMBRE;
		PRECIO = pRECIO;
	}
	public Liquidar( String nOMBRE, int pRECIO) {
		super();
	
		NOMBRE = nOMBRE;
		PRECIO = pRECIO;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
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
		return "Liquidar [ID=" + ID + ", NOMBRE=" + NOMBRE + ", PRECIO=" + PRECIO + "]";
	}
	 
	 
	 
}

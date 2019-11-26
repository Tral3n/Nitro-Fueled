package include;

public class Configuracion {
	
	private byte ID ;
	 private int CANTIDAD;
	 private int PORCENTAJE;
	public Configuracion(byte iD, int cANTIDAD, int pORCENTAJE) {
		super();
		ID = iD;
		CANTIDAD = cANTIDAD;
		PORCENTAJE = pORCENTAJE;
	}
	public byte getID() {
		return ID;
	}
	public void setID(byte iD) {
		ID = iD;
	}
	public int getCANTIDAD() {
		return CANTIDAD;
	}
	public void setCANTIDAD(byte cANTIDAD) {
		CANTIDAD = cANTIDAD;
	}
	public int getPORCENTAJE() {
		return PORCENTAJE;
	}
	public void setPORCENTAJE(byte pORCENTAJE) {
		PORCENTAJE = pORCENTAJE;
	}
	@Override
	public String toString() {
		return "Configuracion [ID=" + ID + ", CANTIDAD=" + CANTIDAD + ", PORCENTAJE=" + PORCENTAJE + "]";
	}
	 
	 
	 

}

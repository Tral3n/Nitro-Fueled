package include;

public class Configuracion {
	
	private byte ID ;
	 private byte CANTIDAD;
	 private byte PORCENTAJE;
	public Configuracion(byte iD, byte cANTIDAD, byte pORCENTAJE) {
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
	public byte getCANTIDAD() {
		return CANTIDAD;
	}
	public void setCANTIDAD(byte cANTIDAD) {
		CANTIDAD = cANTIDAD;
	}
	public byte getPORCENTAJE() {
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

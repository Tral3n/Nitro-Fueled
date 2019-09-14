package include;

public class TipoAuto {
	 private int ID; 
	 private String TIPOAUTO;
	public TipoAuto(int iD, String tIPOAUTO) {
		super();
		ID = iD;
		TIPOAUTO = tIPOAUTO;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getTIPOAUTO() {
		return TIPOAUTO;
	}
	public void setTIPOAUTO(String tIPOAUTO) {
		TIPOAUTO = tIPOAUTO;
	}
	@Override
	public String toString() {
		return "TipoAuto [ID=" + ID + ", TIPOAUTO=" + TIPOAUTO + "]";
	}
}

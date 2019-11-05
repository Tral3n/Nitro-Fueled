package include;

import java.util.Calendar;

public class Turno {
	
	public Turno(int nROTURN, int cEDULA, String pLACA, int iD_TIPOAUTO, Calendar hORA_EN, boolean cANCEL) {
		super();
		NROTURN = nROTURN;
		CEDULA = cEDULA;
		PLACA = pLACA;
		ID_TIPOAUTO = iD_TIPOAUTO;
		HORA_EN = hORA_EN;
		CANCEL = cANCEL;
	}
	private int NROTURN ;
	private int CEDULA ;
	private String PLACA ;
		private int ID_TIPOAUTO;
    private Calendar HORA_EN;
    private boolean CANCEL;
	public int getNROTURN() {
		return NROTURN;
	}
	public void setNROTURN(int nROTURN) {
		NROTURN = nROTURN;
	}
	public int getCEDULA() {
		return CEDULA;
	}
	public void setCEDULA(int cEDULA) {
		CEDULA = cEDULA;
	}
	public String getPLACA() {
		return PLACA;
	}
	public void setPLACA(String pLACA) {
		PLACA = pLACA;
	}
	public int getID_TIPOAUTO() {
		return ID_TIPOAUTO;
	}
	public void setID_TIPOAUTO(int iD_TIPOAUTO) {
		ID_TIPOAUTO = iD_TIPOAUTO;
	}
	public Calendar getHORA_EN() {
		return HORA_EN;
	}
	public void setHORA_EN(Calendar hORA_EN) {
		HORA_EN = hORA_EN;
	}
	public boolean isCANCEL() {
		return CANCEL;
	}
	public void setCANCEL(boolean cANCEL) {
		CANCEL = cANCEL;
	}
	@Override
	public String toString() {
		return "Turno [NROTURN=" + NROTURN + ", CEDULA=" + CEDULA + ", PLACA=" + PLACA + ", ID_TIPOAUTO=" + ID_TIPOAUTO
				+ ", HORA_EN=" + HORA_EN + ", CANCEL=" + CANCEL + "]";
	}
    
    
}

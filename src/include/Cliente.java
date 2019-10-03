package include;

public class Cliente {

	private int ID ;
	private int CC ;
	private String NOMBRES ;
	private String APELLIDOS ;
	private int ID_TIPOAUTO;
	private String PLACA ;
	public Cliente(int iD, int cC, String nOMBRES, String aPELLIDOS, int iD_TIPOAUTO, String pLACA) {
		super();
		ID = iD;
		CC = cC;
		NOMBRES = nOMBRES;
		APELLIDOS = aPELLIDOS;
		ID_TIPOAUTO = iD_TIPOAUTO;
		PLACA = pLACA;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public int getCC() {
		return CC;
	}
	public void setCC(int cC) {
		CC = cC;
	}
	public String getNOMBRES() {
		return NOMBRES;
	}
	public void setNOMBRES(String nOMBRES) {
		NOMBRES = nOMBRES;
	}
	public String getAPELLIDOS() {
		return APELLIDOS;
	}
	public void setAPELLIDOS(String aPELLIDOS) {
		APELLIDOS = aPELLIDOS;
	}
	public int getID_TIPOAUTO() {
		return ID_TIPOAUTO;
	}
	public void setID_TIPOAUTO(int iD_TIPOAUTO) {
		ID_TIPOAUTO = iD_TIPOAUTO;
	}
	public String getPLACA() {
		return PLACA;
	}
	public void setPLACA(String pLACA) {
		PLACA = pLACA;
	}
	@Override
	public String toString() {
		return "Cliente [ID=" + ID + ", CC=" + CC + ", NOMBRES=" + NOMBRES + ", APELLIDOS=" + APELLIDOS
				+ ", ID_TIPOAUTO=" + ID_TIPOAUTO + ", PLACA=" + PLACA + "]";
	}
	
	 
}

package include;

import java.util.ArrayList;
import java.util.Calendar;

public class Factura  {

	
	private int ID_FACTURA;
	private int CC;
	private String NOMBRE;
	private String TIPO_AUTO;
	private String PLACA;
	private float SUBTOTAL;
	private float DESCUENTO;	
	private float TOTAL_FACTURA;
    private Calendar FECHA;
	
	private ArrayList <Detalle_fact> DetalleFact;

	public Factura(int iD_FACTURA, int cC, String nOMBRE, String tIPO_AUTO, String pLACA, float sUBTOTAL, float dESCUENTO,
			float tOTAL_FACTURA, Calendar fECHA, ArrayList<Detalle_fact> detalleFact) {
		super();
		ID_FACTURA = iD_FACTURA;
		CC = cC;
		NOMBRE = nOMBRE;
		TIPO_AUTO = tIPO_AUTO;
		PLACA = pLACA;
		SUBTOTAL = sUBTOTAL;
		DESCUENTO = dESCUENTO;
		TOTAL_FACTURA = tOTAL_FACTURA;
		FECHA = fECHA;
		DetalleFact = detalleFact;
	}

	public int getID_FACTURA() {
		return ID_FACTURA;
	}

	public void setID_FACTURA(int iD_FACTURA) {
		ID_FACTURA = iD_FACTURA;
	}

	public int getCC() {
		return CC;
	}

	public void setCC(int cC) {
		CC = cC;
	}

	public String getNOMBRE() {
		return NOMBRE;
	}

	public void setNOMBRE(String nOMBRE) {
		NOMBRE = nOMBRE;
	}

	public String getTIPO_AUTO() {
		return TIPO_AUTO;
	}

	public void setTIPO_AUTO(String tIPO_AUTO) {
		TIPO_AUTO = tIPO_AUTO;
	}

	public String getPLACA() {
		return PLACA;
	}

	public void setPLACA(String pLACA) {
		PLACA = pLACA;
	}

	public float getSUBTOTAL() {
		return SUBTOTAL;
	}

	public void setSUBTOTAL(int sUBTOTAL) {
		SUBTOTAL = sUBTOTAL;
	}

	public float getDESCUENTO() {
		return DESCUENTO;
	}

	public void setDESCUENTO(int dESCUENTO) {
		DESCUENTO = dESCUENTO;
	}

	public float getTOTAL_FACTURA() {
		return TOTAL_FACTURA;
	}

	public void setTOTAL_FACTURA(int tOTAL_FACTURA) {
		TOTAL_FACTURA = tOTAL_FACTURA;
	}

	public Calendar getFECHA() {
		return FECHA;
	}

	public void setFECHA(Calendar fECHA) {
		FECHA = fECHA;
	}

	public ArrayList<Detalle_fact> getDetalleFact() {
		return DetalleFact;
	}

	public void setDetalleFact(ArrayList<Detalle_fact> detalleFact) {
		DetalleFact = detalleFact;
	}

	@Override
	public String toString() {
		return "Factura [ID_FACTURA=" + ID_FACTURA + ", CC=" + CC + ", NOMBRE=" + NOMBRE + ", TIPO_AUTO=" + TIPO_AUTO
				+ ", PLACA=" + PLACA + ", SUBTOTAL=" + SUBTOTAL + ", DESCUENTO=" + DESCUENTO + ", TOTAL_FACTURA="
				+ TOTAL_FACTURA + ", FECHA=" + FECHA.getTime() + ", DetalleFact=" + DetalleFact + "]";
	}
	
	
	
}

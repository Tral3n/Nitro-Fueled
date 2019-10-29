package include;

public class Precio {
	private int ID; 
	 private int PRECIO;
	 	 private String TIPOAUTO;
	 	 private boolean ACTIVO;
		public Precio(int iD, int pRECIO, String tIPOAUTO, boolean aCTIVO ) {
			super();
			ID = iD;
			PRECIO = pRECIO;
			TIPOAUTO = tIPOAUTO;
			ACTIVO = aCTIVO;
		}
		public int getID() {
			return ID;
		}
		public boolean isACTIVO() {
			return ACTIVO;
		}
		public void setACTIVO(boolean aCTIVO) {
			ACTIVO = aCTIVO;
		}
		public void setID(int iD) {
			ID = iD;
		}
		public int getPRECIO() {
			return PRECIO;
		}
		public void setPRECIO(int pRECIO) {
			PRECIO = pRECIO;
		}
		public String getTIPOAUTO() {
			return TIPOAUTO;
		}
		public void setTIPOAUTO(String tIPOAUTO) {
			TIPOAUTO = tIPOAUTO;
		}
		@Override
		public String toString() {
			return "Precio [ID=" + ID + ", PRECIO=" + PRECIO + ", TIPOAUTO=" + TIPOAUTO + ", ACTIVO=" + ACTIVO + "]";
		}
	

	
	 
}

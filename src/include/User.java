package include;

public class User {
	 private String USUARIO; 
	 private String CONTRASENA
	 ;
	public User(String uSUARIO, String cONTRASENA) {
		super();
		USUARIO = uSUARIO;
		CONTRASENA = cONTRASENA;
	}
	public String getUSUARIO() {
		return USUARIO;
	}
	public void setUSUARIO(String uSUARIO) {
		USUARIO = uSUARIO;
	}
	public String getCONTRASENA() {
		return CONTRASENA;
	}
	public void setCONTRASENA(String cONTRASENA) {
		CONTRASENA = cONTRASENA;
	}
	@Override
	public String toString() {
		return "User [USUARIO=" + USUARIO + ", CONTRASENA=" + CONTRASENA + "]";
	}
	 
}

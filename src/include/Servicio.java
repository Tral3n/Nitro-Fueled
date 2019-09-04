package include;

public class Servicio {
 private int ID; 
 private String NOMBRE;
 
public Servicio(int iD, String nOMBRE) {

	ID = iD;
	NOMBRE = nOMBRE;
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

@Override
public String toString() {
	return "Servicio [ID=" + ID + ", NOMBRE=" + NOMBRE + "]";
}
 
}

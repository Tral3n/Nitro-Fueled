package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import include.Servicio;
import include.User;

public class ModeloUser extends Conexion {


    public boolean validar (User USUARIO) {

    boolean flag = false;

    PreparedStatement objSta = null;
    ResultSet tabla = null;

    try {

        String sql = "SELECT * FROM login WHERE USUARIO = ? AND CONTRASENA = ?";
        objSta = getConnection().prepareStatement(sql);
        objSta.setString(1, USUARIO.getUSUARIO());
        objSta.setString(2, USUARIO.getCONTRASENA());

        tabla = objSta.executeQuery();

        flag = tabla.absolute(1);



    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (objSta != null) {
                objSta.close();
            }
        } catch (Exception e) {
             e.printStackTrace();
        }
    }

    return flag;
    }

    public static void main(String[] args ) {
    	ModeloUser ms = new ModeloUser();
    	System.out.println(ms.validar(new User("admin", "123")));
    		}

}
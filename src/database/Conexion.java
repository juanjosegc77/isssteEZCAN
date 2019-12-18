package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

public class Conexion {
    static Connection cn = null;
    
    public static Connection Conectar(Connection cn)throws SQLException{
        String ruta = "//localhost/isssteEZCAN";
        String usuario = "uno";
        String contraseña = "pass";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql:" + ruta, usuario, contraseña);        
        }catch(ClassNotFoundException e){
            JOptionPane.showMessageDialog(null, e);
        }
        return cn;
    }
}
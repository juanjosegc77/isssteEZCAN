package database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/*
 * isssteEZCAN
 * Departamento de Investigación en Biología Molecular y Medicina Genómica 
 * Hospital Regional "Lic. Adolfo López Mateos" ISSSTE
 * Desarrollador: IB Juan José Guzmán Cruz
 * Responsable del proyecto: DC Osvaldo Erick Sánchez Hernández
 */
public class HelperDB {
 
    // Variables para la conexion
    static Connection cn;
    static Statement s;
    static ResultSet rs;
    
    DefaultTableModel model= new DefaultTableModel();
    String query = "";
    
    /**
     * Conectar a la base de datos utilizando el método Conexion.Conectar()
     */
    public void conn(){
        try {
            this.cn = Conexion.Conectar(this.cn);
        } catch (SQLException ex) {
            Logger.getLogger(HelperDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    /**
     * Obtener los nombres de las columnas.
     * Obtener los nombres de las columnas de una Tabla a partir de la
     * estructura obtenida por un ResultSet.
     * Los nombres de las columnas se agregar a un DefaultTableModel 
     * @param query Comando SQL para obtener los datos. Ej. "SELECT [campos] FROM [tabla];"
     * @return 
     */
    public DefaultTableModel getColumns(String query){ 
        conn();
        try{
            enviarQuery(query);
            ResultSetMetaData rsmd = this.rs.getMetaData();
            
            //OBTENER EL NÚMERO Y NOMBRE DE LAS COLUMNAS DE LA TABLA
            // Y AGREGARLOS AL MODELO
            int columnas = rsmd.getColumnCount(); 
            for(int i=1; i<=columnas; i++){
                // Agregar los nombres de columnas al model
                this.model.addColumn(rsmd.getColumnLabel(i));
            }
            this.cn.close();
        }catch(Exception e){JOptionPane.showMessageDialog(null, e);}
        
        return this.model;
    }
    
    /**
     * Establece un modelo obtenido a un JTable destino
     * @param model DefaultTableModel destino al cual aplicar el modelo obtenido
     * @param table JTable destino en el que se cargará el modelo
     * @param query Comando SQL para obtener los datos. Ej. "SELECT [campos] FROM [tabla];"
     */
    public void setColumns(DefaultTableModel model, JTable table, String query){
        model = getColumns(query);
        table.createDefaultColumnsFromModel();
        table.setModel(model);
    }
    
    /**
     * Obtener los datos de una base de datos y guardarlos en un modelo.
     * Obtener todos los registros de una tabla utilizando un ResultSet.
     * Los registros se agregan a un DefaultTableModel
     * @param query Comando SQL para obtener los datos. Ej. "SELECT [campos] FROM [tabla];"
     * @return 
     */
    public DefaultTableModel getData(String query){ 
        conn();
        try{
            enviarQuery(query);
            ResultSetMetaData rsmd = this.rs.getMetaData();
            
            //OBTENER EL NÚMERO Y NOMBRE DE LAS COLUMNAS DE LA TABLA
            // Y AGREGARLOS AL MODELO
            int columnas = rsmd.getColumnCount(); 
            //OBTENER CADA UNA DE LAS FILAS DE LA TABLA Y AGREGARLAS AL MODELO
            while (this.rs.next()){
                // Crear array para insertar las filas 
                Object[] fila = new Object[columnas];
                
                // Cargar los datos al model
                for(int i=0; i<columnas; i++){
                    fila[i] = this.rs.getObject(i+1);
                }
                this.model.addRow(fila);
            }
            this.cn.close();
        }catch(Exception e){JOptionPane.showMessageDialog(null, e);}
        
        // DEVOLVER EL MODELO
        return this.model;
    }
    
    /**
     * Establece los datos guardados en un modelo.
     * @param model El modelo al que se aplicará el modelo obtenido
     * @param table La tabla que mostrará los datos
     * @param query Comando SQL para obtener los datos. Ej. "SELECT [campos] FROM [tabla];"
     */
    public void setData(DefaultTableModel model, JTable table, String query){
        model = getData(query);
        table.setModel(model);
    }
    
    
    /**
     * Obtener los nombres de las columnas de una o varias bases de datos y guardarlos en un único modelo.
     * Se omite agregar 2 columnas a partir de la segunda base de datos, ya que 
     * las bases de datos son relacionales y comparten las dos primeras columnas. 
     * Con esto se evita duplicar campos.
     * Se crea una sentencia SQL que especifica los campos que se buscarán con el 
     * formato Tabla.Campo
     * @param tablas Arreglo con los nombres de las tablas de las cuales se extraerán los nombres de las columnas
     * @return Devuelve los nombres de las columnas en un modelo
     */
    public DefaultTableModel getAllColumns(ArrayList<String> tablas){ 
        
        ArrayList<String> cadena = new ArrayList();
        String tabla = "";
        String query = "";
        int j = 0;
        
        for(int l=0; l<tablas.size(); l++){
            if(l == 0){
                query = "SELECT * FROM " + tablas.get(l);
                tabla = tablas.get(l);
                j = 1;
            }
            else{
                query = "SELECT * FROM " + tablas.get(l);
                tabla = tablas.get(l);
                j = 3;
            }
            
            conn();
            try{
                enviarQuery(query);
                ResultSetMetaData rsmd = this.rs.getMetaData();

                int columnas = rsmd.getColumnCount(); 
                for(int i=j; i<=columnas; i++){
                    // Agregar los nombres de columnas al model
                    this.model.addColumn(rsmd.getColumnLabel(i));
                    cadena.add(tabla + "." + rsmd.getColumnLabel(i));
                }
                this.cn.close();
            }catch(Exception e){JOptionPane.showMessageDialog(null, e);}
        }
        
        // CREAR EL STRING DE LOS NOMBRES DE COLUMNAS A BUSCAR EN LA BASE DE DATOS
        String arreglo[] = new String[cadena.size()];
        String col = "";
        int c =  cadena.size();
        for(int i=0; i<c; i++){
            arreglo[i] = cadena.get(i);
            if(i<c-1){
                col += arreglo[i] + ", ";
            }
            else{
                col += arreglo[i];
            }
        }
        
        String q = "SELECT " + col + " FROM ";
        for(int i=0; i<tablas.size(); i++){
            if(i <  tablas.size()-1){
                q += " " + tablas.get(i) + ", ";
            }
            else{
                q += " " + tablas.get(i);
            }
            
        }
        setQuery(q);
        return this.model;
    }
    
    /**
     * Establece los nombres de las columnas de una o varias bases de datos guardados en un modelo.
     * @param model Modelo destino al cual se agregara el modelo obtenido
     * @param table Tabla que mostará los datos obtenidos
     * @param tablas Arreglo con los nombres de las Bases de Datos a consultar 
     */
    public void setAllModels(DefaultTableModel model, JTable table, ArrayList<String> tablas){
        model = getAllColumns(tablas);
        table.createDefaultColumnsFromModel();
        table.setModel(model);
    }
    
    /**
     * Obtener sentencia SQL
     * @return 
     */
    public String getQuery(){
        String query = this.query;
        return query;
    }
    
    /**
     * Establece sentencia SQL
     * @param query 
     */
    public void setQuery(String query){
        this.query = query;
    }
    
    /**
     * Obtener el número total de columnas y el último valor de una campo específico de una Base de Datos
     * @param query Comando SQL para obtener los datos. Ej. "SELECT [campos] FROM [tabla];"
     * @param key Nombre de campo a consultar de donde se obtendrá el último registro
     * @return 
     */
    public int[] getColumnsAndKey(String query, String key){
        int xy[] = new int[2];
        conn();
        try{
            enviarQuery(query);
            ResultSetMetaData rsmd = this.rs.getMetaData();
            
            xy[1] = rsmd.getColumnCount(); 
                
            while(this.rs.next())
            {
                this.rs.last();
                xy[0] = this.rs.getInt(key);
            }
            this.rs.close();
            this.cn.close();
        }catch(Exception e){JOptionPane.showMessageDialog(null, e);}
        
        return xy;
    }
    
    /**
     * Obtiene y devuelve los nombres de las columnas de una Base de Datos y los transpone
     * @param query Comando SQL para obtener los datos. Ej. "SELECT [campos] FROM [tabla];"
     * @param columnas Nombre de las columnas del modelo que contendrá las columnas
     * transpuestas dde la Base de Datos consultada
     * @param saltar_columnas Permite omitir campos a una determinada frecuencia
     * @return 
     */
    public DefaultTableModel getColumnsToRows(String query, String[] columnas, int saltar_columnas){ 
        conn();
        try{
            enviarQuery(query);
            ResultSetMetaData rsmd = this.rs.getMetaData();
            
            for(String c : columnas){
                this.model.addColumn(c);
            }
            
            int col = rsmd.getColumnCount();
            for(int i=3; i<=col; i+=saltar_columnas){
                Object[] fila = {rsmd.getColumnLabel(i)};
                this.model.addRow(fila);   
            }
            this.cn.close();
        }catch(Exception e){JOptionPane.showMessageDialog(null, e);}
        
        return this.model;
    }
    
    /**
     * Establece los nombres de las columnas traspuestas de una Base de Datos
     * @param model
     * @param tabla
     * @param query
     * @param columnas
     * @param saltar_columnas 
     */
    public void setColumnsToRows(DefaultTableModel model, JTable tabla, String query, String[] columnas, int saltar_columnas){
        model = getColumnsToRows(query, columnas, saltar_columnas);
        tabla.createDefaultColumnsFromModel();
        tabla.setModel(model);
    }
   
    
    public ArrayList<String> getArrayData(String query){ 
        ArrayList<String> data = new ArrayList();
        conn();
        try{
            enviarQuery(query);
            ResultSetMetaData rsmd = this.rs.getMetaData();
            
            //Obtener el número de columnas 
            int columnas = rsmd.getColumnCount();
            while (this.rs.next()){
                for(int i=0; i<columnas; i++){                   
                    data.add(this.rs.getString(i+1));
                }
            }
            this.cn.close();
        }catch(Exception e){JOptionPane.showMessageDialog(null, e);}
        
        return data;
    }
    
    // ENVIAR SENTENCIA SQL
    public void enviarQuery(String query){
        try {
            Statement s = this.cn.createStatement();
            this.rs = s.executeQuery(query);
        } catch (SQLException ex) {
            Logger.getLogger(HelperDB.class.getName()).log(Level.SEVERE, null, ex);
            JOptionPane.showMessageDialog(null, ex);
        }
    }
    
    // ENVIAR SENTENCIA SQL
    public boolean updateDB(String query){
        boolean r = false;
        conn();
        try {
            Statement s = this.cn.createStatement();
            s.executeUpdate(query);
            r = true;
            this.cn.close();
        } catch (SQLException ex) {
            Logger.getLogger(HelperDB.class.getName()).log(Level.SEVERE, null, ex);
            JOptionPane.showMessageDialog(null, ex);
        }
        return r;
    }
}

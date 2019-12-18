package interfaz;

import java.awt.Component;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableCellRenderer;
import javax.swing.table.TableColumn;

/*
 * isssteEZCAN
 * Departamento de Investigación en Biología Molecular y Medicina Genómica 
 * Hospital Regional "Lic. Adolfo López Mateos" ISSSTE
 * Desarrollador: IB Juan José Guzmán Cruz
 * Responsable del proyecto: DC Osvaldo Erick Sánchez Hernández
 */
public class Tablas {
    
    
    public Tablas(){
        
    }
    
    /**
     * Ajustar las columnas del table al contenido de las celdas.
     */
    public void ajustarColumnas(JTable table){
        table.setAutoResizeMode(JTable.AUTO_RESIZE_ALL_COLUMNS);

        // Ajustar las columnas al mayor contenido de los renglones
        table.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);
        for (int column = 0; column < table.getColumnCount(); column++){
            TableColumn tableColumn = table.getColumnModel().getColumn(column);
            int preferredWidth = tableColumn.getMinWidth();
            int maxWidth = tableColumn.getMaxWidth();

            for (int row = 0; row < table.getRowCount(); row++){
                TableCellRenderer cellRenderer = table.getCellRenderer(row, column);
                Component c = table.prepareRenderer(cellRenderer, row, column);
                int width = c.getPreferredSize().width + table.getIntercellSpacing().width;
                preferredWidth = Math.max(preferredWidth, width);

                if (preferredWidth >= maxWidth){
                    preferredWidth = maxWidth;
                    break;
                }
            }
            tableColumn.setMinWidth(preferredWidth);
        }
    }

    public void ocultarColumna(JTable table, int col){
        table.getColumnModel().getColumn(1).setMaxWidth(0);
        table.getColumnModel().getColumn(1).setMinWidth(0);
        table.getColumnModel().getColumn(1).setPreferredWidth(0);
    }
    
    public void limpiarTabla(JTable table){
        DefaultTableModel model = new DefaultTableModel();
        model = (DefaultTableModel) table.getModel();
        
        if(model.getColumnCount()>0)
            model.setColumnCount(0);
        
        int filas = model.getRowCount();
        if(filas>0){
            for(int i=0; i<filas; i++)
                model.removeRow(0);
        }

    }
}

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package jdbc;
import java.sql.*;

/**
 *
 * @author
 */
public class Koneksi{
    
    
    public Connection bukaKoneksi()throws SQLException{       
        Connection connect;
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/lisensi","root","");
            return connect;
        }
        catch(Exception exc){

        }
            return null;
    }
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package datos;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnection {
    private static Connection connection;

    public static Connection getConnection() throws SQLException, ClassNotFoundException, IOException {
        if (connection == null || connection.isClosed()) {
            Properties props = new Properties();
            props.load(DBConnection.class.getClassLoader().getResourceAsStream("dbconfig.properties"));
            
            String url = props.getProperty("jdbc.url");
            String username = props.getProperty("jdbc.username");
            String password = props.getProperty("jdbc.password");
            String driver = props.getProperty("jdbc.driver");
            
            Class.forName(driver);
            connection = DriverManager.getConnection(url, username, password);
        }
        return connection;
    }
}


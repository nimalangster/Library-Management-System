/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgc.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;


public class ConnectionFactory {   
    
   static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
   static final String DB_URL = "jdbc:mysql://localhost/library?useSSL=false";
    //  Database credentials
   static final String USER = "root";
   static final String PASS = "root";
   static Connection conn = null; 
    
    public static Connection getConnection() throws SQLException{
        try{           
            Class.forName(JDBC_DRIVER);            
            conn = DriverManager.getConnection(DB_URL,USER,PASS); 
        } catch(ClassNotFoundException ex){
            System.out.println(ex.getMessage());         
        }catch (SQLException ex) {
          //throw new RuntimeException("Error connecting to the database", ex);
          System.out.println("Error:: " + ex.getMessage());
      }
        return conn;        
    }  
    
    public static void disConnect() {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ex) {
                System.out.println("Error: " + ex.getMessage());
            }
        }
    }   
}

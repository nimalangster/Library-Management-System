/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgc.data;

import com.sgc.model.MainClassification;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 *
 * @author ex1
 */
public class MainClassDAO implements MainClassDAOInterface{
    
    
    private MainClassification extractMainClassFromResultSet(ResultSet rs) throws SQLException {
        
        MainClassification mainClass = new MainClassification();

        mainClass.setId(rs.getInt("mainClassificationId") );
        mainClass.setName(rs.getString("mainClassificationName") );

        return mainClass;
        }
    
    
    @Override
    public String getMainClassNameById(int id){
    
        int mainClassId = id;       

        try{  
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pst = conn.prepareStatement("select * from main_classification where mainClassificationId =" + mainClassId);            
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                
                MainClassification mainClass = extractMainClassFromResultSet(rs);
                return mainClass.getName();
                }
        } catch (SQLException ex) {
        ex.printStackTrace();
        }    
        return null;
    }
    
    @Override
     public int getMainClassIdByName(String name){
    
        String mainClassName = name;       

        try{  
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pst = conn.prepareStatement("select mainClassificationId from main_classification where mainClassificationName ='" + mainClassName+"'");            
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                
                int  MainClassId =  rs.getInt("mainClassificationId");
                return MainClassId;
                }
        } catch (SQLException ex) {
        System.out.println(ex.getMessage()) ;
        }    
        return 0;
    }
    
    @Override
     public Set getMainClassesByName(String name)
     {
         
         String className = name;
     try{     
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pst = conn.prepareStatement("select * from main_classification WHERE mainClassificationName LIKE '" + className+"%'");            
            ResultSet rs = pst.executeQuery();
            Set mainClasses = new HashSet();
            while(rs.next())
            {
                MainClassification mainclass = extractMainClassFromResultSet(rs);
                mainClasses.add(mainclass);
            }
            return mainClasses;
        } catch (SQLException ex) {
        ex.printStackTrace();
        }    
        return null;
     
     }
    @Override
     public Set getAllMainClasses()  {     

        try{     
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pst = conn.prepareStatement("select * from main_classification");            
            ResultSet rs = pst.executeQuery();
            Set mainClasses = new HashSet();
            while(rs.next())
            {
                MainClassification mainclass = extractMainClassFromResultSet(rs);
                mainClasses.add(mainclass);
            }
            return mainClasses;
        } catch (SQLException ex) {
        ex.printStackTrace();
        }    
        return null;
    }
     
     public List getAllMainClassesInList()  {     

        try{     
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pst = conn.prepareStatement("select * from main_classification");            
            ResultSet rs = pst.executeQuery();
            List mainClasses = new ArrayList();
            while(rs.next())
            {
                MainClassification mainclass = extractMainClassFromResultSet(rs);
                mainClasses.add(mainclass);
            }
            return mainClasses;
        } catch (SQLException ex) {
        ex.printStackTrace();
        }    
        return null;
    }
    

    //@Override
    public boolean insertMainClass(MainClassification mainClass) throws SQLException{
                    
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pst = conn.prepareStatement("insert into main_classification ( mainClassificationName ) values (?)");            
            
            pst.setString(1, mainClass.getName());             
            
            int i = pst.executeUpdate();
            if(i == 1)
                return true;
        
        return false;
    }

    public MainClassification getMainClassById(int id) {

        int mcId = id;
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pst = conn.prepareStatement("select * from main_classification WHERE mainclassificationId =" + mcId);
            ResultSet rs = pst.executeQuery();
            MainClassification mainClass = null;

            while (rs.next()) {
                mainClass = extractMainClassFromResultSet(rs);
            }
            return mainClass;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
     
   // @Override
    public boolean updateMainClass(MainClassification mainClass) {
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pst = conn.prepareStatement("update main_classification SET mainClassificationName = ? WHERE mainClassificationId = ?");

            pst.setString(1, mainClass.getName());

            pst.setInt(2, mainClass.getId());

            int i = pst.executeUpdate();
            if (i == 1) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    
    
    @Override
    public boolean deleteMainClassById(int mainClassId) {
        try{            
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pst = conn.prepareStatement("DELETE from main_classification WHERE mainClassificationId = ?");
            
            pst.setInt(1, mainClassId);          
            
            int i = pst.executeUpdate();
            if(i == 1)
                return true;
        } catch(Exception e){
               System.out.println(e.getMessage()) ;
        } 
        return false;
    }    
    
}

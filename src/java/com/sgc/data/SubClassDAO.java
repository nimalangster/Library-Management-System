/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgc.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;
import com.sgc.model.SubClassification;
/**
 *
 * @author ex1
 */
public class SubClassDAO implements SubClassDAOInterface{
    
     private SubClassification extractSubClassFromResultSet(ResultSet rs) throws SQLException {
        
        SubClassification subClass = new SubClassification();
        int i = rs.getInt("subClassificationId") ;
        subClass.setSubClassId(rs.getInt("subClassificationId") );
        subClass.setMainClassId(rs.getInt("mainClassificationId") );
        subClass.setSubClassName(rs.getString("subClassificationName") );

        return subClass;
        }
     
     private SubClassification extractSubClassFromResultSetView(ResultSet rs) throws SQLException {
        
        SubClassification subClass = new SubClassification();
        int i = rs.getInt("subClassificationId") ;
        subClass.setSubClassId(rs.getInt("subClassificationId") );
        subClass.setMainClassId(rs.getInt("mainClassificationId") );
        subClass.setSubClassName(rs.getString("subClassificationName") );
        subClass.setMainClassName(rs.getString("mainClassificationName") );

        return subClass;
        }
    
     public  String getSubClassNameById(int id){
     
         int subClassId = id;       

        try{  
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pst = conn.prepareStatement("select subClassificationName from sub_classification where subClassificationId ='" + subClassId+"'");            
            ResultSet rs = pst.executeQuery();
            if(rs.next())
                return rs.getString("subClassificationName");
        } catch (SQLException ex) {
        ex.printStackTrace();
        }    
     return null;
     }
     
    public int getSubclassIdByName(String name){    
        
        String subClassName = name;       

        try{  
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pst = conn.prepareStatement("select subClassificationId from sub_classification where subClassificationName ='" + subClassName+"'");            
            ResultSet rs = pst.executeQuery();
            if(rs.next())
                return rs.getInt("subClassificationId");
        } catch (SQLException ex) {
        ex.printStackTrace();
        }    
       return 0;
    }   
    
    
    
    
    public SubClassification getSubClassById(int id){
    
        int subClassId = id;       

        try{  
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pst = conn.prepareStatement("SELECT * FROM sub_classification sc JOIN main_classification mc ON sc.mainClassificationId = mc.mainclassificationId where subClassificationId =" + subClassId);            
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                
                SubClassification subClass = extractSubClassFromResultSetView(rs);
                return subClass;
                }
        } catch (SQLException ex) {
        ex.printStackTrace();
        }    
        return null;
    }
    
    
    
     public Set getSubClassesByMainClassId(int mainClassId)  {     

        try{     
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pst = conn.prepareStatement("select * from sub_classification WHERE mainClassificationId = ?");            
            pst.setInt(1,mainClassId);
            
            ResultSet rs = pst.executeQuery();
            Set subClasses = new HashSet();
            while(rs.next())
            {
                SubClassification subclass = extractSubClassFromResultSet(rs);
                subClasses.add(subclass);
            }
            return subClasses;
        } catch (SQLException ex) {
        ex.printStackTrace();
        }    
        return null;
    }
    
     public Set getSubClassesByName(String subClassName)  {
     
     try{     
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pst = conn.prepareStatement("SELECT * FROM sub_classification sc JOIN main_classification mc ON sc.mainClassificationId = mc.mainClassificationId WHERE subClassificationName LIKE '" + subClassName+"%'");            
            //pst.setString(1,subClassName);
            
            ResultSet rs = pst.executeQuery();
            Set subClasses = new HashSet();
            while(rs.next())
            {
                SubClassification subclass = extractSubClassFromResultSetView(rs);
                subClasses.add(subclass);
            }
            return subClasses;
        } catch (SQLException ex) {
        ex.printStackTrace();
        }    
        return null;
     
     }
    
     public Set getAllSubClasses()  {     

        try{     
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pst = conn.prepareStatement("SELECT * FROM sub_classification sc JOIN main_classification mc ON sc.mainClassificationId = mc.mainClassificationId");            
            ResultSet rs = pst.executeQuery();
            Set subClasses = new HashSet();
            while(rs.next())
            {
                SubClassification subclass = extractSubClassFromResultSetView(rs);
                subClasses.add(subclass);
            }
            return subClasses;
        } catch (SQLException ex) {
        ex.printStackTrace();
        }    
        return null;
    }
    

    //@Override
    public boolean insertSubClass(SubClassification subClass) throws SQLException{
                    
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pst = conn.prepareStatement("insert into sub_classification ( subClassificationName,mainClassificationId ) values (?,?)");            
            
            pst.setString(1, subClass.getSubClassName());
            pst.setInt(2, subClass.getMainClassId());
            
            int i = pst.executeUpdate();
            if(i == 1)
                return true;
        
        return false;
    }

    
    //@Override
    public boolean updateSubClass(SubClassification subClass) {
        try{            
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pst = conn.prepareStatement("update sub_classification SET subClassificationName = ?, mainClassificationId = ? WHERE subClassificationId = ?");
                        
            pst.setString(1, subClass.getSubClassName());            
            pst.setInt(2, subClass.getMainClassId());
            pst.setInt(3, subClass.getSubClassId());
            
            int i = pst.executeUpdate();
            if(i == 1)
                return true;
        } catch(Exception e){
               System.out.println(e.getMessage()) ;
        } 
        return false;
    }    

    
    
    public boolean deleteSubClassById(int subClassId) throws SQLException {
                   
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pst = conn.prepareStatement("DELETE from sub_classification WHERE subClassificationId = ?");
            
            pst.setInt(1, subClassId);          
            
            int i = pst.executeUpdate();
            if(i == 1)
                return true;
        
        return false;
    }   
}
    

    

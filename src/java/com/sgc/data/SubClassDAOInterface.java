/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgc.data;

import java.sql.SQLException;
import java.util.Set;
import com.sgc.model.SubClassification;

/**
 *
 * @author ex1
 */
public interface SubClassDAOInterface {
    
    SubClassification getSubClassById(int id); 
    int getSubclassIdByName(String name);
    String getSubClassNameById(int id);
    Set <SubClassification> getSubClassesByMainClassId(int id);  
    Set <SubClassification> getAllSubClasses();
    boolean insertSubClass(SubClassification subClassification) throws SQLException;
    boolean updateSubClass(SubClassification subClassification);
    boolean deleteSubClassById(int id) throws SQLException;
    Set getSubClassesByName(String subClassName);
    
}

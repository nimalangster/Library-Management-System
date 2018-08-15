/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgc.data;

import java.sql.SQLException;
import java.util.Set;
import com.sgc.model.MainClassification;

/**
 *
 * @author ex1
 */
public interface MainClassDAOInterface {
    
    String getMainClassNameById(int id);  
    int getMainClassIdByName(String name);
    Set <MainClassification> getAllMainClasses();
    boolean insertMainClass(MainClassification mainClassification) throws SQLException;
    boolean updateMainClass(MainClassification mainClassification);
    boolean deleteMainClassById(int id) throws SQLException;
    Set getMainClassesByName(String name);
}

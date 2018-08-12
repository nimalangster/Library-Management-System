/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgc.model;

/**
 *
 * @author ex1
 */
public class SubClassification {
    
    private int subClassId;
    private String subClassName;
    private int mainClassId;
    private String mainClassName;

    public String getMainClassName() {
        return mainClassName;
    }

    public void setMainClassName(String mainClassName) {
        this.mainClassName = mainClassName;
    }

    public int getSubClassId() {
        return subClassId;
    }

    public void setSubClassId(int subClassId) {
        this.subClassId = subClassId;
    }

    public String getSubClassName() {
        return subClassName;
    }

    public void setSubClassName(String subClassName) {
        this.subClassName = subClassName;
    }

    public int getMainClassId() {
        return mainClassId;
    }

    public void setMainClassId(int mainClassId) {
        this.mainClassId = mainClassId;
    }
    
    
}

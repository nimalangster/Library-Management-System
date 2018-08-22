/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgc.controller;

import com.sgc.data.MainClassDAO;
import com.sgc.data.SubClassDAO;
import com.sgc.model.MainClassification;
import com.sgc.model.SubClassification;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ex1
 */
@WebServlet(name = "AddSubClassificationController", urlPatterns = {"/AddSubClassificationController"})
public class AddSubClassificationController extends HttpServlet {
    
    MainClassDAO mainClassDao = new MainClassDAO();
    MainClassification mainClass = new MainClassification();
    SubClassification subClass = new SubClassification();
    SubClassDAO subClassDao = new SubClassDAO();


    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddSubClassificationController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddSubClassificationController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         String mainClassId = request.getParameter("mainClassId");
         String pageFrom = request.getParameter("pageFrom");
         
         if (mainClassId != null) {
            request.setAttribute("MainClassId", mainClassId);
            request.setAttribute("PageFrom", pageFrom);
        }
         
         Set setMainClass = mainClassDao.getAllMainClasses();  
         request.setAttribute("setMainClass", setMainClass);
         request.getRequestDispatcher("/addSubClassification.jsp?mode=add").forward(request, response);        
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String Message ;
        String Heading;
        String subClassName = request.getParameter("subClassName"); 
        String MainClassId = request.getParameter("MainClassId"); 
        int mainClassId;
        
         if(!"".equals(MainClassId)){
        
            String PageFrom = request.getParameter("PageFrom");
            mainClassId = Integer.parseInt(MainClassId);
        }else{
            mainClassId = Integer.parseInt(request.getParameter("category")); 
        }
        
        if(subClassName != null){         
            subClass.setSubClassName(subClassName);  
            subClass.setMainClassId(mainClassId);
        }
        boolean success = false;
        try {         
           success = subClassDao.insertSubClass(subClass);
        } catch (SQLException ex) {
            Logger.getLogger(AddSubClassificationController.class.getName()).log(Level.SEVERE, null, ex);
        }      
        if (success)
            Heading = "The Sub classification is successfully added!";
        else
            Heading = "The sub classification is not added!";
            
        Set <SubClassification> setSubClassification = new HashSet();
        int i = setSubClassification.size();
        try{
                SubClassDAO subdao = new SubClassDAO();
                setSubClassification = subdao.getAllSubClasses();           
                i = setSubClassification.size();
                } catch(Exception e){
                       System.out.println(e.getMessage()) ; 
            }  
        if (i == 0) {
                Message = "No records found!";
            } else {
                Message = "(" + i + ") Record(s) found!";
            }
        request.setAttribute("Heading", Heading);
        request.setAttribute("SetClasses", setSubClassification); 
        request.setAttribute("Message", Message);
        
         if(!"".equals(MainClassId)){
            request.getRequestDispatcher("ViewMainClassificationController?mode=edit&classId="+mainClassId).forward(request, response);   
        }else{
            request.getRequestDispatcher("/searchAllSubClassifications.jsp").forward(request, response);         
            }       
       
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

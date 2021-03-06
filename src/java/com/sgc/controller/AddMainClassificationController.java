/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgc.controller;

import com.sgc.data.MainClassDAO;
import com.sgc.model.MainClassification;
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
@WebServlet(name = "AddMainClassificationController", urlPatterns = {"/AddMainClassificationController"})
public class AddMainClassificationController extends HttpServlet {
    
    
    MainClassDAO mainClassDao;
    MainClassification mainClass;

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
            out.println("<title>Servlet AddMainClassificationController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddMainClassificationController at " + request.getContextPath() + "</h1>");
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
        
        String Message ;
        String Heading;
        String y = request.getParameter("ClassName"); 
        if(y != null){ 
        mainClass = new MainClassification();
        mainClass.setName(y);       
        }
        boolean success = false;
        try {
           mainClassDao = new MainClassDAO();
           success = mainClassDao.insertMainClass(mainClass);
        } catch (SQLException ex) {
            Logger.getLogger(AddMainClassificationController.class.getName()).log(Level.SEVERE, null, ex);
        }      
        if (success)
            Heading = "The main classification is successfully added!";
        else
            Heading = "The main classification is not added!";
            
        Set <MainClassification> setMainClassification = new HashSet();
        int i = setMainClassification.size();
        try{
                MainClassDAO maindao = new MainClassDAO();
                setMainClassification = maindao.getAllMainClasses();           
                i = setMainClassification.size();
                } catch(Exception e){
                       System.out.println(e.getMessage()) ; 
            }  
        if (i == 0) {
                Message = "No records found!";
            } else {
                Message = "(" + i + ") Record(s) found!";
            }
        request.setAttribute("Heading", Heading);
        request.setAttribute("SetClasses", setMainClassification); 
        request.setAttribute("Message", Message);
        request.getRequestDispatcher("/searchAllMainClassifications.jsp").forward(request, response);         
       
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
        processRequest(request, response);
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

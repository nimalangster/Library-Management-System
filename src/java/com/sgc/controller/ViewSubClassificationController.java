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
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ex1
 */
@WebServlet(name = "ViewSubClassificationController", urlPatterns = {"/ViewSubClassificationController"})
public class ViewSubClassificationController extends HttpServlet {

    SubClassification subClass = new SubClassification();
    SubClassDAO subClassDao = new SubClassDAO();
    
    MainClassification mainClass = new MainClassification();
    MainClassDAO mainClassDao = new MainClassDAO();
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
            out.println("<title>Servlet ViewSubClassificationController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewSubClassificationController at " + request.getContextPath() + "</h1>");
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
        
         if (!"".equals(request.getParameter("classId"))) {             
             
            int classId = Integer.parseInt(request.getParameter("classId"));
            String mode = request.getParameter("mode");
            subClass = subClassDao.getSubClassById(classId);
            String mainClass = subClass.getMainClassName().toString();
            Set setMainClass = mainClassDao.getAllMainClasses();  
            if(!"".equals(mode))
            request.setAttribute("mode", mode);
            request.setAttribute("MainClass", mainClass);
            request.setAttribute("setMainClass", setMainClass);
            request.setAttribute("subClass", subClass);
            if("ToDelete".equals(request.getParameter("mode"))){
                request.getRequestDispatcher("/viewSubClassification.jsp?mode=ConfirmDelete").forward(request, response);
             }
            else{
                request.getRequestDispatcher("/viewSubClassification.jsp").forward(request, response);
            }        
    }
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

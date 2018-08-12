/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgc.controller;

import com.sgc.data.MainClassDAO;
import com.sgc.data.SubClassDAO;
import com.sgc.model.SubClassification;
import com.sgc.model.MainClassification;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
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
@WebServlet(name = "SearchSubClassificationController", urlPatterns = {"/SearchSubClassificationController"})
public class SearchSubClassificationController extends HttpServlet {
    
    
    
    SubClassification subClassification = new SubClassification();
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
            out.println("<title>Servlet SearchSubClassificationController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchSubClassificationController at " + request.getContextPath() + "</h1>");
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

        String s2 = request.getParameter("mode").toString();
        String Heading = "";
        String RecordCount;

        if ("edit".equals(s2)) {
            Heading = "Select Sub Classification to Edit";
        } else if ("delete".equals(s2)) {
            Heading = "Select Sub Classification to Delete";
        } else if ("search".equals(s2)) {
            Heading = "Search Sub Classification";
        } else if ("ViewAll".equals(s2)) {
            Heading = "View All Sub Classifications";
        } else if ("Deleted".equals(s2)) {
            Heading = "The selected Sub Classification is successfully deleted!";
        } else if ("Edited".equals(s2)) {
            Heading = "The selected Sub Classification is successfully updated!";
        } else if ("Constraint".equals(s2)) {
            Heading = "The selected Sub Classification cannot be deleted associated books are exists!";
        }

        Set<SubClassification> setSubClassification = new HashSet();
        int i = setSubClassification.size();
        try {
            SubClassDAO subDao = new SubClassDAO();
            setSubClassification = subDao.getAllSubClasses();
            i = setSubClassification.size();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        if (i == 0) {
            RecordCount = "No records found!";
        } else {
            RecordCount = "(" + i + ") Record(s) found!";
        }

        request.setAttribute("Message", RecordCount);
        request.setAttribute("Heading", Heading);
        request.setAttribute("SetClasses", setSubClassification);
        request.getRequestDispatcher("/searchAllSubClassifications.jsp").forward(request, response);

       
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
        
        
        String Heading = "Search Sub Classification";
        String message = "";
        String s = request.getParameter("FilterBy");
        Set<SubClassification> setSubClassification = new HashSet();
        int i = setSubClassification.size();
        boolean exception = false;
        
        if (!"".equals(request.getParameter("SearchString"))) {
            if ("ById".equals(s)) {

                int classId = 0;
                try {
                    classId = Integer.parseInt(request.getParameter("SearchString"));
                } catch (NumberFormatException e) {
                    message = "Id must be integer value!";
                    exception = true;
                }
                if (!exception) {
                    try {
                        SubClassification subClass = subClassDao.getSubClassById(classId);
                        if (!subClass.equals(null)) 
                            setSubClassification.add(subClass);
                    } catch (Exception e) {
                        System.out.println(e.getMessage());
                    }
                }
            }

            if ("ByName".equals(s)) {

                String className = "";

                className = request.getParameter("SearchString");

                try {
                    SubClassDAO subdao = new SubClassDAO();
                    setSubClassification = subdao.getSubClassesByName(className);

                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }

            }

            i = setSubClassification.size();
            if (i == 0) {
                message = "No records found!";
            } else {
                message = "(" + i + ") Record(s) found!";
            }
        } else {
            message = "Search string is empty!";
        }
        String from = "search";
        request.setAttribute("Heading", Heading);
        request.setAttribute("SetClasses", setSubClassification);
        request.getSession().setAttribute("from", from);
        request.setAttribute("Message", message);
        request.getRequestDispatcher("/searchAllSubClassifications.jsp").forward(request, response);
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

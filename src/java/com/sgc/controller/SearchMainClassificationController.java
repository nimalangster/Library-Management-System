/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgc.controller;

import com.sgc.data.BookDAO;
import com.sgc.data.MainClassDAO;
import com.sgc.model.MainClassification;
import com.sgc.data.SubClassDAO;
import com.sgc.model.Book;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.Iterator;
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
@WebServlet(name = "SearchMainClassificationController", urlPatterns = {"/SearchMainClassificationController"})
public class SearchMainClassificationController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    MainClassification mainClassification = new MainClassification();    
    MainClassDAO mainClassDao = new MainClassDAO();
    
    
    Object[] getBookIntoRowData(Book book){
        
        Object rowData[] = new Object[10];
                
        rowData[0] = book.getBookId();
        rowData[1] = book.getIsbnNo();
        rowData[2] = book.getTitle();
        rowData[3] = book.getAuthor();
        rowData[4] = book.getPublisher();
        rowData[5] = book.getNoOfPages();
        rowData[6] = book.getMainClassification();
        rowData[7] = book.getSubClassification();
        rowData[8] = book.getYearOfPublishing();
        rowData[9] = book.getLastPrintedYear();
                    
        return rowData;
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet viewBook</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet viewBook at " + request.getContextPath() + "</h1>");
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
            Heading = "Select Classification to Edit";
        } else if ("delete".equals(s2)) {
            Heading = "Select Classification to Delete";
        } else if ("search".equals(s2)){
            Heading = "Search All Main Classification";
        }else if ("ViewAll".equals(s2)){
            Heading = "View All Main Classifications";
        }else if ("Deleted".equals(s2)){
            Heading = "The selected Main Classification is successfully deleted!";
        }else if ("Edited".equals(s2)){
            Heading = "The selected Main Classification is successfully updated!";
        }else if ("Constraint".equals(s2)){
            Heading = "The selected Main Classification cannot be deleted associated books are available!";
        }
        
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
                RecordCount = "No records found!";
            } else {
                RecordCount = "(" + i + ") Record(s) found!";
            }
        
        request.setAttribute("Message", RecordCount);
        request.setAttribute("Heading", Heading);
        request.setAttribute("SetClasses", setMainClassification);         
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

        String Heading = "Search Main Classification";
        String message = "";
        String s = request.getParameter("FilterBy");
        Set<MainClassification> setMainClassification = new HashSet();
        int i = setMainClassification.size();
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
                        MainClassification mainClass = mainClassDao.getMainClassById(classId);
                        if (!mainClass.equals(null)) 
                            setMainClassification.add(mainClass);
                    } catch (Exception e) {
                        System.out.println(e.getMessage());
                    }
                }
            }

            if ("ByName".equals(s)) {

                String className = "";

                className = request.getParameter("SearchString");

                try {
                    MainClassDAO maindao = new MainClassDAO();
                    setMainClassification = maindao.getMainClassesByName(className);

                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }

            }

            i = setMainClassification.size();
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
        request.setAttribute("SetClasses", setMainClassification);
        request.getSession().setAttribute("from", from);
        request.setAttribute("Message", message);
        request.getRequestDispatcher("/searchAllMainClassifications.jsp").forward(request, response);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgc.controller;

import com.sgc.data.BookDAO;
import com.sgc.data.MainClassDAO;
import com.sgc.data.SubClassDAO;
import com.sgc.model.Book;
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
@WebServlet(name = "ViewBookController", urlPatterns = {"/ViewBookController"})
public class ViewBookController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    BookDAO bookDao = new BookDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ViewBookController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewBookController at " + request.getContextPath() + "</h1>");
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

            int bookId = Integer.parseInt(request.getParameter("bookId"));
            String mode = request.getParameter("mode");
            Book book = new Book();
            bookDao = new BookDAO();
            book = bookDao.getBookById(bookId);                  

            MainClassDAO mainClassDao = new MainClassDAO();
            Set setMainClass = mainClassDao.getAllMainClasses();

            SubClassDAO subClassDao = new SubClassDAO();
            Set setSubClass = subClassDao.getAllSubClasses();
            
            request.setAttribute("book", book);
            request.setAttribute("SetMainClass", setMainClass);
            request.setAttribute("SetSubClass", setSubClass);
            
            if(!"".equals(mode))
            request.setAttribute("mode", mode);
            
             if("delete".equals(request.getParameter("mode"))){
                request.getRequestDispatcher("/viewBook.jsp?mode=delete").forward(request, response);
             }
            else{
                request.getRequestDispatcher("/viewBook.jsp").forward(request, response);
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

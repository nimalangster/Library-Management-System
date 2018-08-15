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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "AddBookController", urlPatterns = {"/AddBookController"})


public class AddBookController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    Book book = new Book();
    BookDAO bookDao = new BookDAO();
    
    MainClassDAO mainClassDao = new MainClassDAO();
    SubClassDAO subClassDAO = new SubClassDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException , IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddBookController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddBookController at " + request.getContextPath() + "</h1>");
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
           
            Set mainClasses = mainClassDao.getAllMainClasses(); 
            request.setAttribute("SetMainClass", mainClasses);   
            Set subClasses = subClassDAO.getAllSubClasses();
            request.setAttribute("SetSubClass", subClasses); 
            
            request.getRequestDispatcher("/addBook.jsp").forward(request, response);
        
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
        
        String message = "";
        
        book.setBookId(Integer.parseInt(request.getParameter("BookId")));        
        book.setTitle(request.getParameter("Title"));
        book.setAuthor(request.getParameter("Author"));  
        book.setIsbnNo(request.getParameter("IsbnNo"));
        
        String x = request.getParameter("NoOfPages");        
        if(!"".equals(x)){
            book.setNoOfPages(Integer.parseInt(request.getParameter("NoOfPages")));
        }else{
            book.setNoOfPages(Integer.parseInt("0"));
        }
        book.setPublisher(request.getParameter("Publisher"));        
        
        book.setMainClassification(Integer.parseInt(request.getParameter("category")));          
       
        book.setSubClassification(Integer.parseInt(request.getParameter("subCategory")));        
        
        book.setYearOfPublishing(Integer.parseInt(request.getParameter("YearOfPublishing")));         
                
        book.setLastPrintedYear(Integer.parseInt(request.getParameter("LastPrintedYear")));  
        
        
        try {
                bookDao.insertBook(book);
                message = "The book is successfully added!";
            } catch (SQLException ex) {
                if (ex.getErrorCode() == 1062) {
                    message = "Book Id can't be duplicated. Book Id already exists! ";
                    request.setAttribute("Message", message);
                    doGet(request, response);
                    request.getRequestDispatcher("ViewAllBooksController?Message="+message).forward(request, response);
                }
                
                Logger.getLogger(AddBookController.class.getName()).log(Level.SEVERE, null, ex);
                request.setAttribute("Message", ex.getMessage());
                doGet(request, response);
                //request.getRequestDispatcher("ViewAllBooksController?Message="+message).forward(request, response);
                //request.getRequestDispatcher("AddBookController?Message="+message).forward(request, response);
            }   
        
        request.getRequestDispatcher("ViewAllBooksController?Message="+message).forward(request, response);
        
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

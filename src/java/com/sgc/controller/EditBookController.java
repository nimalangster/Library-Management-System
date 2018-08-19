/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgc.controller;

import com.sgc.data.BookDAO;
import com.sgc.model.Book;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ex1
 */
@WebServlet(name = "EditBookController", urlPatterns = {"/EditBookController"})
public class EditBookController extends HttpServlet {

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
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditBookController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditBookController at " + request.getContextPath() + "</h1>");
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
        
        
        book.setBookId(Integer.parseInt(request.getParameter("BookId")));        
        book.setTitle(request.getParameter("Title"));
        book.setAuthor(request.getParameter("Author"));  
        book.setIsbnNo(request.getParameter("IsbnNo"));
        if(request.getParameter("NoOfPages")!="")
        book.setNoOfPages(Integer.parseInt(request.getParameter("NoOfPages")));
        book.setPublisher(request.getParameter("Publisher"));        
        book.setMainClassification(Integer.parseInt(request.getParameter("category")));
        book.setSubClassification(Integer.parseInt(request.getParameter("subCategory")));
         String x = request.getParameter("LastPrintedYear"); 
        if(x != null){   
        book.setYearOfPublishing(Integer.parseInt(request.getParameter("YearOfPublishing")));
        }
         String z = request.getParameter("LastPrintedYear"); 
        if(z != null){   
        book.setLastPrintedYear(Integer.parseInt(request.getParameter("LastPrintedYear")));      
        }
        try{
            
            boolean success = bookDao.updateBook(book);
            if (success)
            {   
                String message = "The selected book is successfully updated!";
                request.getRequestDispatcher("/ViewAllBooksController?Message="+message).forward(request, response);                
            }
        }catch(Exception ex){
                   System.out.println(ex);
        }
        
        processRequest(request, response);
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

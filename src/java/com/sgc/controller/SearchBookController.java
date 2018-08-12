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
@WebServlet(name = "SearchBookController", urlPatterns = {"/SearchBookController"})
public class SearchBookController extends HttpServlet {

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
        String s = request.getParameter("FilterBy");
        Set <Book> setBook = new HashSet();
        
        if("ById".equals(s)) {
            
            int bookId = 0;
            try{
             bookId = Integer.parseInt(request.getParameter("SearchString"));       
             } catch (NumberFormatException e) {
                message = "Id must be integer value!";
             }
            try{
                BookDAO dao = new BookDAO();
                Book book = dao.getBookById(bookId);    
                int id = book.getBookId();
                setBook.add(book);                               
                } catch(Exception e){
                       System.out.println(e.getMessage()) ;
            }  
            
        }
        
        if("ByName".equals(s)) {
            
            String bookName = "";
            
             bookName = request.getParameter("SearchString");       
            
            try{
                BookDAO dao = new BookDAO();
                setBook = dao.getBookByTitle(bookName);           
                                    
                } catch(Exception e){
                       System.out.println(e.getMessage()) ;
            }  
            
        }
        
         if("Author".equals(s)) {
            
            String bookAuthor = "";
            
             bookAuthor = request.getParameter("SearchString");       
            
            try{
                BookDAO dao = new BookDAO();
                setBook = dao.getBookByAuthor(bookAuthor);           
                                    
                } catch(Exception e){
                       System.out.println(e.getMessage()) ;
            }  
            
        }          
            
            request.setAttribute("SetBooks", setBook); 
            request.setAttribute("Message", request.getParameter("Message"));
            request.getRequestDispatcher("/searchAllBooks.jsp").forward(request, response);      
        
       
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

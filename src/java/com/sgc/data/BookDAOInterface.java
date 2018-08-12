
package com.sgc.data;

import com.sgc.model.Book;
import java.sql.SQLException;
import java.util.Set;


public interface BookDAOInterface {
    
    Book getBookById(int id);
    Set<Book> getBookByTitle(String title);
    Set<Book> getBookByAuthor(String author);  
    Set <Book> getAllBooks();
    boolean insertBook(Book book) throws SQLException;
    boolean updateBook(Book book);
    boolean deleteBook(Book book);

}

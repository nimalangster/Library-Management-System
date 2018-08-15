package com.sgc.data;

import com.sgc.model.Book;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

public class BookDAO implements BookDAOInterface {

    private Book extractBookFromResultSet(ResultSet rs) throws SQLException {

        Book book = new Book();

        book.setBookId(rs.getInt("bookId"));
        book.setTitle(rs.getString("title"));
        book.setAuthor(rs.getString("author"));
        book.setPublisher(rs.getString("publisher"));
        book.setIsbnNo(rs.getString("isbnNo"));
        book.setMainClassification(rs.getInt("mainClassificationId"));
        book.setSubClassification(rs.getInt("subClassificationId"));
        book.setLastPrintedYear(rs.getInt("lastPrintedYear"));
        book.setNoOfPages(rs.getInt("noOfPages"));
        book.setYearOfPublishing(rs.getInt("yearOfPublishing"));
        book.setMainClassificationName(rs.getString("mainClassificationName"));
        book.setSubClassificationName(rs.getString("subClassificationName"));

        return book;
    }

    private Book extractBookFromResultSetView(ResultSet rs) throws SQLException {

        Book book = new Book();

        book.setBookId(rs.getInt("bookId"));
        book.setTitle(rs.getString("title"));
        book.setAuthor(rs.getString("author"));
        book.setPublisher(rs.getString("publisher"));
        book.setIsbnNo(rs.getString("isbnNo"));
        book.setMainClassification(rs.getInt("mainClassificationId"));
        book.setSubClassification(rs.getInt("subClassificationId"));
        book.setLastPrintedYear(rs.getInt("lastPrintedYear"));
        book.setNoOfPages(rs.getInt("noOfPages"));
        book.setYearOfPublishing(rs.getInt("yearOfPublishing"));

        return book;
    }

    //@Override
    public Book getBookById(int id) {

        int bookId = id;

        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pst = conn.prepareStatement("SELECT * FROM book b "
                    + "JOIN main_classification mc "
                    + "ON b.mainClassificationId = mc.mainClassificationId "
                    + "JOIN sub_classification sc "
                    + "ON b.subClassificationId = sc.subClassificationId "
                    + "WHERE b.bookId = " + bookId);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return extractBookFromResultSet(rs);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        finally{
            ConnectionFactory.disConnect();
        }
        
        return null;
    }

    public Set getBookByTitle(String title) {

        String bookTitle = title;

        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pst = conn.prepareStatement("SELECT * FROM book b "
                    + "JOIN main_classification mc "
                    + "ON b.mainClassificationId = mc.mainClassificationId "
                    + "JOIN sub_classification sc "
                    + "ON b.subClassificationId = sc.subClassificationId "
                    + "WHERE b.title LIKE '" + bookTitle + "%'");

            ResultSet rs = pst.executeQuery();
            Set books = new HashSet();
            while (rs.next()) {
                Book book = extractBookFromResultSet(rs);
                books.add(book);
            }
            return books;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        finally{
            ConnectionFactory.disConnect();
        }
        return null;
    }

    public Set getBookByAuthor(String author) {

        String bookAuthor = author;

        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pst = conn.prepareStatement("SELECT * FROM book b "
                    + "JOIN main_classification mc "
                    + "ON b.mainClassificationId = mc.mainClassificationId "
                    + "JOIN sub_classification sc "
                    + "ON b.subClassificationId = sc.subClassificationId "
                    + "WHERE b.author LIKE '" + bookAuthor + "%'");
            ResultSet rs = pst.executeQuery();
            Set books = new HashSet();
            while (rs.next()) {
                Book book = extractBookFromResultSet(rs);
                books.add(book);
            }
            return books;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        finally{
            ConnectionFactory.disConnect();
        }
        return null;
    }

    //@Override
    public Set getAllBooks() {

        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pst = conn.prepareStatement("SELECT * FROM book b JOIN main_classification mc ON b.mainClassificationId = mc.mainClassificationId JOIN sub_classification sc ON b.subClassificationId = sc.subClassificationId ORDER BY b.title");
            ResultSet rs = pst.executeQuery();
            Set books = new HashSet();
            while (rs.next()) {
                Book book = extractBookFromResultSet(rs);
                books.add(book);
            }
            return books;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        finally{
            ConnectionFactory.disConnect();
        }
        return null;
    }

    //@Override
    public boolean insertBook(Book book) throws SQLException {

        Connection conn = ConnectionFactory.getConnection();
        PreparedStatement pst = conn.prepareStatement("insert into book (bookId, isbnNo, title, author,"
                + " publisher, noofpages, mainClassificationId,subClassificationId, yearOfPublishing, lastPrintedYear ) values (?,?,?,?,?,?,?,?,?,?)");

        pst.setInt(1, book.getBookId());
        pst.setString(2, book.getIsbnNo());
        pst.setString(3, book.getTitle());
        pst.setString(4, book.getAuthor());
        pst.setString(5, book.getPublisher());
        pst.setInt(6,(int) book.getNoOfPages());
        pst.setInt(7, (int) book.getMainClassification());
        pst.setInt(8, (int) book.getSubClassification());
        pst.setInt(9, (int) book.getYearOfPublishing());
        pst.setInt(10, (int) book.getLastPrintedYear());

        int i = pst.executeUpdate();
        System.out.println();
        if (i == 1) {
            return true;
        }

        return false;
    }

    //@Override
    public boolean updateBook(Book book) {
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pst = conn.prepareStatement("update book SET isbnNo = ?, title = ?, author = ?,"
                    + " publisher = ?, noOfPages = ?, mainClassificationId = ?,subClassificationId = ?, yearOfPublishing = ?, lastPrintedYear = ? WHERE bookId = ?");

            pst.setString(1, book.getIsbnNo());
            pst.setString(2, book.getTitle());
            pst.setString(3, book.getAuthor());
            pst.setString(4, book.getPublisher());
            pst.setInt(5, book.getNoOfPages());
            pst.setInt(6, book.getMainClassification());
            pst.setInt(7, book.getSubClassification());
            pst.setInt(8, (int) book.getYearOfPublishing());
            pst.setInt(9, (int) book.getLastPrintedYear());
            pst.setInt(10, book.getBookId());

            int i = pst.executeUpdate();
            if (i == 1) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        finally{
            ConnectionFactory.disConnect();
        }
        return false;
    }

    //@Override
    public boolean deleteBook(Book book) {
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pst = conn.prepareStatement("DELETE from Book WHERE bookId = ?");

            pst.setInt(1, book.getBookId());

            int i = pst.executeUpdate();
            if (i == 1) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        finally{
            ConnectionFactory.disConnect();
        }
        return false;
    }

    public boolean deleteBookById(int bookId) {
        try {
            Connection conn = ConnectionFactory.getConnection();
            PreparedStatement pst = conn.prepareStatement("DELETE from Book WHERE bookId = ?");

            pst.setInt(1, bookId);

            int i = pst.executeUpdate();
            if (i == 1) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        finally{
            ConnectionFactory.disConnect();
        }
        return false;
    }

}

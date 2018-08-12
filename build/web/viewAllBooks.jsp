<%-- 
    Document   : Success
    Created on : Jul 29, 2018, 11:11:43 AM
    Author     : ex1
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View All Books</title>
        <link rel="stylesheet" href ="Contents/CSS/Menu.css">
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    </head>
    <body>
        
    <%@include file = "Shared/header.jsp" %> 
    
    <div class="page-header" align = "center"><h3>View All Books</h3></div>
    
    <h4>    <div class="container col-md-10 col-md-offset-1" align = "center" style="padding-bottom:5px;"> ${Message} </div> </h4>
        
    <div class="container col-md-10 col-md-offset-1" style="padding-bottom:50px;">

        <table class="table table-striped" >
            <tr>
                <th>Book ID</th>
                <th>Title</th>
                <th>Author</th>
                <th>Publisher</th>
                <th>ISBN</th>
                <th>No Of Pages</th>
                <th>Main Classification</th>
                <th>Sub Classification</th>
                <th>Year Of Publishing</th>
                <th>Last printed Year</th>
                <th> </th>
                
            </tr>
            <c:forEach items="${SetBooks}" var="book">
                <tr>
                    <td>
                        ${book.getBookId()}
                    </td>
                    <td>
                        ${book.getTitle()}
                    </td>
                    <td>
                        ${book.getAuthor()}
                    </td>
                    <td>
                        ${book.getPublisher()}
                    </td>
                    <td>
                        ${book.getIsbnNo()}
                    </td>
                    <td>
                        ${book.getNoOfPages()}
                    </td>
                    <td>
                        ${book.getMainClassificationName()}
                    </td>
                    <td>
                        ${book.getSubClassificationName()}
                    </td>
                    <td>
                        ${book.getYearOfPublishing()}
                    </td>
                    <td>
                        ${book.getLastPrintedYear()}
                    </td>
                    <td>
                        <a href="ViewBookController?bookId=${book.getBookId()}"> View || <a/> 
                        <a href = "ViewBookController?bookId=${book.getBookId()}">  Edit || <a/>
                        <a href = "DeleteBookController?bookId=${book.getBookId()}"> Delete  <a/>
                    </td>
                </tr>
            </c:forEach>
        </table>
        
        <div align ="right">
            <a href="AddBookController?"><button class="btn btn-primary dropdown-toggle" type="button" id="AddBook" align="right"> Add Book </button></a>
            <a href="Home.jsp"><button  type = "button" class="btn btn-primary dropdown-toggle" name = "Home"  value="Home"> Home </button></a>
        </div>
        
        </div>
    </body>
</html>

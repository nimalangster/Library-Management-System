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

        <script type="text/javascript">

        function confirmDelete() {

        if (!confirm("Are you sure do you want to delete?")) {
           return false;
        } 
        }
        
        function fillNOP()
        { alert();
//            if(nop == 0)
//                this.value = "--";
//            else
//                this.value = nop;            
        }
        
        
        
        </script>

    </head>
    <body style = "zoom:80%">
        
    <%@include file = "Shared/header.jsp" %> 
    
    <div class="page-header" align = "center"><h3>View All Books</h3></div>
    
    <h4>    <div class="container col-md-10 col-md-offset-1" align = "center" style="padding-bottom:25px;"> ${Message} </div> </h4>
        
    <div class="container col-md-10 col-md-offset-1" style="padding-bottom:150px;">

        <table class="table table-striped" >
            <thead style="background-color: #357ab7; color: #fff">
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
            </thead>
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
                        <c:set var="nop" scope="session" value="${book.getNoOfPages()}"/>  
                        <c:out value="${nop == 0  ? '---': nop }"/>                          
                    </td>
                    <td>
                        ${book.getMainClassificationName()}
                    </td>
                    <td>
                        ${book.getSubClassificationName()}
                    </td>
                    <td>                        
                        <c:set var="yop" scope="session" value="${book.getYearOfPublishing()}"/>  
                        <c:out value="${yop == 0  ? '---': yop }"/>                        
                    </td>
                    <td>                        
                        <c:set var="lpy" scope="session" value="${book.getLastPrintedYear()}"/>  
                        <c:out value="${lpy == 0  ? '---': lpy }"/>                        
                    </td>
                    <td>
                        <a href="ViewBookController?bookId=${book.getBookId()}&mode=view"> View || <a/> 
                        <a href = "ViewBookController?bookId=${book.getBookId()}&mode=edit">  Edit || <a/>
                        <a href = "ViewBookController?bookId=${book.getBookId()}&mode=delete"  > Delete  <a/>
                    </td>
                </tr>
            </c:forEach>
        </table>
        
        <div align ="right">
            <a href="AddBookController?"><button class="btn btn-primary dropdown-toggle" type="button" id="AddBook" align="right" style = "min-width: 200px;"> Add Book </button></a>
            <a href="Home.jsp"><button  type = "button" class="btn btn-primary dropdown-toggle" name = "Home"  value="Home" style = "min-width: 200px;"> Cancel </button></a>
        </div>
        
        </div>
    </body>
</html>

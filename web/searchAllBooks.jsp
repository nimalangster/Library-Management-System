<%-- 
    Document   : Search All Books
    Created on : Jul 29, 2018, 11:11:43 AM
    Author     : ex1
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search All Books</title>
        <link rel="stylesheet" href ="Contents/CSS/Menu.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    </head>
    <body>
        <%@include file = "Shared/header.jsp" %>    

        <div class="container" align = "Center" style = "padding-bottom: 15px">
        <div class="container" align = "Center" style="padding-bottom: 20px; padding-top: 0px;"><h3><label class="label label-primary" name = "heading"style="width: 400px; display: inline-block;"> ${Heading} </label></h3></div>
        </div>  

        <div class="col-md-10 col-md-offset-1" class = "container" align="center" style = "padding-bottom:50px;">
                <form name="Search" action="SearchBookController" method="post"> 
                   <h4> 
                    <div class="col-md-2" align = "Left">
                    Enter Search String: 
                    </div>
                    
                    <div class="col-md-2" align = "Left">
                    <input class="form-control" type="text" name="SearchString"/> 
                    </div>
                    
                    <div class="col-md-2" align = "Center">
                    Filter By:
                    </div>
                    
                    <div class="col-md-2" align = "Left">
                    <select name ="FilterBy" id="FilterBy" class="form-control">
                        <option value="ById" >By Book ID</option>
                        <option value="ByName"> By Book Name</option>
                        <option value="Author"> By Book Author</option>
                    </select>
                    </div>
                    
                    <div class="col-md-2" align = "right">
                        <Input class="btn btn-primary dropdown-toggle" type="submit" id="SearchBook" align="right" style = "min-width: 200px;"> </input>
                    </div>
                    
                    <div class="col-md-2" align = "right">
                        <a href="SearchBookController?mode=ViewAll" > <button type = "button" class="btn btn-primary dropdown-toggle" style = "min-width: 200px;" align="right"> View All</button> </a>
                    </div>
                   </h4>
                </form>
            </div></h4>
            
        <div class="container" align ="center" > <h4> <label>${Message}</label> </h4></div>

        <div class="container col-md-10 col-md-offset-1" style="padding-bottom:150px;">          
            <table class="table table-striped" class="form-control">
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
            <!--<a href="addBook.jsp"><button class="btn btn-info" type="button" id="AddBook" align="right"> Add Book </button></a>-->
            <a href="Home.jsp"><button  type = "button" class="btn btn-primary dropdown-toggle" name = "Home"  value="Home" class="form-control" style = "min-width: 200px;"> Home </button></a>
        </div>
    </div>
</body>
</html>

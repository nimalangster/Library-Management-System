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
        
        <div class="page-header" align = "center"><h3>View All Main Classifications</h3></div>
        <h3> ${Message} </h3>
        
        <div class="container col-md-10 col-md-offset-1" style="padding-bottom:150px;">
        
        <table class="table table-striped" >
            <thead style="background-color: #357ab7; color: #fff">
            <tr>
                <th>Main Classification ID</th>
                <th>Main Classification Name</th> 
                <th></th>
            </tr>
            </thead>
            <c:forEach items="${SetMainClassifications}" var="mainClassification">
                <tr>
                    <td>
                        ${mainClassification.getId()}
                    </td>
                    <td>
                        ${mainClassification.getName()}
                    </td>                 
                    
                    <td>
                        <a href="ViewMainClassificationController?classId=${mainClassification.getId()}"> View || <a/> 
                        <a href = "ViewMainClassificationController?classId=${mainClassification.getId()}">  Edit || <a/>
                        <a href = "DeleteMainClassificationController?classId=${mainClassification.getId()}"> Delete  <a/>
                    </td>
                </tr>
            </c:forEach>
        </table>
        
        <div align ="right">
        <a href="addMainClassification.jsp"><button class="btn btn-primary dropdown-toggle" type="button" id="AddBook" align="right" style = "min-width: 200px;"> Add Main Classification </button></a>
        <a href="Home.jsp"><button  type = "button" class="btn btn-primary dropdown-toggle" name = "Home"  value="Home" style = "min-width: 200px;"> Home </button></a>
        </div>
        </div>
    </body>
</html>

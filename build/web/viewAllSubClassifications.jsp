<%-- 
    Document   : ViewAllSubClassifications
    Created on : Aug 8, 2018, 1:04:35 PM
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


        <div class="page-header" align = "center"><h3>View All Sub Classifications</h3></div>
        <h3>  ${Message} </h3>
        
        <div class="container col-md-10 col-md-offset-1" style="padding-bottom:50px;">

        <table class="table table-striped" >
            <tr>
                <th>Sub Classification ID</th>
                <th>Sub Classification Name</th>     
                <th>Main Classification Name</th>  
                <th></th>
            </tr>
            <c:forEach items="${SetSubClassifications}" var="subClassification">
                <tr>
                    <td>
                        ${subClassification.getSubClassId()}
                    </td>
                    <td>
                        ${subClassification.getSubClassName()}
                    </td>      
                    <td>
                        ${subClassification.getMainClassName()}
                    </td>
                    
                    <td>
                        <a href= "ViewSubClassificationController?classId=${subClassification.getSubClassId()}"> View || <a/> 
                        <a href = "ViewSubClassificationController?classId=${subClassification.getSubClassId()}">  Edit || <a/>
                        <a href = "DeleteSubClassificationController?classId=${subClassification.getSubClassId()}"> Delete  <a/>
                    </td>
                </tr>
            </c:forEach>
        </table>
        
        <div align ="right">
        <a href="addSubClassification.jsp"><button class="btn btn-primary dropdown-toggle" type="button" id="AddBook" align="right"> Add Sub Classification </button></a>
        <a href="Home.jsp"><button  type = "button" class="btn btn-primary dropdown-toggle" name = "Home"  value="Home"> Home </button></a>
        </div>
        </div>
    </body>
</html>

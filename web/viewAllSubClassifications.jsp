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
         <script type="text/javascript">

        function confirmDelete() {

        if (!confirm("Are you sure do you want to delete?")) {
           return false;
        } 
        }
        </script>
    </head>
    <body style = "zoom:80%">
                 <%@include file = "Shared/header.jsp" %>    


        <div class="page-header" align = "center"><h3>View All Sub Classifications</h3></div>
        <h3>  ${Message} </h3>
        
        <div class="container col-md-10 col-md-offset-1" style="padding-bottom:150px;">

        <table class="table table-striped" >
            <thead style="background-color: #357ab7; color: #fff">
            <tr>
                <th>Sub Classification ID</th>
                <th>Sub Classification Name</th>     
                <th>Main Classification Name</th>  
                <th></th>
            </tr>
            </thead>
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
                        <a href= "ViewSubClassificationController?classId=${subClassification.getSubClassId()}&mode=view"> View || <a/> 
                        <a href = "ViewSubClassificationController?classId=${subClassification.getSubClassId()}&mode=edit">  Edit || <a/>
                        <a href = "ViewSubClassificationController?mode=ToDelete&classId=${subClassification.getSubClassId()}"> Delete  <a/>
                    </td>
                </tr>
            </c:forEach>
        </table>
        
        <div align ="right">
        <a href="addSubClassification.jsp"><button class="btn btn-primary dropdown-toggle" type="button" id="AddBook" align="right" style = "min-width: 200px;"> Add Sub Classification </button></a>
        <a href="Home.jsp"><button  type = "button" class="btn btn-primary dropdown-toggle" name = "Home"  value="Home" style = "min-width: 200px;"> Cancel </button></a>
        </div>
        </div>
    </body>
</html>

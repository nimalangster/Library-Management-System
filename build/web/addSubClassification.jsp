<%-- 
    Document   : addSubClassification
    Created on : Aug 10, 2018, 10:52:58 AM
    Author     : ex1
--%>

<%@page import="java.time.Year"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Set"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Add Sub Classification</title>
        <link rel="stylesheet" href ="Contents/CSS/Menu.css">


        <!--<link rel="stylesheet" href="Contents/bootstrap-4.1.3-dist/css/bootstrap.min.css" />-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <%@page import="com.sgc.data.BookDAO,com.sgc.model.Book,com.sgc.data.MainClassDAO,com.sgc.data.SubClassDAO"%>  
               
         
    </head>
    <body >
        <%@include file = "Shared/header.jsp" %>   
        
         
            <div class="container" align = "Center"><h3> <label class="label label-primary" name = "heading"> Add Sub Classification </label></h3></div>             
            
            
        <div class="container" padding-bottom = "50px">  
           
                <form action ="AddSubClassificationController" method="post" id = "addForm">  
            
            
                <table class="table table-striped">
                    <tr> 
                        <td> Sub Classification Id :</td> 
                        <td> <label  class="form-control" for="Id" name = "ClassId">  </label>
                        </td>
                    </tr>

                    <tr> 
                        <td> Sub Classification Name:</td> 
                        <td> <input  class="form-control" type="text" name = "subClassName" value = "" > </td>
                    </tr>       
                    
                    <tr> 
                        <td> Main Classification Name:</td> 
                        <td>
                        <select id="category"  name="category" class="form-control" >
                                <c:forEach items="${setMainClass}" var="category">
                                    <option value="${category.getId()}">${category.getName()}</option>
                                </c:forEach>
                        </select>
                        </td>
                    </tr>        

                </table>
                  <div align = "right">
                      
                    <input type = "submit" class="btn btn-primary dropdown-toggle" name = "Add"  value="Add" style = "min-width: 200px;"/>                    
                    
                    <a href="Home.jsp"><button  type = "button" class="btn btn-primary dropdown-toggle" name = "Home"  value="Home" style = "min-width: 200px;"> Main Menu </button></a>
                    <a href="SearchSubClassificationController?from=ViewAll&mode=ViewAll"><button  type = "button" class="btn btn-primary dropdown-toggle" name = "Back"  value="Back" style = "min-width: 200px;"> Back</button></a>
                </div>
            </form>        
        </div>
                 
    </body>
    
</html>


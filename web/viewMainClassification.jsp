<%-- 
    Document   : viewMainClassification
    Created on : Aug 4, 2018, 3:59:58 PM
    Author     : ex1
--%>

<%-- 
    Document   : viewBook
    Created on : Jul 29, 2018, 9:47:49 AM
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
        <title>JSP Page</title>
        <link rel="stylesheet" href ="Contents/CSS/Menu.css">


        <!--<link rel="stylesheet" href="Contents/bootstrap-4.1.3-dist/css/bootstrap.min.css" />-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script type="text/javascript">
            <%@page import="com.sgc.data.BookDAO,com.sgc.model.Book,com.sgc.data.MainClassDAO,com.sgc.data.SubClassDAO"%>           
        </script>
    </head>
    <body>
        <%@include file = "Shared/header.jsp" %>    

         <div class="page-header" align = "center"><h3> <label class="label label-primary" class="page-header" name = "heading"> View Main Classification </label></h3></div>      
        
        <div class="container" padding-bottom = "150px"> 
            <form action ="EditMainClassificationController" method="get" id = "viewForm">
                <table class="table table-striped">
                    <tr> 
                        <td> Main Classification Id :</td> 
                        <td> <label  class="form-control" for="Id" name = "ClassId"> ${mainClass.getId()} </label>
                        </td>
                    </tr>

                    <tr> 
                        <td> Main Classification Name:</td> 
                        <td> <input  class="form-control" type="text" name = "ClassName" value = "${mainClass.getName()}" > </td>
                    </tr>
                </table>
                  <input type="hidden" name = "ClassId" value="${mainClass.getId()}">
                  <div align = "right">
                    <input type = "submit" class="btn btn-primary dropdown-toggle" name = "Save"  value="Save" style = "min-width: 200px;"/>
                    <a href="Home.jsp"><button  type = "button" class="btn btn-primary dropdown-toggle" name = "Home"  value="Home" style = "min-width: 200px;"> Main Menu </button></a>
                    <a href="SearchMainClassificationController?from=ViewAll&mode=ViewAll"><button  type = "button" class="btn btn-primary dropdown-toggle" name = "Back"  value="Back" style = "min-width: 200px;"> Back</button></a>
                </div>
            </form>        
        </div>

    </body>
</html>

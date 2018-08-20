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
                
                function formValidation(){

                 var x = $('#ClassName').val();
                 var errorMessage;
                 if(!x){
                     errorMessage = "Main Classification Name can't be empty!";
                     $('#errorMessage').text(errorMessage);
                     return false;
                    }
                 }                
                 $(document).ready(function () {
               
                    <%                
                        String mode = request.getParameter("mode");
                    %>
                }  
                
                function disableForm(){
                $("#ClassName", "#ViewForm").prop('disabled',true);
                
                }   
                
        </script>
    </head>
    <% if (("view".equals(mode))) {%>
            <body onload="disableForm();" >
    <% } else {%>
            <body> <% } %> 
        
        <%@include file = "Shared/header.jsp" %>    

        <% if ("view".equals(mode)) {%>
            <div class="container" align = "Center" style="padding-bottom: 50px"><h3> <label class="label label-primary" class="page-header" name = "heading"> View Main Classification</label></h3></div>          
        <%} else {%>
            <div class="container" align = "Center" style="padding-bottom: 50px"><h3> <label class="label label-primary" class="page-header" name = "heading"> Edit Main Classification</label></h3></div>          
        <% } %>    
        <div class="container" padding-bottom = "150px"> 
            <form action ="EditMainClassificationController" method="get" id = "viewForm" onsubmit="formValidation()">
                <table class="table table-striped">
                    <tr> 
                        <td> Main Classification Id :</td> 
                        <td> <label  class="form-control" for="Id" name = "ClassId"> ${mainClass.getId()} </label>
                        </td>
                    </tr>

                    <tr> 
                        <td> Main Classification Name:</td> 
                        <td> <input  class="form-control" type="text" name = "ClassName" id ="ClassName"  value = "${mainClass.getName()} " required> </td>
                    </tr>
                    
                     <tr> 
                        <td> Associated Sub Classifications:</td> 
                        <td><table class="table table-striped" >
                            <thead style="">
                                <tr>
                                    <th>Sub Classification ID</th>
                                    <th>Sub Classification Name</th>                   
                                </tr>
                            </thead>
                            <c:forEach items="${SetSubClasses}" var="subClassification">
                                <tr>
                                    <td>
                                        ${subClassification.getSubClassId()}
                                    </td>
                                    <td>
                                        ${subClassification.getSubClassName()}
                                    </td>      

                                </tr>
                            </c:forEach>
                        </table> </td>
                    </tr>
                </table>
                    
                        
                    
                    
                  <input type="hidden" name = "ClassId" value="${mainClass.getId()}">
                  <div align = "right" style="padding-top: 20px; padding-bottom: 20px">
                     <% if ("edit".equals(mode)) {%>  
                        <a href="AddSubClassificationController?mainClassId=${mainClass.getId()}&pageFrom=mainClass" >
                        <button  type = "button" class="btn btn-primary dropdown-toggle" name = "Home"  value="Home" style = "min-width: 200px;"> Add Sub Classification </button></a>   
                     <% } %>    
                </div>      
                  <div align = "right">
                      <% if ("edit".equals(mode)) {%>  
                    <input type = "submit" class="btn btn-primary dropdown-toggle" name = "Save"  value="Save" style = "min-width: 200px;"/>
                    <% } %> 
                   
                    <a href="SearchMainClassificationController?from=ViewAll&mode=ViewAll"><button  type = "button" class="btn btn-primary dropdown-toggle" name = "Back"  value="Back" style = "min-width: 200px;"> Back</button></a>
                </div>
            </form>        
        </div>

    </body>
</html>

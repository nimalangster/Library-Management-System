<%-- 
    Document   : viewSubClassification
    Created on : Aug 8, 2018, 6:30:46 PM
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
        <%@page import="com.sgc.data.BookDAO,com.sgc.model.Book,com.sgc.data.MainClassDAO,com.sgc.data.SubClassDAO"%>  
               
        <script type="text/javascript">
                           
         $(document).ready(function () {
            <%
                String mainClass =  request.getAttribute("MainClass").toString(); 
                String mode = request.getParameter("mode");
            %>
                   $("#category").val(${subClass.getMainClassId()});
//                    var s = "<%=mainClass%>";
//                    //alert(s);
//                    $("#category").val(<%=request.getAttribute("MainClass").toString()%>);
//                
            });
            
            
             function formValidation(){
               
                var x = $('#subClassName').val();
                var y = $('#category').val();
                var errorMessage;
                if(!x){
                    errorMessage = "Sub Classification Name can't be empty!";
                    $('#errorMessage').text(errorMessage);
                    return false;
                }else{
                if(!y){
                    errorMessage = "Main Classification is required!";
                    $('#errorMessage').text(errorMessage);
                    return false;
                    }
                }                
            }
            
            
             function disableForm(){
                $("#ClassName", "#viewForm").prop('disabled',true);
                $("#category", "#viewForm").prop('disabled',true);
                }   
         </script>    
    </head>
     <% if (("view".equals(mode))|| ("ConfirmDelete".equals(mode))) {%>
            <body onload="disableForm();" >
    <% } else {%>
            <body> <% } %> 
        <%@include file = "Shared/header.jsp" %>   
        
         <% if ("ConfirmDelete".equals(mode)) {%>
            <div class="container" align = "Center"><h3> <label class="label label-primary" class="page-header" name = "heading"> Delete Sub Classification </label></h3></div>             
            <div class="container" align = "Center" ><h4><label  id = "errorMessage"  style = "color: red" style="width: 400px; display: inline-block;"> Are you sure you want to delete this sub classification? </label></h4></div>

            <%}else if("view".equals(mode))  {%>
            <div class="container" align = "Center"><h3> <label class="label label-primary" class="page-header" name = "heading"> View Sub Classification </label></h3></div>        
            <%} else {%>
            <div class="container" align = "Center"><h3> <label class="label label-primary" class="page-header" name = "heading"> Edit Sub Classification </label></h3></div> 
            <% } %>
            
        <div class="container" padding-bottom = "150px">  
            
            <% if ("ConfirmDelete".equals(mode)) {%>
                <form action ="DeleteSubClassificationController" method="get" id = "viewForm">
            <%}else{%>
            <form action ="EditSubClassificationController" method="get" id = "viewForm" onsubmit="formValidation()">  
            <%}%>
            
                <table class="table table-striped">
                    <tr> 
                        <td> Sub Classification Id :</td> 
                        <td> <label  class="form-control" for="Id" name = "ClassId"> ${subClass.getSubClassId()} </label>
                        </td>
                    </tr>

                    <tr> 
                        <td> Sub Classification Name:</td> 
                        <td> <input  class="form-control" type="text" name = "ClassName" id ="ClassName" value = "${subClass.getSubClassName()}" required> </td>
                    </tr>       
                    
                    <tr> 
                        <td> Main Classification Name:</td> 
                        <td>
                        <select id="category"  name="category" class="form-control" required>

                                <c:forEach items="${setMainClass}" var="category">
                                    <option value="${category.getId()}">${category.getName()}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>        

                </table>
                    <input type="hidden" name = "classId" value="${subClass.getSubClassId()}">
                  <div align = "right">
                      <% if ("ConfirmDelete".equals(mode)) {%>
                    <input type = "submit" class="btn btn-primary dropdown-toggle" name = "Delete"  value="Delete" style = "min-width: 200px;"/>
                    <% }else if("edit".equals(mode))  {%>
                    <input type = "submit" class="btn btn-primary dropdown-toggle" name = "Update"  value="Update" style = "min-width: 200px;"/>
                    <% }%>                   
                    <a href="SearchSubClassificationController?from=ViewAll&mode=ViewAll"><button  type = "button" class="btn btn-primary dropdown-toggle" name = "Back"  value="Back" style = "min-width: 200px;"> Cancel</button></a>
                </div>
            </form>        
        </div>
                 
    </body>
    
</html>

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
        <script type="text/javascript">
            
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
            
             $(document).ready(function () {
                if (${MainClassId}){
                    $("#category").val(${MainClassId});  
                    $('#category').prop('disabled', true);
                }
            });
            
        </script>
               
         
        
    </head>
    <body >
        <%@include file = "Shared/header.jsp" %>   
        
         
        <div class="container" align = "Center" style="padding-bottom: 20px; padding-top: 0px;"><h3> <label class="label label-primary" name = "heading" style="width: 400px; display: inline-block;"> Add Sub Classification </label></h3></div>             
            
        <div  class = "col-md-10 col-md-offset-1" align = "center"><h4><span  id = "errorMessage" style = "color: red"> </span></h4></div>
    
        <div class="container" padding-bottom = "50px">  
           
            <form action ="AddSubClassificationController" method="post" id = "addForm" onsubmit="return formValidation();">             
            
                <table class="table table-striped">
                    <tr> 
                        <td> Sub Classification Id :</td> 
                        <td> <label  class="form-control" for="Id" name = "ClassId"> Auto generated Id </label>
                        </td>
                    </tr>

                    <tr> 
                        <td> Sub Classification Name:</td> 
                        <td> <input  class="form-control" type="text" name = "subClassName" value = "" id="subClassName" required> </td>
                    </tr>       
                    
                    <tr> 
                        <td> Main Classification Name:</td> 
                        <td>
                        <select id="category"  name="category" class="form-control" required>
                                <option value=""> Select Main Classification </option> 
                                <c:forEach items="${setMainClass}" var="category">
                                    <option value="${category.getId()}">${category.getName()}</option>
                                </c:forEach>
                        </select>
                        </td>
                    </tr>   
                </table>
                  <div align = "right">
                      <input type="hidden" id="PageFrom" name = "PageFrom" value="${PageFrom}"/>
                      <input type="hidden" id="MainClassId" name = "MainClassId" value="${MainClassId}"/>
                    <input type = "submit" class="btn btn-primary dropdown-toggle" name = "Add"  value="Add" style = "min-width: 200px;"/>                    
                    
                    <a href="Home.jsp"><button  type = "button" class="btn btn-primary dropdown-toggle" name = "Home"  value="Home" style = "min-width: 200px;"> Main Menu </button></a>
                    <a href="SearchSubClassificationController?from=ViewAll&mode=ViewAll"><button  type = "button" class="btn btn-primary dropdown-toggle" name = "Back"  value="Back" style = "min-width: 200px;"> Back</button></a>
                </div>
            </form>        
        </div>
                 
    </body>
    
</html>


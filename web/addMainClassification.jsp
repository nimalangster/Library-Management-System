<%-- 
    Document   : addBook
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


        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script type="text/javascript">
        function formValidation(){

                 var x = $('#ClassName').val();
                 var errorMessage;
                 if(!x){
                     errorMessage = "Main Classification Name can't be empty!";
                     $('#errorMessage').text(errorMessage);
                     return false;
                    }
                 }                
                            
        </script>

    </head>
    <%@page import="com.sgc.data.BookDAO,com.sgc.model.Book,com.sgc.data.MainClassDAO,com.sgc.data.SubClassDAO"%>  

    <body style = "zoom : 80%">
        <%@include file = "Shared/header.jsp" %>    

        <div class="container" align = "Center" style="padding-bottom: 20px; padding-top: 0px;"><h3><label class="label label-primary" name = "heading"style="width: 400px; display: inline-block;"> Add Main Classification </label></h3></div>
         
        <div  class = "col-md-10 col-md-offset-1" align = "center"><h4><span  id = "errorMessage" style = "color: red"> </span></h4></div>

            <div class="container" padding-bottom = "150px">

            <form action ="AddMainClassificationController" method="get" id = "addForm" onsubmit="return formValidation();">
                
                <table class="table table-striped">
                    <tr> 
                        <td> Main Classification Id :</td> 
                        <td> <label  class="form-control"  name = "ClasssId"> Auto Generated Id </label></td>
                    </tr>

                    <tr> 
                        <td> Main Classification Name :</td> 
                        <td> <input  class="form-control" type="text" name = "ClassName" id = "ClassName" required> </td>
                    </tr>
                </table>
                <div align = "right">
                    <input type = "submit" class="btn btn-primary dropdown-toggle" name = "Save"  value="Save" style = "min-width: 200px;"/>
                    <a href="Home.jsp"><button  type = "button" class="btn btn-primary dropdown-toggle" name = "Home"  value="Home" style = "min-width: 200px;"> Cancel </button></a>
                </div>
            </form>
        </div>
    </body>
</html>


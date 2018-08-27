<%-- 
    Document   : Success
    Created on : Jul 29, 2018, 11:11:43 AM
    Author     : ex1
--%>

<%@page import="java.util.Set"%>
<%@page import="com.sgc.data.MainClassDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search All Main Classifications</title>
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

        <div class="container" align = "Center" style = "padding-bottom: 15px">
                       <div class="container" align = "Center" style="padding-bottom: 0px; padding-top: 0px;"><h3><label class="label label-primary" name = "heading" style="width: 800px; display: inline-block;"> ${Heading} </label></h3></div>

        </div> 
                       <div class="container" align = "Center" ><h4><label  id = "errorMessage"  style = "color: red" style="width: 400px; display: inline-block;"> ${ErrorText} </label></h4></div>

        <h4><div class="col-md-10 col-md-offset-1" class = "container" style = "padding-bottom:20px;">
                <form name="Search" action="SearchMainClassificationController" method="post">
                    
                    <div class="col-md-2" align = "Left" class="form-control">
                    Enter Search String:
                    </div>
                    
                    <div class="col-md-2" align = "Left" class="form-control">
                    <input type="text" name="SearchString" class="form-control"/>
                    </div>
                    
                    <div class="col-md-2" align = "Center" class="form-control">
                    Filter By:
                    </div>
                    
                    <div class="col-md-2" align = "Left" class="form-control">
                    <select name ="FilterBy" id="FilterBy" class="form-control">
                        <option value="ById" >By Classification ID</option>
                        <option value="ByName"> By Classification Name</option>                        
                    </select>
                    </div>
                    
                    <div class="col-md-2" align = "right" class="form-control">
                        <Input class="btn btn-primary dropdown-toggle" type="submit" id="SearchClass" align="right" style = "min-width: 200px;"> </input>
                    </div>
                    
                    <div class="col-md-2" align = "right" class="form-control">
                        <a href="SearchMainClassificationController?mode=search" > <button type = "button" class="btn btn-primary dropdown-toggle" style = "min-width: 200px;" align="right"> View All</button> </a>
                    </div>
                </form>
            </div></h4>

        <div class="container" align ="center" > <h4> <label>${RecordCount}</label> </h4></div>

        <div class="container col-md-10 col-md-offset-1" style="padding-bottom:150px;">          
            <table class="table table-striped" >
                
                <thead style="background-color: #357ab7; color: #fff">

                <tr>
                    <th>Main Classification ID</th>
                    <th>Main Classification Name</th>                   
                    <th> </th>

                </tr>
                </thead>
                <c:forEach items="${SetClasses}" var="mainClassification">
                    <tr>
                        <td>
                            ${mainClassification.getId()}
                        </td>
                        <td>
                            ${mainClassification.getName()}
                        </td>

                        <td>
                            <a href="ViewMainClassificationController?classId=${mainClassification.getId()}&mode=view"> View || <a/> 
                                <a href = "ViewMainClassificationController?classId=${mainClassification.getId()}&mode=edit">  Edit || <a/>
                                    <a href = "DeleteMainClassificationController?classId=${mainClassification.getId()}&mode=delete" onclick="return confirmDelete();" > Delete  <a/>
                        </td>
                    </tr>
                </c:forEach>
            </table>

        <div align ="right">
            <a href="addMainClassification.jsp"><button class="btn btn-primary dropdown-toggle" type="button" id="AddClass" align="right" style = "min-width: 200px;"> Add Main Class </button></a>
            <a href="Home.jsp"><button  type = "button" class="btn btn-primary dropdown-toggle" name = "Home"  value="Home" style = "min-width: 200px;"> Cancel </button></a>
        </div>
        </div>
    </body>
</html>

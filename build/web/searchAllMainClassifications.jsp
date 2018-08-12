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
    </head>
    <body>
        <%@include file = "Shared/header.jsp" %>    

        <div class="container" align = "Center" style = "padding-bottom: 10px">
            <h3><label class="label label-primary" name = "heading"> ${Heading}</label></h3>
        </div>      

        <h4><div class="col-md-10 col-md-offset-1" class = "container" style = "padding-bottom:20px;">
                <form name="Search" action="SearchMainClassificationController" method="post">
                    <div class="col-md-4">
                    Enter Search String:
                    <input type="text" name="SearchString"/>
                    </div>
                    
                    <div class="col-md-4">Filter By:
                    <select name ="FilterBy" id="FilterBy">
                        <option value="ById" >By Classification ID</option>
                        <option value="ByName"> By Classification Name</option>                        
                    </select>
                    </div>
                    
                    <div class="col-md-2"><Input class="btn btn-primary dropdown-toggle" type="submit" id="SearchClass" align="right" > </input></div>
                    <div class="col-md-2"><a href="SearchMainClassificationController?mode=search" > <button type = "button" class="btn btn-primary dropdown-toggle"> View All</button> </a>
                    </div>
                </form>
            </div></h4>

        <div class="container" align ="center" > <h4> <label>${Message}</label> </h4></div>

        <div class="container col-md-10 col-md-offset-1" style="padding-bottom:50px;">          
            <table class="table table-striped" >
                <tr>
                    <th>Main Classification ID</th>
                    <th>Main Classification Name</th>                   
                    <th> </th>

                </tr>
                <c:forEach items="${SetClasses}" var="mainClassification">
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
            <a href="addMainClassification.jsp"><button class="btn btn-primary dropdown-toggle" type="button" id="AddClass" align="right"> Add Main Class </button></a>
            <a href="Home.jsp"><button  type = "button" class="btn btn-primary dropdown-toggle" name = "Home"  value="Home"> Home </button></a>
        </div>
        </div>
    </body>
</html>

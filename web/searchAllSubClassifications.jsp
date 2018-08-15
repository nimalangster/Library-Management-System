<%-- 
    Document   : searchAllSubClassifications
    Created on : Aug 8, 2018, 5:25:04 PM
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

        
                        <div class="container" align = "Center" style="padding-bottom: 0px; padding-top: 0px;"><h3><label class="label label-primary" name = "heading" style="width: 800px; display: inline-block;"> ${Heading} </label></h3></div>


        <h4><div class="col-md-10 col-md-offset-1" class = "container" align="center" style = "padding-bottom:20px;">
                <form name="Search" action="SearchSubClassificationController" method="post">        
                    
                    <div class="col-md-2 col-md-offset-0" align = "Left" class="form-control">
                    Enter Search String: 
                    </div>
                    
                    <div class="col-md-2 col-md-offset-0" align = "Left" class="form-control">
                    <input type="text" name="SearchString"/> 
                    </div>
                    
                    <div class="col-md-2 col-md-offset-0" align = "Center" class="form-control">
                    Filter By:
                    </div>
                    
                    <div class="col-md-2 col-md-offset-0" align = "Left" class="form-control">
                    <select name ="FilterBy" id="FilterBy"align = "Left" class="form-control">
                        <option value="ById" >By Sub Classification ID</option>
                        <option value="ByName"> By Sub Classification Name</option>                        
                    </select>
                    </div>
                    
                    <div class="col-md-2" align = "right" class="form-control">
                    <Input class="btn btn-primary dropdown-toggle" type="submit" id="SearchClass" align="right" style = "min-width: 200px;"> </input>
                    </div>
                    
                    <div class="col-md-2" align = "right" class="form-control">
                        <a href="SearchSubClassificationController?mode=search" > <button type = "button" align="right" class="btn btn-primary dropdown-toggle" style = "min-width: 200px;"> View All</button> </a>
                    </div>    
                </form>
            </div></h4>

        <div class="container" align ="center" > <h4> <label>${Message}</label> </h4></div>

        <div class="container col-md-10 col-md-offset-1" style="padding-bottom:150px;">          
            <table class="table table-striped" >
                <tr>
                    <th>Sub Classification ID</th>
                    <th>Sub Classification Name</th>  
                    <th>Main Classification Name</th>
                    
                    <th> </th>

                </tr>
                <c:forEach items="${SetClasses}" var="subClassification">
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
                            <a href="ViewSubClassificationController?classId=${subClassification.getSubClassId()}"> View || <a/> 
                                <a href = "ViewSubClassificationController?classId=${subClassification.getSubClassId()}">  Edit || <a/>
                                    <a href = "ViewSubClassificationController?mode=ToDelete&classId=${subClassification.getSubClassId()}"> Delete  <a/>
                        </td>
                    </tr>
                </c:forEach>
            </table>

        <div align ="right">
            <a href="AddSubClassificationController"><button class="btn btn-primary dropdown-toggle" type="button" id="AddClass" align="right" style = "min-width: 200px;"> Add Sub Class </button></a>
            <a href="Home.jsp"><button  type = "button" class="btn btn-primary dropdown-toggle" name = "Home"  value="Home" style = "min-width: 200px;"> Home </button></a>
        </div>
        </div>
    </body>
</html>

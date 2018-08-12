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
           
            function populateLPY(){
              
                var select = document.getElementById("LastPrintedYear"); 
              
                var startYear = document.getElementById("YearOfPublishing").value;             
                var endYear = (new Date()).getFullYear();

                var y = parseInt(startYear.toString());
                var x = parseInt(endYear.toString());

                document.getElementById('LastPrintedYear').options.length = 0;
                while (y < x) {
                    y++;
                    var newSelect = document.createElement('option');
                    selectHTML = "<option value='" + y.toString() + "'>" + y.toString() + "</option>";
                    newSelect.innerHTML = selectHTML;
                    document.getElementById('LastPrintedYear').add(newSelect);
                }
              }
            
            
            function PopulateSubClassList() {
                    
                    var mainClassificationId = $('#category').val();
                    
                    $.ajax({
                        url: 'GetSubClassListByMainClassChangeController?mainClassificationId=' + mainClassificationId,

                        complete: function (responsex) {
                            var json = JSON.parse(responsex.responseText);
                            var noOfSubClass = Object.keys(json.SubClassification).length;
                           
                            option = '<option value = "">Select Sub Classification</option>';

                            for (var x = 0; x < noOfSubClass; x++) {
                                    option += '<option value="' + json.SubClassification[x].SubClassificationId + '">' + json.SubClassification[x].SubClassificationName + '</option>';
                                    }
                                    $('#subCategory')
                                            .find('option')
                                            .remove()
                                            .end()
                                            .append(option);
                                },
                                error: function () {
                                    console.log('Error receiving the response from json');
                                },
                            });
                            return false;
            }

        </script>

    </head>
    <%@page import="com.sgc.data.BookDAO,com.sgc.model.Book,com.sgc.data.MainClassDAO,com.sgc.data.SubClassDAO"%>  

    <%      

        List<Integer> aLYOP = new ArrayList();
        int endYear = Year.now().getValue();

        for (int i = 1500; i < endYear; i++) {
            aLYOP.add(i);
        }
        aLYOP.get(10).intValue();


    %>  
    <body>
        <%@include file = "Shared/header.jsp" %>    

        <div class="container" padding-bottom = "50px">
            <div class="jumbotron-fluid" align = "center"><h2>Add Book </h2></div>
            <form action ="AddBookController" method="post" id = "addForm">
                <table class="table table-striped">
                    <tr> 
                        <td> Book Id :</td> 
                        <td> <input  class="form-control" type="number" name = "BookId"> </td>
                    </tr>

                    <tr> 
                        <td> ISBN No :</td> 
                        <td> <input  class="form-control" type="text" name = "IsbnNo"> </td>
                    </tr>

                    <tr> 
                        <td>Title :</td> 
                        <td> <input  class="form-control" type="text" name = "Title"> </td>
                    </tr>

                    <tr> 
                        <td>Author :</td> 
                        <td> <input type="text" class="form-control" name = "Author"> </td>
                    </tr
                    <tr> 
                        <td> Publisher :</td> 
                        <td> <input  class="form-control" type="text" name = "Publisher"> </td>
                    </tr>

                    <tr> 
                        <td>No Of Pages :</td> 
                        <td> <input  class="form-control" type="number" name = "NoOfPages"> </td>
                    </tr>
                    <tr>
                        <td>Main Classification :</td> 

                        <td> 
                            <select id="category"  name = "category" class="form-control" onchange="PopulateSubClassList()">
                                <option value =""> Select Main Classification </option>
                                <c:forEach items="${SetMainClass}" var="category">
                                    <option value="${category.getId()}">${category.getName()}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>                 

                    <tr> 
                        <td> Sub Classification :</td> 
                        <td> <select name="subCategory" id="subCategory"  class="form-control" >

                                <c:forEach items="${SetSubClass}" var="subCategory">
                                    <option value="${subCategory.getSubClassId()}">${subCategory.getSubClassName()}</option>
                                </c:forEach>
                            </select> 
                        </td>
                    </tr>

                    <tr> 
                        <td> Year Of Publishing :</td> 
                        <td> <select id="YearOfPublishing" onchange="populateLPY();" name = "YearOfPublishing" class="form-control">

                                <c:forEach items="<%=aLYOP%>" var="lYOP">
                                    <option value="${lYOP.intValue()}">${lYOP.intValue()}</option>
                                </c:forEach>
                            </select> 
                        </td>
                    </tr>

                    <tr> 
                        <td> Last printed Year :</td> 
                        <td> <select  id = "LastPrintedYear" name = "LastPrintedYear" class="form-control"> 

                            </select> 
                        </td>
                    </tr>

                    <tr>                    
                        <td colspan="1" align="right">

                        </td>
                    </tr>
                </table>
                <div align = "right">
                    <input type = "submit" class="btn btn-primary dropdown-toggle" name = "Save"  value="Save" style = "min-width: 200px;"/>
                    <a href="Home.jsp"><button  type = "button" class="btn btn-primary dropdown-toggle" name = "Home"  value="Home" style = "min-width: 200px;"> Home </button></a>
                </div>
            </form>
        </div>
    </body>
</html>

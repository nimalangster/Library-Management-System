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

            function PopulateSubClassList() {

                var mainClassificationId = $('#category').val();
                
                $.ajax({
                    url: 'GetSubClassListByMainClassChangeController?mainClassificationId=' + mainClassificationId,
                    complete: function (responsex) {
                        var json = JSON.parse(responsex.responseText);
                        var noOfSubClass = Object.keys(json.SubClassification).length;

                        option = '<option  value = "">Select Sub Classification</option>';

                        for (var x = 0; x < noOfSubClass; x++) {
                            option += '<option value="' + json.SubClassification[x].SubClassificationId + '">' + json.SubClassification[x].SubClassificationName + '</option>';
                        }
                        $('#subCategory')
                                .find('option')
                                .remove()
                                .end()
                                .append(option);
                        $("#subCategory").val(${book.getSubClassification()});
                        
                    },
                    error: function () {
                        console.log('Error receiving the response from json');
                    },

                });
                return false;
            }

            function populateLPY() {

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


            $(document).ready(function () {
               
            <%                
                String mode = request.getParameter("mode");
                
            %>
                $("#category").val(${book.getMainClassification()});                 
                PopulateSubClassList();
                $("#subCategory").val(${book.getSubClassification()});
                $("#YearOfPublishing").val(${book.getYearOfPublishing()});
                $("#LastPrintedYear").val(${book.getLastPrintedYear()});                
                if(${book.getNoOfPages()} == 0){
                    $("#NoOfPages").val("---");
                }else{
                    $("#NoOfPages").val(${ book.getNoOfPages()});
                }
            });
            
            
             function formValidation(){             
                            
                var cat = $('#category').val();
                var sCat = document.getElementById("subCategory").value;             
                var errorMessage;
                
                if(!cat){
                    errorMessage = "Main Classification is mandatory!";
                    $('#errorMessage').text(errorMessage);
                    return false;
                }  
                    if (!sCat) {
                        errorMessage = "Sub Classification is mandatory!";
                        $('#errorMessage').text(errorMessage);
                        return false;
                    }
                }                       
                 
             function disableForm(){
                 
                  $("#IsbnNo", "#viewForm").prop('disabled',true);
                  $("#Title", "#viewForm").prop('disabled',true);
                  $("#Author", "#viewForm").prop('disabled',true);
                  $("#Publisher", "#viewForm").prop('disabled',true);
                  $("#NoOfPages", "#viewForm").prop('disabled',true);
                  $("#category", "#viewForm").prop('disabled',true);
                  $("#subCategory", "#viewForm").prop('disabled',true);
                  $("#YearOfPublishing", "#viewForm").prop('disabled',true);
                  $("#LastPrintedYear", "#viewForm").prop('disabled',true);
                  $("#Back", "#viewForm").prop('disabled',false);
                  $("#Delete", "#viewForm").prop('disabled',false);
                  $("#BookId", "#viewForm").prop('disabled',false);
                }   
                

        </script>

    </head>

    <%
        List<Integer> aLYOP = new ArrayList();
        int endYear = Year.now().getValue();

        for (int i = 1500; i < endYear; i++) {
            aLYOP.add(i);
        }
        aLYOP.get(10).intValue();
    %>
    
    <% if (("view".equals(mode))|| ("delete".equals(mode))) {%>
            <body style = "zoom:80%" onload="disableForm();" >
    <% } else {%>
            <body style = "zoom:80%"> <% } %> 

        <%@include file = "Shared/header.jsp" %>    
        <% if ("view".equals(mode)) {%>
                <div class="container" align = "Center" style="padding-bottom: 0px; padding-top: 0px;"><h3><label class="label label-primary" name = "heading" style="width: 400px; display: inline-block;"> View Book </label></h3></div>
         <%} else if ("edit".equals(mode)){%>
                <div class="container" align = "Center" style="padding-bottom: 0px; padding-top: 0px;"><h3><label class="label label-primary" name = "heading" style="width: 400px; display: inline-block;"> Edit Book </label></h3></div>
         <% } else if ("delete".equals(mode)) {%>   
                <div class="container" align = "Center" style="padding-bottom: 0px; padding-top: 0px;"><h3><label class="label label-primary" name = "heading" style="width: 400px; display: inline-block;"> Delete Book </label></h3></div>
                <div class="container" align = "Center" ><h4><label  id = "errorMessage"  style = "color: red" style="width: 400px; display: inline-block;"> Are you sure you want to delete this book? </label></h4></div>

        <% } %>
        <div class="container" align = "Center" ><h4><label  id = "errorMessage"  style = "color: red" style="width: 400px; display: inline-block;"> ${Message} </label></h4></div>

        <div class="container" padding-bottom = "150px">
            <% if ("delete".equals(mode)) {%>
                <form action ="DeleteBookController" method="get" id = "viewForm">
            <%}else{%>
             <form action ="EditBookController" method="get" id = "viewForm" onsubmit="return formValidation();">
            <%}%>
           
                <table class="table table-striped">
                    <tr> 
                        <td> Book Id :</td> 
                        <td> <label  class="form-control" for="id" name = "BookId"  id = "BookId"> ${book.getBookId()} </label>
                        </td>
                    </tr>

                    <tr> 
                        <td> ISBN No :</td> 
                        <td> <input  class="form-control" type="text" name = "IsbnNo" id = "IsbnNo" value = "${book.getIsbnNo()}" > </td>
                    </tr>

                    <tr> 
                        <td>Title :</td> 
                        <td> <input  class="form-control" type="text" name = "Title" id = "Title" value = "${book.getTitle()}"> </td>
                    </tr>

                    <tr> 
                        <td>Author :</td> 
                        <td> <input type="text" class="form-control" name = "Author" id = "Author"  value = "${ book.getAuthor()}"> </td>
                    </tr
                    <tr> 
                        <td> Publisher :</td> 
                        <td> <input  class="form-control" type="text" name = "Publisher"  id = "Publisher" value = "${ book.getPublisher()}"> </td>
                    </tr>

                    <tr> 
                        <td>No Of Pages :</td> 
                        <td> <input  class="form-control" type="text" name = "NoOfPages"  id = "NoOfPages"  value = ""> </td>
                    </tr>
                    <tr>
                        <td>Main Classification :</td> 
                        <td>
                            <select class="form-control" id="category" onchange="PopulateSubClassList()"  name = "category" required>
                               <option value = ""> Select Main Classification </option>
                                <c:forEach items="${SetMainClass}" var="category">
                                    <option value="${category.getId()}">${category.getName()}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>                 

                    <tr> 
                        <td> Sub Classification :</td> 
                        <td>
                            <select class="form-control" name="subCategory" id="subCategory" required>
                               <option value = ""> Select Sub Classification </option>
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
                                <c:forEach items="<%=aLYOP%>" var="lYOP">
                                    <option value="${lYOP.intValue()}">${lYOP.intValue()}</option>
                                </c:forEach>
                            </select> 
                        </td>
                    </tr>
                </table>
                <input type="hidden" value ="${book.getBookId()}" name="BookId" id="BookId"/>
                <div align = "right">
                <% if ("edit".equals(mode)) {%>    
                    <input type = "submit" class="btn btn-primary dropdown-toggle" name = "Save"  value="Save" style = "min-width: 200px;"/>
                <% } else if ("delete".equals(mode)) { %>   
                    <input type = "submit" class="btn btn-primary dropdown-toggle" name = "Delete"  id="Delete" value="Delete" style = "min-width: 200px;"/>
                <%}%>
                    <a href="ViewAllBooksController"><button  type = "button" class="btn btn-primary dropdown-toggle" name = "Back" id="Back" value="Back" style = "min-width: 200px;"> Cancel</button></a>
                </div>    
                </form> 
        </div>

    </body>
</html>

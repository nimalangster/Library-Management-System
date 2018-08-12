<%-- 
    Document   : Home.jsp
    Created on : Jul 30, 2018, 10:07:11 AM
    Author     : ex1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel = "stylesheet" href = "Contents/CSS/Menu.css">

        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script type="text/javascript">

            function submitForm(newActionValue) {
                //alert();
                // alert($("#testForm").attr('action'));

                $("#homeForm").attr('action', newActionValue);

                //alert($("#testForm").attr('action'));

                $("home#Form").submit();
            }
        </script>      

    </head>
    <body>
        <%@include file = "Shared/header.jsp" %>    



        <form id="homeForm" action = "" method ="get" name = "homeForm">
            <div  style = "padding-top:250px">     
                <div class="col-md-4" align="center" >
                    <a href = "AddBookController"><img src="Contents/Images/download.jpg" style=" "></a>
                </div>
                <div class="col-md-4" align="center">
                    <a href = "ViewAllBooksController"><img src="Contents/Images/bookView.jpg" style=" " onclick="submitForm('ViewAllBooksController')"></a>
                </div>
                <div class="col-md-4" align="center" >
                    <a href = "searchAllBooks.jsp"><img src="Contents/Images/searchBook.jpg" style=" "></a>
                </div> 
            </div>
        </form>

    </body>
</html>

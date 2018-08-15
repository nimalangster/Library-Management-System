<header>
    <div class="jumbotron text-center" style="max-height: 260px; padding-top: 30px;">
        <div class="row" style="padding-top:0px">
            <div class="col-md-1 col-md-offset-1" style="padding-top:0px; padding-bottom: 5px "><img src ="Contents/Images/logo1.jpg "></div>
            <div class="col-md-8 col-md-offset-1"><span name = "heading" style="font-size: 70px"> Library Management System </span> <p style="font-size: 45px">Book Management</p>
            </div>
            <div class="container col-md-10 col-md-offset-1" style="padding-top:0px; padding-bottom : 10px">

                <div class="dropdown col-md-3" style="padding:0px">
                    <a href="Home.jsp" <button class="btn btn-primary dropdown-toggle" style="min-width: 100%;">Home</button ></a>

                </div>

                <div class="dropdown col-md-3" style="padding:0px">
                    <button class="btn btn-primary dropdown-toggle" style="min-width: 100%;">Book</button>
                    <div class="dropdown-content">
                        <a href = "ViewAllBooksController">View All Books</a>
                        <a href = "AddBookController">Add Book</a>
                        <a href = "SearchBookController?mode=edit">Edit Book</a>
                        <a href = "SearchBookController?mode=delete">Delete Book</a>
                        <a href = "SearchBookController?mode=search">Search Book</a>
                    </div>
                </div>

                <div class="dropdown col-md-3" style="padding:0px">
                    <button class="btn btn-primary dropdown-toggle" style="min-width: 100%;">Main Classification</button>
                    <div class="dropdown-content">
                        <a href="ViewAllMainClassificationsController">View All Main Classification</a>
                        <a href="addMainClassification.jsp">Add Main Classification</a>
                        <a href="SearchMainClassificationController?from=ViewAll&mode=edit">Edit Main Classification</a>
                        <a href="SearchMainClassificationController?from=ViewAll&mode=delete">Delete  Main Classification</a>
                        <a href="SearchMainClassificationController?from=ViewAll&mode=search">Search Main Classification</a>
                    </div>
                </div>

                <div class="dropdown col-md-3" style="padding:0px">
                    <button class="btn btn-primary dropdown-toggle" style="min-width: 100%;">Sub Classification</button>
                    <div class="dropdown-content">
                        <a href="ViewAllSubClassificationsController">View All Sub Classification</a>
                        <a href="AddSubClassificationController">Add Sub Classification</a>
                        <a href="SearchSubClassificationController?from=ViewAll&mode=edit">Edit Sub Classification</a>
                        <a href="SearchSubClassificationController?from=ViewAll&mode=delete">Delete  Sub Classification</a>
                        <a href="SearchSubClassificationController?from=ViewAll&mode=search">Search Sub Classification</a>
                    </div>
                </div>
            </div>

        </div>

    </div>
</header>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Profile</title>
        <link href="https://fonts.googleapis.com/css?family=Cairo:400,600,700&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Poppins:600&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400i,700i" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Ubuntu&amp;display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/slick.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/main-color.css">

    </head>

    <body class="biolife-body">

        <jsp:include page="header.jsp"/>


        <div class="page-contain login-page">

            <!-- Main content -->
            <div id="main-content" class="main-content">
                <div class="container">

                    <div class="row">

                        <div class="col-12">
                            <h3 class="box-title" style="display: inline;">Your Account Profile</h3><br>
                            <a href="Changepassword" class="btn btn-default">Change password</a>
                            <form method="post" action="Profile">
                                <div  class="col-md-6">
                                    <label class="" >Name</label><input class="form-control" type="text" value="${sessionScope['account'].getName()}" name="name">
                                </div>
                                <div  class="col-md-6">
                                    <label class="" >Phone</label><input class="form-control" type="text" value="${sessionScope['account'].getPhone()}" name="phone">
                                </div>
                                <div  class="col-md-6">
                                    <label class="" >Email</label><input class="form-control" type="text" value="${sessionScope['account'].getEmail()}" name="email">
                                </div>
<!--                                <div  class="col-md-6">
                                    <label class="" >Password</label><input class="form-control" type="password" value="${sessionScope['account'].getPassword()}" name="pass">
                                </div>-->
                                <div  class="col-md-6">
                                    <label class="" >Gender</label><br>
                                    <input type="radio" name="gender" value="1"  ${sessionScope['account'].getGender()?"Checked":""}> Male  
                                    <input type="radio" name="gender" value="0"  ${!sessionScope['account'].getGender()?"Checked":""}> Female
                                </div>
                                <div  class="col-md-12">
                                    <label class="" >Address</label><input class="form-control" type="text" value="${sessionScope['account'].getAddress()}" name="address">
                                </div>
                                <div  class="col-md-12" style="padding: 2px;">           
                                    <input value="${sessionScope['account'].getId()}" name="id" type="hidden">
                                </div>
                                <div  class="col-md-12" style="padding: 2px;">           
                                    <p style="color: green;">${mess}</p>
                                </div>
                                <div  class="col-md-12">
                                    <input class="btn btn-primary" type="submit" value="Edit" >
                                </div>
                            </form>
                        </div>

                    </div>

                </div>

            </div>

        </div>

        <jsp:include page="footer.jsp"/>

        <!-- Scroll Top Button -->
        <a class="btn-scroll-top"><i class="biolife-icon icon-left-arrow"></i></a>

        <script src="assets/js/jquery-3.4.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.countdown.min.js"></script>
        <script src="assets/js/jquery.nice-select.min.js"></script>
        <script src="assets/js/jquery.nicescroll.min.js"></script>
        <script src="assets/js/slick.min.js"></script>
        <script src="assets/js/biolife.framework.js"></script>
        <script src="assets/js/functions.js"></script>
    </body>

</html>
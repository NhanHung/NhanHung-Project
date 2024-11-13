<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> Shop</title>

        <link href="https://fonts.googleapis.com/css?family=Cairo:400,600,700&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Poppins:600&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400i,700i" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Ubuntu&amp;display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/animate.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/nice-select.css">
        <link rel="stylesheet" type="text/css" href="assets/css/slick.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/main-color.css">


    </head>

    <body class="biolife-body">

        <jsp:include page="header.jsp"/>

        <!-- Page Contain -->
        <div class="page-contain">

            <!-- Main content -->
            <div id="main-content" class="main-content">
                <h1 style="color: green;font-size: 50px; font-weight: 700;text-align: center; ">Trang chu</h1>

                <!--Block 03: Product Tab-->
                <div class="product-tab z-index-20 sm-margin-top-193px xs-margin-top-30px">
                    <div class="container">
                        <div class="biolife-tab biolife-tab-contain sm-margin-top-34px">
                            <div class="tab-head tab-head__icon-top-layout icon-top-layout">
                                <h1 style="color: black; font-weight: 600;text-align: center; ">Moi Cap Nhat</h1>
                                <div class="row" style="margin-bottom: 50px;">
                                    <ul class="products-list" style="list-style: none;">
                                        <c:forEach var="p" items="${plist}">
                                            <li class="product-item col-lg-4 col-xs-6" style="min-height: 550px;">
                                                <div class="contain-product layout-default">
                                                    <div class="product-thumb">
                                                        <a href="./ProductDetails?pid=${p.getId()}" class="link-to-product" style="display: block; width: 300px; height: 300px; padding: auto;">
                                                            <img src="${p.getImg()}" alt="img" width="300" height="300" style="margin-left: 8%;">
                                                        </a>
                                                    </div>
                                                    <div class="info">
                                                        <h4 class="product-title"  style="margin-top: 25px;"><a style="color: white;" href="./ProductDetails?pid=${p.getId()}" class="pr-name">Name: ${p.getName()}</a></h4>
                                                        <div class="price">
                                                            <ins><span class="price-amount" style="color: white;" >Price: <span class="currencySymbol">$</span>${p.getPrice()}</span></ins>

                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="product-tab z-index-20 sm-margin-top-193px xs-margin-top-30px">
                    <div class="container">
                        <div class="biolife-tab biolife-tab-contain sm-margin-top-34px">
                            <div class="tab-head tab-head__icon-top-layout icon-top-layout">
                                <ul class="tabs md-margin-bottom-35-im xs-margin-bottom-40-im">
                                    <li class="tab-element">
                                        <h1 style="color: black; font-weight: 600; ">Ban chay nhat</h1>
                                    </li>

                                </ul>
                                <div class="row" style="margin-bottom: 50px;">
                                    <ul class="products-list" style="list-style: none;">
                                        <c:forEach var="p" items="${plist1}">

                                            <li class="product-item col-lg-4 col-xs-6">
                                                <div class="contain-product layout-default">
                                                    <div class="product-thumb">
                                                        <a href="./ProductDetails?pid=${p.getId()}" class="link-to-product" style="display: block; width: 300px; height: 300px; padding: auto;">
                                                            <img src="${p.getImg()}" alt="img" width="300" height="300" style="margin-left: 8%;">
                                                        </a>
                                                    </div>
                                                    <div class="info">
                                                        <h4 class="product-title" style="margin-top: 25px;"><a href="./ProductDetails?pid=${p.getId()}" style="color: white;" class="pr-name">${p.getName()}</a></h4>
                                                        <div class="price">
                                                            <ins ><span class="price-amount"  style="color: white;">Price: <span class="currencySymbol">$</span >${p.getPrice()}</span></ins>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>

                                    </ul>
                                </div>
                            </div>
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
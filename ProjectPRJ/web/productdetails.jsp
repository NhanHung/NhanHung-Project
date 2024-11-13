<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Products</title>

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



        <div class="page-contain single-product">
            <div class="container">

                <!-- Main content -->
                <div id="main-content" class="main-content">

                    <!-- summary info -->
                    <div class="sumary-product single-layout">
                        <div class="media">
                            <img src="${p.getImg()}" alt="" width="400" height="400">
                        </div>
                        <div class="product-attribute">
                            <h2 class="title">Name: ${p.getName()}</h2>
                            <div class="rating">
                            </div>
                            <span class="sku"><p style="font-size: 20px;">
                                    <b >Category:</b> ${p.getCategory().getName()}<br>
                                    <b> Information:</b>${p.getDescription()}<br>
                                    <b>In Stock:</b>${p.getStock()}
                                </p>
                            </span>
                            <div class="price">
                                <ins><span class="price-amount">Price:<span class="currencySymbol">$</span>${p.getPrice()}</span></ins>
                            </div>
                            <form action="./AddToCart" method="post">
                                <div class="quantity-box">
                                    <span class="title">Size: ${p.getSize()}
                                    </span>
                                    <span class="title">Quantity: ${p.getStock()}<input type="hidden" value="${p.getId()}" name="pid">
                                    </span>
                                    <input type="number" name="quantity" value="1" max="${p.getStock()}" min="1" data-step="1">
                                </div>
                                <div class="buttons" >
                                    <button type="submit" class="btn add-to-cart-btn" style="background-color: #00ffff; padding: 5px; font-size: 15px;">
                                        add to cart
                                    </button>
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
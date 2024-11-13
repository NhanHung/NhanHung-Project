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


        <div class="page-contain checkout">

            <!-- Main content -->
            <div id="main-content" class="main-content">
                <div class="container sm-margin-top-37px">
                    <div class="row">

                        <h2 class="title" style="text-align: center">Checkout</h2>


                        <!--Order Summary-->
                        <div class=" col-md-12 sm-padding-top-48px sm-margin-bottom-0 xs-margin-bottom-15px">
                            <div class="order-summary sm-margin-bottom-80px">
                                
                                <div class="cart-list-box short-type">
                                    <ul class="cart-list">
                                        <c:forEach var="cart" items="${cl}">

                                            <li class="cart-elem">
                                                <div class="cart-item">
                                                    <div class="product-thumb">
                                                        <a class="prd-thumb" href="#">
                                                            <figure><img src="${cart.getProduct().getImg()}" width="113" height="113" alt="shop-cart" ></figure>
                                                        </a>
                                                    </div>
                                                    <div class="info">
                                                        <span class="txt-quantity">${cart.getQuantity()}X</span>
                                                        <a href="#" class="pr-name">${cart.getProduct().getName()}</a>
                                                    </div>
                                                    <div class="price price-contain">
                                                        <ins><span class="price-amount"><span class="currencySymbol">$</span>${cart.getProduct().getPrice()*cart.getQuantity()}</span></ins>

                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>

                                    </ul>
                                    <ul class="subtotal">
                                        <li>
                                            <div class="subtotal-line">
                                                <b class="stt-name">Subtotal</b>
                                                <span class="stt-price">$${tt}</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="subtotal-line">
                                                <b class="stt-name">Shipping</b>
                                                <span class="stt-price">$0.00</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="subtotal-line">
                                                <b class="stt-name">total:</b>
                                                <span class="stt-price">$${tt}</span>
                                            </div>
                                        </li>
                                    </ul>
                                    <form action="Checkout" name="frm-login" method="post">
                                        <p class="form-row">
                                            <b>Shipping notes: </b> <input name="notes" type="text" style="width: 60%;" ><br>
                                            <b>Address: </b> <input name="address" type="text" value="${sessionScope['account'].getAddress()}" style="width: 60%;" ><br>
                                            <b>Phone: </b> <input name="phone" type="text" value="${sessionScope['account']. getPhone()}"   style="width: 60%;" ><br>
                                            <button style="float: right; background-color:#22d5d5; " type="submit" name="btn-sbmt" class="btn">Order</button>
                                        </p>
                                    </form>
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
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- HEADER -->
<nav class="navbar navbar-default">
    <div class="container">

        <!-- BRAND -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#alignment-example" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="HomePage">Online Shop</a>
        </div>

        <!-- COLLAPSIBLE NAVBAR -->
        <div class="collapse navbar-collapse" id="alignment-example">

            <!-- Links -->
            <ul class="nav navbar-nav">
                <li >
                    <a href="HomePage" class="nav-link" style="font-size: 20px;">Home</a>
                </li>
                <li >
                    <a href="ProductList" class="nav-link" data-title="Shop" style="font-size: 20px;" >Shop</a>
                </li>
                <li >
                    <a href="ViewCart" class="link-to">
                        Cart
                    </a>
                </li>
                <li >
                    <c:if test="${sessionScope['account'].getRoles().getId() ==2}">
                    <li ><a href="Dashboard" >Manager Page</a></li>
                    </c:if>
                </li>
            </ul>

            <!-- Search -->

            <form action="ProductList?index=1" class="navbar-form nav navbar-nav" name="desktop-seacrh" method="get">
                <input type="text" name="search"  class="input-text" value="" placeholder="Search here...">
                <button type="submit" class="btn-submit"><i class="biolife-icon icon-search"></i></button>
            </form>
            <ul class="nav navbar-nav navbar-right">

                <c:if test="${sessionScope['account']!=null}">
                    <li>    <a href="MyOrder" >My order</a>
                    </li>
                    <li ><a href="Profile" style="color: black;" class="login-link" ><i class="biolife-icon icon-login"></i>  Profile</a></li>
                    </c:if>
                    <c:if test="${sessionScope['account']==null}">
                    <li ><a href="login" style="color: black;" class="login-link" style="color: black;"><i class="biolife-icon icon-login"></i>Login/Register</a></li>
                    </c:if>
                    <c:if test="${sessionScope['account']!=null}">
                    <li ><a href="Logout" style="color: black;" class="login-link" ><i class="fa fa-sign-out" style="font-size: 18px; margin-left: 10px;" aria-hidden="true"> </i> </a></li>
                    </c:if>
            </ul>
        </div>

    </div>
</nav>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html ng-app="myApp">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <spring:url value="/resources/css/bootstrap.css" var="bootstrapCSS"/>
        <spring:url value="/resources/css/font-awesome.css" var="fontawesomeCSS"/>
        <spring:url value="/resources/js/jquery.min.js" var="jQueryJS"/>
        <spring:url value="/resources/js/bootstrap.js" var="bootstrapJS"/>
        <spring:url value="/resources/js/angular.min.js" var="angularMinJS"/>
        <spring:url value="/resources/js/my_app.js" var="myAppJS"/>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="${bootstrapCSS}"/>
        <link rel="stylesheet" type="text/css" href="${fontawesomeCSS}"/>
        <script type="text/javascript" src="${jQueryJS}"></script>
        <script type="text/javascript" src="${bootstrapJS}"></script>
        <script type="text/javascript" src="${angularMinJS}"></script>
        <script type="text/javascript" src="${myAppJS}"></script>
    </head>
    <body ng-controller="appCtrl">

        <div class="container">
            <div class="row">


                <!-- header -->
                <div class="col-md-12 header">
                    <h1 align="center">Spring inventory project</h1>
                </div>


                <!-- menu -->
                <div class="menu col-md-12">
                    <nav class="navbar navbar-inverse">
                        <div class="container-fluid">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span> 
                                </button>

                            </div>
                            <div class="collapse navbar-collapse" id="myNavbar">
                                <ul class="nav navbar-nav">
                                    <li class="active"><a href="<%= request.getContextPath()%>">Home</a></li>
                                    <li><a href="<%= request.getContextPath()%>/productpage">Insert Product</a></li>
                                    <li><a href="<%= request.getContextPath()%>/customerpage">Register Customer</a></li> 
                                </ul>
                                <ul class="nav navbar-nav navbar-right">
                                    <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                                    <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                </div>


                <div class="alert alert-success alert-dismissable">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <p ng-show="os">Oparation complete </p>
                    <p ng-show="es">Fail </p>
                </div>

                <!-- orderno, ordertype, orderdate -->
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">

                        </div>
                        <div class="panel-body">

                            <div class="col-md-4">
                                Order No:
                                <input ng-model="orderNo" class="form-control" name="orderNo" type="text"/>
                            </div>
                            <div class="col-md-4">
                                OrderType: 
                                <br/>
                                <label class="radio-inline">
                                    <input type="radio" ng-model="orderType" name="optradio" value="sell"> Sell
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" ng-model="orderType" name="optradio" value="purchase"> Purchase
                                </label>
                            </div>
                            <div class="col-md-4">
                                Order Date:
                                <input ng-model="orderDate" type="date" class="form-control"/>
                            </div>


                        </div>
                    </div>
                </div>


                <!-- product info, customer info, add to cart -->
                <div class="col-md-12">
                    <div class="row">

                        <!-- product info -->
                        <div class="col-md-4">
                            <div class="panel panel-primary">
                                <div class="panel-heading" style="text-align: center;">
                                    Product Information
                                </div>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <label for="pname">Product Name:</label>
                                        <select name="pname" 
                                                ng-model="clickedProduct" 
                                                class="form-control" 
                                                ng-options="product.pname for product in products">
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="price">Price:</label>
                                        <input ng-model="clickedProduct.price" type="text" class="form-control" id="price">
                                    </div>
                                    <div class="form-group">
                                        <label for="qty">Stock: </label>
                                        <input ng-model="clickedProduct.qty" type="text" class="form-control" id="qty">
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!-- customer info -->
                        <div class="col-md-4">
                            <div class="panel panel-primary">
                                <div class="panel-heading" style="text-align: center;">
                                    Customer Information
                                </div>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <label for="cname">Customer Name:</label>
                                        <select ng-model="clickedCustomer" class="form-control" ng-options="customer.cname for customer in customers">
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="cid">Cid: </label>
                                        <input ng-model="clickedCustomer.cid" type="text" class="form-control" id="cid">
                                    </div>
                                    <div class="form-group">
                                        <label for="phone">Phone: </label>
                                        <input ng-model="clickedCustomer.phone" type="text" class="form-control" id="phone">
                                    </div>

                                </div>
                            </div>
                        </div>


                        <!-- add to cart -->
                        <div class="col-md-4">
                            <div class="panel panel-primary">
                                <div class="panel-heading" style="text-align: center;">
                                    Order Information
                                </div>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <label for="quantity">Quantity: </label>
                                        <input ng-model="qty = 1" type="text" class="form-control" id="quantity">
                                    </div>
                                    <div class="form-group">
                                        <label for="price">Price: </label>
                                        <input value="{{clickedProduct.price * qty}}" type="text" class="form-control" id="price">
                                    </div>

                                </div>
                                <div class="panel-footer">
                                    <button ng-click="addToCart()" class="btn btn-success"><i class="fa fa-cart-plus"></i> Add to Cart</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>



                <!-- cart -->
                <div class="col-md-12">

                    <table class="table table-bordered table-striped table-responsive">
                        <thead>
                            <tr>
                                <th colspan="6">
                        <h2 align="center">
                            <i class="fa fa-cart-plus"></i> Cart {{cartProduct.length}}
                        </h2>
                        </th>
                        </tr>
                        <tr>
                            <th>NO</th>
                            <th>Product Name</th>
                            <th>Price</th>
                            <th>Qty</th>
                            <th>Remove</th>
                            <th>Total</th>
                        </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="cp in cartProduct">
                                <td>{{$index + 1}}</td>
                                <td>{{cp.pname}}</td>
                                <td>{{cp.price}}</td>
                                <td><input value="+" type="button" ng-click="qtyINC(cp)">{{cp.cartqty}}<input value="-" type="button" ng-click="qtyDec(cp)"></td>
                                <td>
                                    <button type="button" ng-click="removeCart(cp)" class="btn btn-danger">Remove</button>
                                </td>
                                <td>{{cp.subTotal}}</td>
                            </tr>
                            <tr>
                                <td colspan="5" style="text-align: right;">Final Total:</td>
                                <td>{{finalTotal}}</td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <button ng-click="checkOut()" type="button" class="btn btn-success pull-right">Checkout</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                </div>


            </div>
        </div>

    </body>
</html>

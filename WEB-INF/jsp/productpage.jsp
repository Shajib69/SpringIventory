<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                    <li><a href="<%= request.getContextPath()%>">Home</a></li>
                                    <li class="active"><a href="<%= request.getContextPath()%>/productpage">Insert Product</a></li>
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


                <div class="col-md-12">
                    <c:if test="${sm != null}">
                        <div class="alert alert-success alert-dismissable">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>

                            ${sm}

                        </div>
                    </c:if>
                    <c:if test="${em != null}">
                        <div class="alert alert-danger alert-dismissable">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>

                            ${em}

                        </div>
                    </c:if>
                </div>           


                <div class="col-md-4">

                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Insert Product
                        </div>
                        <div class="panel-body">
                            <c:if test="${product.pid == null}">
                                <form action="<%= request.getContextPath()%>/saveProduct" method="post">
                            </c:if>
                            <c:if test="${product.pid != null}">
                                <form action="<%= request.getContextPath()%>/updateProduct" method="post">
                            </c:if>
                                <div class="form-group">
                                    <label for="pid">PId:</label>
                                    <input value="${product.pid}" readonly="1" name="pid" type="text" class="form-control" id="pid">
                                </div>
                                <div class="form-group">
                                    <label for="pname">Product Name:</label>
                                    <input value="${product.pname}" name="pname" type="text" class="form-control" id="pname">
                                </div>

                                <div class="form-group">
                                    <label for="price">Price:</label>
                                    <input value="${product.price}" name="price" type="text" class="form-control" id="price">
                                </div>

                                <div class="form-group">
                                    <label for="qty">Quantity: </label>
                                    <input value="${product.qty}" name="qty" type="text" class="form-control" id="qty">
                                </div>

                                <c:if test="${product.pid == null}">
                                    <button type="submit" class="btn btn-success">Submit</button>
                                </c:if>

                                <c:if test="${product.pid != null}">
                                    <button type="submit" class="btn btn-warning">Update</button>
                                    <a href="<%= request.getContextPath()%>/productpage" class="btn btn-default pull-right">New</a>
                                </c:if>
                            </form>
                        </div>
                        <div class="panel-footer">

                        </div>
                    </div>

                </div>
                <div class="col-md-8">
                    <table class="table table-bordered table-striped table-responsive">
                        <thead>
                            <tr>
                                <th>PID</th>
                                <th>Pname</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th colspan="2">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="row" items="${products}">
                                <tr>
                                    <td>${row.pid}</td>
                                    <td>${row.pname}</td>
                                    <td>${row.price}</td>
                                    <td>${row.qty}</td>
                                    <td><a href="<%= request.getContextPath()%>/editProduct/${row.pid}">EDIT</a></td>
                                    <td><a onclick="return confirm('Are you want to delte this item?')"  href="<%= request.getContextPath()%>/deleteProduct/${row.pid}">DELETE</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>




            </div>
        </div>

    </body>
</html>

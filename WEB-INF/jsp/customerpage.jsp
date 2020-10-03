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
                                    <li><a href="<%= request.getContextPath()%>/productpage">Insert Product</a></li>
                                    <li class="active"><a href="<%= request.getContextPath()%>/customerpage">Register Customer</a></li> 
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
                            Save Customer Info
                        </div>
                        <div class="panel-body">
                            <c:if test="${customer.cid == null}">
                                <form action="<%= request.getContextPath()%>/saveCustomer" method="post">
                            </c:if>
                            <c:if test="${customer.cid != null}">
                                <form action="<%= request.getContextPath()%>/updateCustomer" method="post">
                            </c:if>
                                <div class="form-group">
                                    <label for="cid">CId:</label>
                                    <input value="${customer.cid}" readonly="1" name="cid" type="text" class="form-control" id="cid">
                                </div>
                                <div class="form-group">
                                    <label for="cname">Customer Name:</label>
                                    <input value="${customer.cname}" name="cname" type="text" class="form-control" id="cname">
                                </div>

                                <div class="form-group">
                                    <label for="Phone">Phone:</label>
                                    <input value="${customer.phone}" name="phone" type="text" class="form-control" id="phone">
                                </div>

                                

                                <c:if test="${customer.cid == null}">
                                    <button type="submit" class="btn btn-success">Submit</button>
                                </c:if>

                                <c:if test="${customer.cid != null}">
                                    <button type="submit" class="btn btn-warning">Update</button>
                                    <a href="<%= request.getContextPath()%>/customerpage" class="btn btn-default pull-right">New</a>
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
                                <th>CID</th>
                                <th>Cname</th>
                                <th>Phone</th>
                                
                                <th colspan="2">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="row" items="${customers}">
                                <tr>
                                    <td>${row.cid}</td>
                                    <td>${row.cname}</td>
                                    <td>${row.phone}</td>
                                    <td><a href="<%= request.getContextPath()%>/editCustomer/${row.cid}">EDIT</a></td>
                                    <td><a onclick="return confirm('Are you want to delte this item?')"  href="<%= request.getContextPath()%>/deleteCustomer/${row.cid}">DELETE</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>




            </div>
        </div>

    </body>
</html>

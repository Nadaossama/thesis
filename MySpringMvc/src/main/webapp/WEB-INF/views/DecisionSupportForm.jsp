<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Data Visualization</title>
  <link rel="stylesheet" media="screen" href="webjars/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.3.7/css/bootstrap-theme.min.css">
  <script type="text/javascript" src="webjars/jquery/2.1.1/jquery.min.js"></script>
  <script type="text/javascript" src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  .text-wrap {
  white-space: normal;
}
  </style>
</head>
<body>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">HydroConnect</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="${pageContext.request.contextPath}/home">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/dataVisualization">Data Visualization</a></li>
        <li><a href="${pageContext.request.contextPath}/decisionSupport">Decision Support</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>

<div  class="container theme-showcase" role="main">    
  <div class="jumbotron">
        <h2>Decision Support</h2>
      <div class="container">
  <div class="row">
    <div class="col-xs-12">
  <p class="lead text-center bg-info btn text-info center-block">Water Level</p>
      <div class="row">
        <div class="col-xs-6 text-center">
           <p class="btn"><span class="glyphicon glyphicon-arrow-down"></span>
        </div>
        <div class="col-xs-6 text-center">
          <p class="btn">
          <span class="glyphicon glyphicon-arrow-down"></span></p>
        </div>
      </div>

    </div>
  </div>
  <div class="row">
    <div class="col-xs-6 text-center">
  <p class="center-block"><span class="btn btn-success btn-lg">Low</span></p>
      <p class="btn center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
      
      <p class="bg-success text-success btn">Regulate Turbine</p>
    </div>
    <div class="col-xs-6 text-center">
      <p class="center-block"><span class="btn btn-danger btn-lg">High</span></p>
       <p class="btn center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
      <p class="bg-info text-info btn">Turn off Turbine & Activate Rack Cleaner</p>
      </div>
    </div>
  </div>
  <br>
  <br>
  
  <div class="container">
  <div class="row">
    <div class="col-xs-12">
  <p class="lead text-center bg-info btn text-info center-block">Water Temperature</p>
      <div class="row">
        <div class="col-xs-6 text-center">
           <p class="btn"><span class="glyphicon glyphicon-arrow-down"></span>
        </div>
        <div class="col-xs-6 text-center">
          <p class="btn">
          <span class="glyphicon glyphicon-arrow-down"></span></p>
        </div>
      </div>

    </div>
  </div>
  <div class="row">
    <div class="col-xs-6 text-center">
  <p class="center-block"><span class="btn btn-success btn-lg">Low</span></p>
      <p class="btn center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
      
      <p class="bg-success text-success btn">Turn on Rack heating</p>
    </div>
    <div class="col-xs-6 text-center">
      <p class="center-block"><span class="btn btn-danger btn-lg">High</span></p>
       <p class="btn center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
      <p class="bg-info text-info btn">Turbidity</p>
     <div class="row">
        <div class="col-xs-6 text-center">
           <p class="btn"><span class="glyphicon glyphicon-arrow-down"></span>
        </div>
        <div class="col-xs-6 text-center">
          <p class="btn">
          <span class="glyphicon glyphicon-arrow-down"></span></p>
        </div>
      </div>
      <div class="row">
    <div class="col-xs-6">
    <p class="center-block"><span class="btn btn-success btn-lg">Low</span></p>
     <p class="btn center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
      <p class="bg-success text-success btn text-wrap">Okay!</p>
      
    </div>
    <div class="col-xs-6 text-center">
             <p class="center-block"><span class="btn btn-danger btn-lg">High</span></p>
       <p class="btn center-block"><span class="glyphicon glyphicon-arrow-down"></span></p>
      <p class="btn bg-danger text-danger text-wrap">Turn off Turbine & Activate Rack Cleaner</p>
    </div>
      </div>
    </div>
  </div>
  
  
</div>
        </div>
    </div>
    
    <div class="container">
      <hr>
      <footer>
        <p>&copy; 2017 Connect Hydro, Inc.</p>
      </footer>
    </div> <!-- /container -->
</body>
</html>
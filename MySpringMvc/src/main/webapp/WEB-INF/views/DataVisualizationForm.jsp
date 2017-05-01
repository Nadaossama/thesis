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
  <script type="text/javascript" src="webjars/jquery/2.1.1/jquery.js"></script>
  <script type="text/javascript" src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <!-- Load c3.css -->
 <link href="webjars/c3/0.4.11/c3.css" rel="stylesheet" type="text/css">

<!-- Load d3.js and c3.js -->
<script type="text/javascript" src="webjars/d3js/3.5.5/d3.js" charset="utf-8"></script>
<script type="text/javascript" src="webjars/c3/0.4.11/c3.js"></script>
<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
</head>
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
        <li class="active"><a href="${pageContext.request.contextPath}">Home</a></li>
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
        <h2>Data Visualization</h2>
        <h3>Water level / Energy Output</h3>
         <div id="chart"></div>
         <br>
         <h3>Energy Output / Time</h3>
         <div id="chart1"></div>
         <script>
         var chart = c3.generate({
        	    data: {
        	        columns: [
        	            ['Water Level', 30, 200, 100, 400, 150, 250],
        	            ['Energy Output', 50, 20, 10, 40, 15, 25]
        	        ]
        	    },
        	    bindto: '#chart'
        	});
         
         var chart1 = c3.generate({
        	    data: {
        	        x: 'x',
//        	        xFormat: '%Y%m%d', // 'xFormat' can be used as custom format of 'x'
        	        columns: [
        	            ['x', '2013-01-01', '2013-01-02', '2013-01-03', '2013-01-04', '2013-01-05', '2013-01-06'],
//        	            ['x', '20130101', '20130102', '20130103', '20130104', '20130105', '20130106'],
        	            ['PowerPlant 1', 30, 200, 100, 400, 150, 250],
        	            ['PowerPlant 2', 130, 340, 200, 500, 250, 350]
        	        ]
        	    },
        	    axis: {
        	        x: {
        	            type: 'timeseries',
        	            tick: {
        	                format: '%Y-%m-%d'
        	            }
        	        }
        	    },
        	    bindto: '#chart1'
        	});
         </script>
       
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